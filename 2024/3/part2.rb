def parse_do(s)
  s.start_with?("do()")
end

def parse_dont(s)
  s.start_with?("don't()")
end

def parse_mul(s)
  return nil unless s.start_with?("mul")

  r = /^mul\((\d+),(\d+)\).*/.match(s)

  if r
    return $1.to_i, $2.to_i
  end

  return nil
end

def parse_muls(whole_line)
  t = 0
  act = true

  1..(whole_line.length).times do |i|
    l = whole_line[i..]

    if parse_dont(l)
      act = false
      next
    end

    if parse_do(l)
      act = true
      next
    end

    r = parse_mul(whole_line[i..])
    if r && act
      t = t + r[0] * r[1]
    end
  end

  t
end

l = ""
File.readlines('./part1Input.txt').each do |line|
  l = l + line
end

puts parse_muls(l)
