module BatchRenaming

export rename!

function match_order(ary, rg)
    medias = filter(contains(rg), ary)
    media_nums = map(x->parse(Int, match(rg, x).captures[1]), medias)
    order = sortperm(media_nums)
    medias[order]
end

function rename!(r1, r2; presuffix="", dryrun=true)
    ary = readdir()

    ary1 = match_order(ary, r1)
    ary2 = match_order(ary, r2)

    @assert length(ary1) == length(ary2)

    N1 = maximum(length, ary1)
    N2 = maximum(length, ary2)
    suf = string(presuffix, splitext(first(ary2))[end])
    if dryrun
        @show suf
        println("File matching:")
        for i in eachindex(ary1)
            println(rpad(ary1[i], N1," "), " <---- ", ary2[i])
        end
        println("Renaming:")
        for i in eachindex(ary1)
            new_name = string(first(splitext(ary1[i])), suf)
            println(rpad(ary2[i], N2," "), " ----> ", new_name)
        end
    else
        for i in eachindex(ary1)
            new_name = string(first(splitext(ary1[i])), suf)
            mv(ary2[i],new_name; force=false)
        end
    end
end

end
