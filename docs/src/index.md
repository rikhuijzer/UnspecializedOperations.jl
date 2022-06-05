# UnspecializedOperations

In many cases, having highly optimized code is not required.
However, the functions in Julia base are all highly optimized for understandable reasons.
But what if you don't care about running time but about time to first X?

This package implements unspecialized versions of Julia base functions.
The aim of these functions is to require little compilation time.
That's why most functions are implemented via for-loops.
Since loops are fast in Julia, this means that the running time of the functions are often not much slower than the Julia base versions.

## Demo

Demos of TTFX of the methods exported by this package and the methods from Julia base are shown below.
You can recognize methods from this package by the name starting with "u" from "unspecialized".

We need to warmup `@time @eval` first:

```@example demo
warmup(x) = x
@time @eval warmup(1);
# Documenter returns stdout if output is nothing # hide
nothing # hide
```

and can continue with the demo:

```@example demo
using UnspecializedOperations
```

```@example demo
@time @eval umap(Int, x -> 2x, 1:2);
nothing # hide
```

```@example demo
@time @eval map(x -> 2x, 1:2);
nothing # hide
```

```@example demo
@time @eval umapfoldl(Int, Int, x -> 2x, +, 1:2)
nothing # hide
```

```@example demo
@time @eval mapfoldl(x -> 2x, +, 1:2)
nothing # hide
```

With Julia

```@example
VERSION
```

