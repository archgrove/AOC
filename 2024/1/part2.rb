lhs = []
rhs = []

File.readlines('./part1Input.txt').each do |line|
  l, r = line.split(' ')
  lhs << l.to_i
  rhs << r.to_i
end

t = 0

lhs.each do |n|
  t += n * rhs.count(n)
end

puts t
