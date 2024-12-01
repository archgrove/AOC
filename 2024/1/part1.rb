lhs = []
rhs = []

File.readlines('./part1Input.txt').each do |line|
  l, r = line.split(' ')
  lhs << l.to_i
  rhs << r.to_i
end

lhs.sort!
rhs.sort!

t = 0

lhs.zip(rhs).each { |e| t += (e[0] - e[1]).abs }

puts t
