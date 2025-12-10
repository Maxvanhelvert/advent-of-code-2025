def get_input
  input_data = 'day4-input.txt'

  input_arr = []
  File.foreach(input_data) { |line| input_arr << line.chomp.split('')}
  input_arr
end

def start
	storage_floor = get_input
	first_row = storage_floor[1]
	last_row = storage_floor[storage_floor.length - 1]
	p last_row
end

start