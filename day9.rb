def get_input
  input_data = 'day9-input.txt'

  input_arr = []
  File.foreach(input_data) { |line| input_arr << line.chomp.split(',')}
  input_arr.map! do |line|
    line.map! { |val| val.to_i}
  end
  input_arr
end

p get_input