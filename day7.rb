def get_input
  input_data = 'day7-input.txt'

  input_arr = []
  File.foreach(input_data) { |line| input_arr << line.chomp.chars}
  input_arr
end

def start
  tachyon = get_input
  splits = 0
  tachyon.each_with_index do |line, i|
    line.each_with_index do |pos, j|
      if pos == 'S'
        tachyon[i+1][j] = '|'
      elsif pos == '^' && tachyon[i-1][j] == '|'
        tachyon[i][j-1] = '|'
        tachyon[i][j+1] = '|'
        splits += 1
      elsif pos == '.' && tachyon[i-1][j] == '|'
        tachyon[i][j] = '|'
      else 
      next
      end
    end
  end
  splits
end

p start