def find_mas(grid, x, y)
  return 0 if grid[y][x] != 'A'

  # Top left is M, bottom right is S or
  # Top left is S, bottom right is M
  return 0 unless (grid[y-1][x-1] == 'M' && grid[y+1][x+1] == 'S') || (grid[y-1][x-1] == 'S' && grid[y+1][x+1] == 'M')

  # Top Right is M, bottom left is S or
  # Top Right is S, bottom left is M
  return 0 unless (grid[y-1][x+1] == 'M' && grid[y+1][x-1] == 'S') || (grid[y-1][x+1] == 'S' && grid[y+1][x-1] == 'M')

  return 1
end

def count_words(grid)
  t = 0

  (1...grid.length-1).each do |y|
    (1...grid[0].length-1).each do |x|
      t = t + find_mas(grid, x, y)
    end
  end

  return t
end


grid = []
File.readlines('./part1Input.txt').each do |line|
  grid << line.strip.split('')
end

puts count_words(grid)

