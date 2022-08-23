struct Box{T<:Real}
    width::T
    height::T
    depth::T
    function Box{T}(w::T, h::T, d::T) where T <: Real
        if min(w, h, d) <= 0
            error("Lengths of the sides of the box must be positive")
        else
            new{T}(w, h, d)
        end
    end
end

function Base.parse(t::Type{Box{T}}, s::String) where T <: Real
    dims = parse.(T, split(s, "x"))
    Box{T}(dims...)
end

function sides(b::Box)
    return [
        b.width * b.height,
        b.width * b.depth,
        b.height * b.depth,
        b.width * b.height,
        b.width * b.depth,
        b.height * b.depth,
    ]
end

function wrapping_paper_required(b::Box)
    box_sides = sides(b)
    sum(box_sides) + minimum(box_sides)
end

function ribbon_required(b::Box)
    short, medium, long = sort([b.width, b.height, b.depth])
    short + short + medium + medium + (short * medium * long)
end

function solve(lines)
    boxes = parse.(Box{Int64}, lines)
    total_paper = sum(wrapping_paper_required.(boxes))
    println("Part 1: $total_paper")
    total_ribbon = sum(ribbon_required.(boxes))
    println("Part 2: $total_ribbon")
end

function main()
    if length(ARGS) > 0
        # read input from file specified as argument
        lines = readlines(ARGS[1])
    else
        # read input from stdin
        lines = readlines()
    end
    solve(lines)
end

main()
