def get_input
  input_data = 'day4-input.txt'

  input_arr = []
  File.foreach(input_data) { |line| input_arr << line.chomp.split('')}
  input_arr
end

def start
	storage_floor = get_input
  rows = storage_floor.length
  cols = storage_floor[0].length
  total_rolls = 0

  loop do 
    removable_rolls = 0

    storage_floor.each_with_index do |row, r|
      row.each_with_index do |cell, c|
        next unless cell == '@'
        n = 0
        
        # check all 8 neighbours safely
        (-1..1).each do |dr|
          (-1..1).each do |dc|
            next if dr == 0 && dc == 0   # skip the cell itself

            nr = r + dr
            nc = c + dc

            next if nr < 0 || nr >= rows
            next if nc < 0 || nc >= cols

            n += 1 if storage_floor[nr][nc] == '@'
          end
        end
        if n < 4
          storage_floor[r][c] = 'X'
          removable_rolls += 1
        end
      end
    end
    break if removable_rolls == 0
    total_rolls += removable_rolls
  end
  total_rolls
end

p start
# first answer 6528(or so) and 7829
# second answer 1284