def get_input(request)
  input_data = 'day10-input.txt'

  brackets = ['[', ']', '(', ')', ',', ' ']

  lights = []
  buttons = []

  File.foreach(input_data) do |line|
    temp_buttons = []
    temp = []

    line.each_char do |char|

      temp << char unless brackets.include?(char)

      if char == ']' 
        lights << temp
        temp = []
      end

      if char == ')' 
        temp.map! { |char| char.to_i}
        temp_buttons << temp
        temp = []
      end

      break if char == '{'
    end

    buttons << temp_buttons
  end

  return lights if request == 'lights'
  return buttons if request == 'buttons'
end

def start
  all_lights = get_input('lights')
  all_buttons = get_input('buttons')
  total_length = 0

  all_lights.each_with_index do |solution, i|
    start_lights = Array.new(solution.length) { |l| l = '.'}

    length = 0
    possible_combinations = []
    buttons = all_buttons[i]
    
    (1...buttons.length).each do |n|
      possible_combinations << buttons.permutation(n)
    end

    possible_combinations.each do |combination|
      start_lights = get_lights
      break if start_lights == solution

      length = combination.length
    end

    total_length += length
  end
end

start