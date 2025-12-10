def get_input
  input_data = 'day3-input.txt'

  input_arr = []
  File.foreach(input_data) { |line| input_arr << line.chomp}
  input_arr
end

def start
	# test_arr = ["2423222124331122221227222322344212412325322242223332512214322321331242344222241222126153122242224323"]
  input_arr = get_input
  total = 0
  
  input_arr.each do |input|
    batteries = input.split('')
    
    length = batteries.length
		number_of_digits = 12
		current_digit = 0
		num_index = 0
		index = 0
		total_num = '0'

		while current_digit < number_of_digits 
			p index = num_index
			offset = number_of_digits - current_digit - 1
			num = '0'
			
			while index < length - offset
				if num < batteries[index]
					num = batteries[index] 
					num_index = index + 1
				end
				index += 1
			end
			total_num += num
			current_digit += 1
		end

    final_num = (total_num).to_i
    total += final_num
  end
  puts total
end

start 
#previous answer too low. 164722808889389
#answer still too low. 172205503003755
