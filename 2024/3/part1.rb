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

  1..(whole_line.length).times do |i|
    r = parse_mul(whole_line[i..])
    if r
      t = t + r[0] * r[1]
    end
  end

  t
end

s = 0
File.readlines('./part1Input.txt').each do |line|
  s = s + parse_muls(line)
end

puts s
