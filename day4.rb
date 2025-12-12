def get_input
  input_data = 'day4-input.txt'

  input_arr = []
  File.foreach(input_data) { |line| input_arr << line.chomp.split('')}
  input_arr
end

def start
  storage_floor = get_input
  total_rolls = 0

  storage_floor.each_with_index do |row, r|
	  row.each_with_index do |cell, c|
      next unless cell == '@'
			n = 0
      
      n += 1 if storage_floor[r-1][c-1] == '@'
      n += 1 if storage_floor[r-1][c] == '@'
      n += 1 if storage_floor[r-1][c+1] == '@'
      n += 1 if storage_floor[r][c-1] == '@'
      n += 1 if storage_floor[r][c+1] == '@'
			if r < 136
				n += 1 if storage_floor[r+1][c-1] == '@'
				n += 1 if storage_floor[r+1][c] == '@'
				n += 1 if storage_floor[r+1][c+1] == '@'
      end 
      total_rolls += 1 if n < 4
    end
  end
  total_rolls
end

p start
# first answer 6528(or so) and 7829 too high
# second answer 1284 too low
# third answer 1333 too low