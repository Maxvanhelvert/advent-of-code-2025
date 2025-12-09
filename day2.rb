def get_input
  input = File.open('day2-input.txt')
  input_data = input.read.split(',')
  final_input = []

  input_data.each do |range|
    split = range.split('-')
    split.each do |num| 
      final_input << num.to_i
    end
  end
  final_input
end

def num_to_array(num)
    num.to_s.chars.map(&:to_i)
end


def check_num(dig) 
  # true if num[0...mid] == num[mid..last] 
  n = dig.length #4
  num = dig.join #1212
  half = n/2 #2
  range = (1..half) #range = 1,2

  range.each do |size| # size = 2
    next unless n % size == 0 # 4 / 2 = 0

    pattern = num[0, size] # patter = 12
    return true if pattern * (n/size) == num # [12] x 2 (1212) == 1212
  end

  false
  # next, to check all possible combinations of duplicates (so the same number repeated, same set of numbers repeated.)
  # Now, an ID is invalid if it is made only of some sequence of digits repeated at least twice. 
  # So, 12341234 (1234 two times), 123123123 (123 three times), 1212121212 (12 five times), and 1111111 (1 seven times) are all invalid IDs.
end

def start
  final_input = get_input
  total = 0

  until final_input.empty?
    first_num = final_input.shift
    last_num = final_input.shift
    current_num = first_num

    while current_num <= last_num
      num_arr = num_to_array(current_num)
      total += current_num if check_num(num_arr)
      current_num += 1
    end

  end
  total
end

p start