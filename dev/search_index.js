var documenterSearchIndex = {"docs":
[{"location":"#UnspecializedOperations","page":"UnspecializedOperations","title":"UnspecializedOperations","text":"","category":"section"},{"location":"","page":"UnspecializedOperations","title":"UnspecializedOperations","text":"In many cases, having highly optimized code is not required. However, the functions in Julia base are all highly optimized for understandable reasons. But what if you don't care about running time but about time to first X?","category":"page"},{"location":"","page":"UnspecializedOperations","title":"UnspecializedOperations","text":"This package implements unspecialized versions of Julia base functions. The aim of these functions is to require little compilation time. That's why most functions are implemented via for-loops.","category":"page"},{"location":"","page":"UnspecializedOperations","title":"UnspecializedOperations","text":"To get the most benefits, move Vector{Any}s around because:","category":"page"},{"location":"","page":"UnspecializedOperations","title":"UnspecializedOperations","text":"A Vector{Any} can move vectors of any element around\nThere is only so much specialization that can happen on a Vector{Any}.  If you pass Vector{A}, Vector{B} and Vector{C} around, then functions will need to be compiled for those three types.  With a Vector{Any}, the functions are only compiled once.","category":"page"},{"location":"#Demo","page":"UnspecializedOperations","title":"Demo","text":"","category":"section"},{"location":"","page":"UnspecializedOperations","title":"UnspecializedOperations","text":"Demos of TTFX of the methods exported by this package and the methods from Julia base are shown below. You can recognize methods from this package by the name starting with \"u\" from \"unspecialized\".","category":"page"},{"location":"","page":"UnspecializedOperations","title":"UnspecializedOperations","text":"We need to warmup @time @eval first:","category":"page"},{"location":"","page":"UnspecializedOperations","title":"UnspecializedOperations","text":"warmup(x) = x\nidentity(1)\n@time @eval warmup(1);\n# Documenter returns stdout if output is nothing # hide\nnothing # hide","category":"page"},{"location":"","page":"UnspecializedOperations","title":"UnspecializedOperations","text":"and can continue with the demo:","category":"page"},{"location":"","page":"UnspecializedOperations","title":"UnspecializedOperations","text":"using UnspecializedOperations\n\nA = Any[1, 2];\nnothing # hide","category":"page"},{"location":"","page":"UnspecializedOperations","title":"UnspecializedOperations","text":"@time @eval umap(identity, A);\nnothing # hide","category":"page"},{"location":"","page":"UnspecializedOperations","title":"UnspecializedOperations","text":"@time @eval map(identity, A);\nnothing # hide","category":"page"},{"location":"","page":"UnspecializedOperations","title":"UnspecializedOperations","text":"@time @eval umapfoldl(identity, +, A);\nnothing # hide","category":"page"},{"location":"","page":"UnspecializedOperations","title":"UnspecializedOperations","text":"@time @eval mapfoldl(identity, +, A);\nnothing # hide","category":"page"},{"location":"","page":"UnspecializedOperations","title":"UnspecializedOperations","text":"With Julia","category":"page"},{"location":"","page":"UnspecializedOperations","title":"UnspecializedOperations","text":"VERSION","category":"page"}]
}
