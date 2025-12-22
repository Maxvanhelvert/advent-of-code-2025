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

      break if char == '{' # add implementation for joltage result. 
    end

    buttons << temp_buttons
  end

  return lights if request == 'lights'
  return buttons if request == 'buttons'
end