module UnspecializedOperations

if isdefined(Base, :Experimental) && isdefined(Base.Experimental, Symbol("@optlevel"))
    @eval Base.Experimental.@optlevel 1
end
if isdefined(Base, :Experimental) && isdefined(Base.Experimental, Symbol("@max_methods"))
    @eval Base.Experimental.@max_methods 1
end

export umap, umapfoldl

function umap(T::DataType, f, @nospecialize(A))
    l = length(A)
    out = Vector{T}(undef, l)
    for i in 1:l
        out[i] = f(A[i])
    end
    return out
end
umap(f, @nospecialize(A)) = umap(Any, f, A)

struct _InitialValue end

function umapfoldl(InterT::DataType, OutT, f, op, @nospecialize(A); init=_InitialValue())
    if isempty(A)
        return init::_InitialValue
    else
        l = length(A)
        applied = Vector{InterT}(undef, l)

        # map
        for i in 1:l
            applied[i] = f(A[i])
        end

        # reduce
        if init isa _InitialValue
            out = applied[1]
            for e in applied[2:end]
                out = op(out, e)
            end
            return out::OutT
        else
            out = init
            for e in applied
                out = op(out, e)
            end
            return out::OutT
        end
    end
end
umapfoldl(f, op, @nospecialize(A); init=_InitialValue()) = umapfoldl(Any, Any, f, op, A; init)

if ccall(:jl_generating_output, Cint, ()) == 1
    umap(Int, x -> 2x, 1:2)
    umapfoldl(x -> 2x, +, 1:2)
end

end # module
