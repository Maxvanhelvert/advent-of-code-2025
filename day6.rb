def get_input
  input_data = 'day6-input.txt'

  input_arr = []
  File.foreach(input_data) { |line| input_arr << line.chomp.split(' ')}
  input_arr
end

def start
  maths_homework = get_input
  total = 0
  first = maths_homework[0].map { |num| num.to_i}
  second = maths_homework[1].map { |num| num.to_i}
  third = maths_homework[2].map { |num| num.to_i}
  fourth = maths_homework[3].map { |num| num.to_i}
  operators = maths_homework[4]

  operators.each_with_index do |operator, i|
    if operator == '+'
      p result = (first[i] + second[i] + third[i] + fourth[i])
    else
      p result = (first[i] * second[i] * third[i] * fourth[i])
    end
    total += result
  end
  total
end

p start
# 250521 too low
# 4979937369052 too high