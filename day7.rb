def get_input
  input_data = 'day7-input.txt'

  input_arr = []
  File.foreach(input_data) { |line| input_arr << line.chomp.chars}
  input_arr
end

def start
  tachyon = get_input
end

start