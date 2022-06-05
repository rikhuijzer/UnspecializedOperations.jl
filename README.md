# UnspecializedOperations.jl

Reduce compilation time via less specialized versions of Julia base functions.

## Notes

- Most methods are implemented with simple loops because other things from base often need one or more specialized methods.
