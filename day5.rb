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
    id_arr << line.chomp unless line.empty? || line.include?('-')
  end
  id_arr
end
