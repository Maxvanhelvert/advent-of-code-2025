def get_input
  input_data = 'day6-input.txt'

  input_arr = []
  File.foreach(input_data) { |line| input_arr << line.chomp.split('')}
  input_arr
end

def start
  
end

p start