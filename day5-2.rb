def get_fresh
  input_data = 'day5-input.txt'

  fresh_arr = []
  File.foreach(input_data) do |line|
    if line.include?('-')
      fresh_arr << line.chomp
    end
  end
  fresh_range = []
  fresh_arr.each {|range| fresh_range << range.split('-')}
  final = []
  fresh_range.each do |range|
    first = range[0].to_i
    last = range[1].to_i
    final << [first, last]
  end
  final.sort
end

def start
  fresh_range = get_fresh

  final_range = []
  
  fresh_range.each do |first, last|
    if final_range.empty? || first > final_range[-1][1]
      final_range << [first, last]
    else
      final_range[-1][1] = [final_range[-1][1], last].max
    end
  end

  final_range.sum {|a, b| b - a + 1}
end

p start