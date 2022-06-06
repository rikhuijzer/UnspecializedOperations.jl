# UnspecializedOperations

In many cases, having highly optimized code is not required.
However, the functions in Julia base are all highly optimized for understandable reasons.
But what if you don't care about running time but about time to first X?

This package implements unspecialized versions of Julia base functions.
The aim of these functions is to require little compilation time.
That's why most functions are implemented via for-loops.

To get the most benefits, move Vector{Any}s around because:

1. A Vector{Any} can move vectors of **any** element around
2. There is only so much specialization that can happen on a Vector{Any}.
    If you pass Vector{A}, Vector{B} and Vector{C} around, then functions will need to be compiled for those three types.
    With a Vector{Any}, the functions are only compiled once.

## Demo

Demos of TTFX of the methods exported by this package and the methods from Julia base are shown below.
You can recognize methods from this package by the name starting with "u" from "unspecialized".

We need to warmup `@time @eval` first:

```@example demo
warmup(x) = x
identity(1)
@time @eval warmup(1);
# Documenter returns stdout if output is nothing # hide
nothing # hide
```

and can continue with the demo:

```@example demo
using UnspecializedOperations

A = Any[1, 2];
nothing # hide
```

```@example demo
@time @eval umap(identity, A);
nothing # hide
```

```@example demo
@time @eval map(identity, A);
nothing # hide
```

```@example demo
@time @eval umapfoldl(identity, +, A);
nothing # hide
```

```@example demo
@time @eval mapfoldl(identity, +, A);
nothing # hide
```

With Julia

```@example
VERSION
```

