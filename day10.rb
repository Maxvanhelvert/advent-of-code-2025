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

def get_lights(arr, length)
  start_lights = Array.new(length) { |l| l = '.'} 

  arr.each do |combination|
    combination.each do |button|
      if start_lights[button] == '.'
        start_lights[button] = '#'
      else 
        start_lights[button] = '.'
      end
    end
  end
  start_lights
end

def start
  all_lights = get_input('lights')
  all_buttons = get_input('buttons')
  total_length = 0

  all_lights.each_with_index do |solution, i|

    length = 0
    buttons = all_buttons[i]
    
    n = 1
    while n < buttons.length
      buttons.permutation(n).each do |perm|
        final_lights = get_lights(perm, solution.length)
        length = perm.length
        break if final_lights == solution
      end
      n += 1
    end 
    p total_length += length
    n = 1
  end
end

start