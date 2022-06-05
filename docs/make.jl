using Documenter:
    DocMeta,
    HTML,
    asset,
    deploydocs,
    makedocs
using UnspecializedOperations

DocMeta.setdocmeta!(
    UnspecializedOperations,
    :DocTestSetup,
    :(using UnspecializedOperations);
    recursive=true
)

sitename = "UnspecializedOperations.jl"
pages = [
    "UnspecializedOperations" => "index.md"
]

prettyurls = get(ENV, "CI", nothing) == "true"
format = HTML(; prettyurls)
modules = [UnspecializedOperations]
strict = true
checkdocs = :none
makedocs(; sitename, pages, format, modules, strict, checkdocs)

deploydocs(;
    devbranch="main",
    repo="github.com/rikhuijzer/UnspecializedOperations.jl.git",
    push_preview=false
)
