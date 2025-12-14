def get_input
  input_data = 'day6-input.txt'

  input_arr = []
  File.foreach(input_data) { |line| input_arr << line.chomp.split(' ')}
  input_arr
end

def find_longest(first, second, third, fourth)
  [first.length, second.length, third.length, fourth.length].max
end

def start
  maths_homework = get_input
  total = 0
  first = maths_homework[0]
  second = maths_homework[1]
  third = maths_homework[2]
  fourth = maths_homework[3]
  operators = maths_homework[4]

  operators.each_with_index do |operator, i|
    longest_length = find_longest(first[i], second[i], third[i], fourth[i])
    count = 0
    sum = 0
    first_row = first[i].chars
    second_row = second[i].chars
    third_row = third[i].chars
    fourth_row = fourth[i].chars

    while count < longest_length
      new_num = ''
      new_num << first_row[count] unless first_row[count] == nil
      new_num << second_row[count] unless second_row[count] == nil
      new_num << third_row[count] unless third_row[count] == nil
      new_num << fourth_row[count] unless fourth_row[count] == nil
      num = new_num.to_i

      if operator == '+'
        sum += num unless num == 0
      else 
        sum *= num unless num == 0
      end
      count += 1
    end

    p total += sum
    sum = 0
  end
  total
end

p start
# 5204412 too low