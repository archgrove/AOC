def strictly_monotone?(level)
  monotone = level[1..].zip(level).map { |e| e[0] - e[1] }

  monotone.all? { |e| e < 0 } || monotone.all? { |e| e > 0 }
end

def minimal_diffs?(level)
  level[1..].zip(level).all? { |e| (e[0] - e[1]).abs.between?(1,3) }
end

def safe?(level)
  strictly_monotone?(level) && minimal_diffs?(level)
end

def any_safe?(level)
  levels = [level]
  (0..(level.length - 1)).each do |i|
    levels << level.dup.tap { |l| l.delete_at(i) }
  end

  levels.any? { |l| safe?(l) }
end

levels = []

File.readlines('./part1Input.txt').each do |line|
  levels << line.split(' ').map(&:to_i)
end

puts levels.count { |l| any_safe?(l) }
