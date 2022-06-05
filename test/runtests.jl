using Test
using UnspecializedOperations

@test umap(x -> 2x, 1:2) == Any[2, 4]
@test umap(Int, x -> 2x, 1:2) == [2, 4]

@test umapfoldl(x -> 2x, +, 1:2) == 6
