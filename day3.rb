def get_input
  input_data = 'day3-input.txt'

  input_arr = []
  File.foreach(input_data) { |line| input_arr << line.chomp}
  input_arr
end

def start
  input_arr = get_input
  total = 0
  input_arr.each do |input|
    batteries = input.split('')
    
    length = batteries.length
    first_num_index = 0
    start = 0
    first_num = '0'
    sec_num = '0'

    while start < length - 1
      if batteries[start] > first_num
        first_num = batteries[start] 
        first_num_index = start
        sec_num = batteries[start+1]
      end
      start += 1
    end
    second = first_num_index + 1

    while second < length
      if batteries[second] > sec_num
        sec_num = batteries[second]
      end
      second += 1
    end
    final_num = (first_num + sec_num).to_i
    total += final_num
  end
  # get first value of input array, 
  # change str to array of integers
  # assign first value of array to ver first_num, assign its index to first_num_index
  # look through array from 0 to length -2 (leave off last index), assign value to first_num if current > first_num
  # when finished, look through array for sec_num in range (first_num_index + 1...length)
  # assign value to sec_num if value > sec_num
  # 
  # num = first_num.append(sec_num)
  # total += num
  # 
  # loop for each value in input
  puts total
end

start