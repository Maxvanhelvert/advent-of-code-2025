def get_input
  input_data = 'day4-input.txt'

  input_arr = []
  File.foreach(input_data) { |line| input_arr << line.chomp}
  input_arr
end

puts get_input