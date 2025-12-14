def get_input
  input_data = 'day7-input.txt'

  input_arr = []
  File.foreach(input_data) { |line| input_arr << line.chomp.chars}
  input_arr
end

def paths(tachyon)
  return 1 if tachyon.is_a?(String)
  possibilities = 0
    tachyon.each_with_index do |line, i|
    line.each_with_index do |pos, j|
      if pos == 'S' && tachyon[i+1][j] != '|'
        tachyon[i+1][j] = '|'
      elsif pos == '^' && tachyon[i-1][j] == '|' && tachyon[i][j-1] != '|' && tachyon[i][j+1] != '|'
        tachyon[i][j-1] = '|'
        tachyon[i][j+1] = '|'
        possibilities += paths(tachyon)
      elsif pos == '.' && tachyon[i-1][j] == '|'
        tachyon[i][j] = '|'
      else 
      next
      end
    end
  end
  return possibilities
end

def start
  tachyon = get_input
  paths(tachyon)
end

p start