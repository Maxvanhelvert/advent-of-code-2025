input = 'day1-input.txt'

input_arr = []
File.foreach(input) { |line| input_arr << line.chomp}

example = ['L68', 'L30', 'R48', 'L5', 'R60', 'L55', 'L1', 'L99', 'R14', 'L82']
zeros = 0
value = 50

example.each do |input|
  p input
  if input.chr == 'R'
    num = input.delete('R')
    i = num.to_i
    value += i
    while value > 99
      zeros += 1
      value -= 100
    end
    zeros += 1 if value == 0
  else
    num = input.delete('L')
    i = num.to_i
    value -= i
    while value < 0
      zeros += 1
      value += 100
    end
    zeros += 1 if value == 0
  end
  
  p value
  p "zeros: #{zeros}"
end

p zeros
