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

def get_id
  input_data = 'day5-input.txt'

  id_arr = []
  File.foreach(input_data) do |line|
    id_arr << line.chomp unless line.include?('-')
  end
  id_arr.shift
  final = []
  id_arr.each {|id| final << id.to_i}
  final
end

def start
  fresh_items = 0
  ids = get_id
  fresh = get_fresh

  fresh.each do |fresh_range|
    first = fresh_range[0].to_i
    last = fresh_range[1].to_i

    ids.each_with_index do |id, i|
      next if id == 'x'
      if id >= first && id <= last
        ids[i] = 'x'
        fresh_items += 1
      end
    end
  end
  fresh_items
end

p start
# first answer 901 too high
# second answer 937