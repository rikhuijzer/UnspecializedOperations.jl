module UnspecializedOperations

if isdefined(Base, :Experimental) && isdefined(Base.Experimental, Symbol("@optlevel"))
    @eval Base.Experimental.@optlevel 1
end
if isdefined(Base, :Experimental) && isdefined(Base.Experimental, Symbol("@max_methods"))
    @eval Base.Experimental.@max_methods 1
end

# Notes:
# - Using @noinline to avoid compiling function bodies twice.

@noinline function umap(T::Type, f, @nospecialize(A))
    l = length(A)
    out = Vector{T}(undef, l)
    for i in 1:l
        out[i] = f(A[i])
    end
    return out
end
umap(f, @nospecialize(A)) = umap(Any, f, A)
precompile(umap, (Function, Vector{Any}))
export umap

struct _InitialValue end

@noinline function umapfoldl(
        InterT::Type,
        OutT::Type,
        f,
        op,
        @nospecialize(A);
        init=_InitialValue()
    )
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
precompile(umapfoldl, (Function, Function, Vector{Any}))
export umapfoldl

if ccall(:jl_generating_output, Cint, ()) == 1
end

end # module
