def get_fresh
  input_data = 'day5-input.txt'

  fresh_arr = []
  File.foreach(input_data) do |line|
    if line.include?('-')
      fresh_arr << line.chomp
    end
  end
  fresh_arr
end

def get_id
  input_data = 'day5-input.txt'

  id_arr = []
  File.foreach(input_data) do |line|
    id_arr << line.chomp unless line.include?('-')
  end
  id_arr.shift
  id_arr
end

def start
  fresh_items = 0
  ids = get_id
  fresh = get_fresh

  fresh.each do |fresh_id|
    fresh_range = fresh_id.split('-')
    first = fresh_range[0]
    last = fresh_range[1]
    ids.each do |id|
      if id >= first && id <= last
        ids.delete(id)
        fresh_items += 1
      end
    end
    p ids.length
  end
  fresh_items
end

p start
# first answer 901 too high