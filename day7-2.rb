def get_input
  input_data = 'day7-input.txt'

  input_arr = []
  File.foreach(input_data) { |line| input_arr << line.chomp.chars}
  input_arr
end

def start
  tachyon = get_input
  tachyon.each_with_index do |line, i|
    line.each_with_index do |pos, j|
      if pos == 'S'
        tachyon[i+1][j] = 1
      elsif pos == '^' && tachyon[i-1][j].is_a?(Integer)
        if tachyon[i][j-1] == '.'
          tachyon[i][j-1] = tachyon[i-1][j]
        else 
          tachyon[i][j-1] += tachyon[i-1][j]
        end
        if tachyon[i][j+1] == '.'
          tachyon[i][j+1] = tachyon[i-1][j]
        else 
          tachyon[i][j+1] += tachyon[i-1][j]
        end
      elsif pos == '.' && tachyon[i-1][j].is_a?(Integer)
        tachyon[i][j] = tachyon[i-1][j]
      else 
      next
      end
    end
  end
  possibilities = 0
  tachyon[-1].each do |pos|
    if pos.is_a?(Integer)
      possibilities += pos
    end
  end
  possibilities
end

p start
# 72555440012 too low