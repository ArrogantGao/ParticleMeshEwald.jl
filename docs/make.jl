using ParticleMeshEwald
using Documenter

DocMeta.setdocmeta!(ParticleMeshEwald, :DocTestSetup, :(using ParticleMeshEwald); recursive=true)

makedocs(;
    modules=[ParticleMeshEwald],
    authors="Xuanzhao Gao <xgao@flatironinstitute.org> and contributors",
    sitename="ParticleMeshEwald.jl",
    format=Documenter.HTML(;
        canonical="https://ArrogantGao.github.io/ParticleMeshEwald.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/ArrogantGao/ParticleMeshEwald.jl",
    devbranch="main",
)
