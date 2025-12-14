def get_input
  input_data = 'day6-input.txt'

  input_arr = []
  File.foreach(input_data) { |line| input_arr << line.chomp.chars}
  input_arr
end

def find_longest(first, second, third, fourth)
  [first.length, second.length, third.length, fourth.length].max
end

def start
  maths_homework = get_input
  total = 0
  first = maths_homework[0].reverse
  second = maths_homework[1].reverse
  third = maths_homework[2].reverse
  fourth = maths_homework[3].reverse
  operators = maths_homework[4].reverse
  first_row = ''
  second_row = ''
  third_row = ''
  fourth_row = ''


  operators.each_with_index do |operator, i|
 
    first_row << first[i]
    second_row << second[i]
    third_row << third[i]
    fourth_row << fourth[i]

    next if operator == ' '

    longest_length = find_longest(first_row, second_row, third_row, fourth_row)
    count = 0
    sum = (operator == '*') ? 1 : 0

    while count < longest_length
      new_num = ''
      new_num << first_row[count] unless first_row[count] == nil || first_row[count] == ' '
      new_num << second_row[count] unless third_row[count] == nil || second_row[count] == ' '
      new_num << third_row[count] unless third_row[count] == nil || third_row[count] == ' '
      new_num << fourth_row[count] unless fourth_row[count] == nil|| fourth_row[count] == ' '
      num = new_num.to_i

      if operator == '+'
        sum += num 
      else
        sum *= num unless num == 0
      end
      count += 1
    end
    total += sum
    sum = 0

    first_row = ''
    second_row = ''
    third_row = ''
    fourth_row = ''
  end
  total
end

p start
# 5204412 too low
# 80213519303036382 too high
# 4693159084994 too low
# 55110563122 too low
