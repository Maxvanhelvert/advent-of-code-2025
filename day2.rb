input = File.open('day2-input.txt')
input_data = input.read.split(',')

final_input = []

input_data.each do |range|
  split = range.split('-')
  split.each do |num| 
    final_input << num.to_i
  end
end

