def get_input
  input_data = 'day6-input.txt'

  input_arr = []
  File.foreach(input_data) { |line| input_arr << line.chomp.split(' ')}
  input_arr
end

def find_longest(first, second, third, fourth)
  longest = [first, second, third, fourth].max
  arr = longest.split('')
  length = arr.length
  length
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
    length = find_longest(first[i], second[i], third[i], fourth[i])
    # for each number(string), take the first digit (convert to int).
    # merge first[0], second[0], third[0], fourth[0] ... until i > lenght (as long as each number has digits)
    # take those (up to four) numbers and add or multiply them according to operator.
  end
end

start