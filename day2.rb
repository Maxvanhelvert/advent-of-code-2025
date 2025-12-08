input = File.open('day2-input.txt')
input_data = input.read.split(',')

final_input = []

input_data.each do |range|
  split = range.split('-')
  split.each do |num| 
    final_input << num.to_i
  end
end

def num_to_array(num)
    num.to_s.chars.map(&:to_i)
end

total = 0

def check_num(num, mid, last) 
  true if num[0...mid] == num[mid..last]
end

until final_input.empty?
  first_num = final_input.shift
  last_num = final_input.shift
  current_num = first_num

  while current_num <= last_num
    num_arr = num_to_array(current_num)
    last = num_arr.length
    mid = last / 2
    total += current_num if check_num(num_arr, mid, last)
    current_num += 1
  end

end

p total