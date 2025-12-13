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
  fresh_range
end

def start
  p fresh_range = get_fresh
  all_ids = []

  fresh_range.each do |range|
    first = range[0].to_i 
    last = range[1].to_i
    
    (first..last).each do |current|
      next if all_ids.include?(current)
      all_ids << current
    end
  end
  all_ids
end

p start