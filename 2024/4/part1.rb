def find_word_dir(word, grid, x, y, direction)
  return true if word.length == 0

  return false if y < 0
  return false if y >= grid.length
  return false if x < 0
  return false if x >= grid[0].length

  return false if grid[y][x] != word[0]

  return find_word_dir(word[1..], grid, x + direction[0], y + direction[1], direction)
end

def find_word(word, grid, x, y)
  dirs = [
    [0, -1], # N
    [1, -1], # NE
    [1, 0], # E
    [1, 1], # SE
    [0, 1], # S
    [-1, 1], # SW
    [-1, 0], # W
    [-1, -1] # NW
  ]

  dirs.count { |d| find_word_dir(word, grid, x, y, d) }
end

def count_words(word, grid)
  t = 0

  (0...grid.length).each do |y|
    (0...grid[0].length).each do |x|
      t = t + find_word(word, grid, x, y)
    end
  end

  return t
end


grid = []
File.readlines('./part1Input.txt').each do |line|
  grid << line.strip.split('')
end

puts count_words("XMAS", grid)

