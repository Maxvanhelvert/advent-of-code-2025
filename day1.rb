input_data = 'day1-input.txt'

input_arr = []
File.foreach(input_data) { |line| input_arr << line.chomp}

example = ['L68', 'L30', 'R48', 'L5', 'R60', 'L55', 'L1', 'L99', 'R14', 'L82']

zeros = 0
start = 50

def zero_hits_right(start, steps)
  first = (100 - start) % 100
  first = 100 if first == 0

  return 0 if steps < first
  1 + (steps - first) / 100
end

def zero_hits_left(start, steps)
  zero_hits_right((100 - start) % 100, steps)
end

input_arr.each do |input|
  direction = input[0]
  steps = input[1..].to_i

  if direction == 'R'
    zeros += zero_hits_right(start, steps)
    start = (start + steps) % 100
  else
    zeros += zero_hits_left(start, steps)
    start = (start - steps) % 100
    start += 100 if start < 0
  end
end

p zeros
