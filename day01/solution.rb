s = File.read("input.txt")

# Part 1
p s.bytes.sum{40.5<=>_1}

# Part 2
p 1+s.bytes.index{|c|0>$.+=40.5<=>c}
