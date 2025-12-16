def get_input
  input_data = 'day8-input.txt'

  input_arr = []
  File.foreach(input_data) { |line| input_arr << line.chomp.split(',')}
  input_arr.map! do |line|
    line.map! { |val| val.to_i}
  end
  input_arr
end

def diff(point_a, point_b)
  dx = (point_a[0] - point_b[0]) ** 2
  dy = (point_a[1] - point_b[1]) ** 2
  dz = (point_a[2] - point_b[2]) ** 2
  diff_sqr = dx + dy + dz
  Math.sqrt(diff_sqr)
end

def generate_connections(boxes)
  connections = []
  
  (0...boxes.length).each do |i|
    (i+1...boxes.length).each do |j|
      connections << [diff(boxes[i], boxes[j]), i, j]
    end
  end

  connections.sort_by!(&:first)
end

def start
  boxes = get_input
  connections = generate_connections(boxes)
  # next step, connecting boxes into circuits. 
  # for each 0...1000 if add the boxes to a current circuit if one of them is already in a circuit
  # else add them to the next new circuit
  # get the size of the three largest circuits and multiply them
end

start