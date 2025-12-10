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
	number_of_digits = 12
	current_digit = 0


	while current_digit < number_of_digits 
	    num_index = 0
		index = 0
		num = '0'
		total_num = '0'
		
		while index < length - (number_of_digits - current_digit)
		  if batteries[index] > num
			num = batteries[index] 
			num_index = index
		  end
		  index += 1
		end
		total_num = total_num + num
		current_digit += 1
	end

    final_num = (total_num).to_i
    total += final_num
  end
  puts total
end

start 
#previous answer too low. 164722808889389
#current answer 1593 - not sure where the mistake is, it should be at least 12 digits long