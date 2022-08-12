s = File.read("input.txt")

# Part 1
p s.bytes.sum{(-1)**_1}

# Part 2
p 1+s.bytes.index{0>$.+=(-1)**_1}
