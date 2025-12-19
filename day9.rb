def get_input
  input_data = 'day9-input.txt'

  input_arr = []
  File.foreach(input_data) { |line| input_arr << line.chomp.split(',')}
  input_arr.map! do |line|
    line.map! { |val| val.to_i}
  end
  input_arr
end

def get_area(first, second)
  dx = (second[0] - first[0]).abs + 1
  dy = (second[1] - first[1]).abs + 1

  dx * dy
end

def start
  tiles = get_input

  largest_area = 0

  tiles.each do |corner_one|
    tiles.each do |corner_two|
      area = get_area(corner_one, corner_two)

      largest_area = area if area > largest_area
    end
  end

  largest_area
end

p start

# first answer 4781377701