"""
    TagBot(; gpgsign=false)

Adds GitHub release support via [TagBot](https://github.com/JuliaRegistries/TagBot).

## Keyword Arguments
- `gpgsign::Bool`: Whether or not to enable GPG signing of tags.
"""
@with_kw_noshow struct TagBot <: BasicPlugin
    gpgsign::Bool = false
end

source(::TagBot) = default_file("github", "workflows", "TagBot.yml")
destination(::TagBot) = joinpath(".github", "workflows", "TagBot.yml")
tags(::TagBot) = "<<", ">>"
view(p::TagBot) = Dict("GPG" => p.gpgsign)
