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

def check_num(dig) 
  # true if num[0...mid] == num[mid..last] 
  n = dig.length
  num = dig.join
  half = n/2
  range = (1..half)

  range.each do |size|
    next unless n % size == 0

    pattern = num[0, size]
    return true if pattern * (n/size) == num
  end
  # next, to check all possible combinations of duplicates (so the same number repeated, same set of numbers repeated.)
  # Now, an ID is invalid if it is made only of some sequence of digits repeated at least twice. 
  # So, 12341234 (1234 two times), 123123123 (123 three times), 1212121212 (12 five times), and 1111111 (1 seven times) are all invalid IDs.
end

until final_input.empty?
  first_num = final_input.shift
  last_num = final_input.shift
  current_num = first_num

  while current_num <= last_num
    num_arr = num_to_array(current_num)
    last = num_arr.length
    mid = last / 2
    total += current_num if check_num(num_arr)
    current_num += 1
  end

end

p total