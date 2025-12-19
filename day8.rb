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

def find(parent, x)
  return x if parent[x] == x
  find(parent, parent[x])
end

def union(parent, a, b)
  ra = find(parent, a)
  rb = find(parent, b)
  return false if ra == rb

  parent[ra] = rb
  true
end

def start
  boxes = get_input
  connections = generate_connections(boxes)
	
  parent = Array.new(boxes.length) { |i| i}

  connect = 0

  connections.each do |_, a, b|
    break if connect == 1000
      
    union(parent, a, b)
    connect += 1

  end

  circuits = Hash.new(0)

  parent.each_index do |i|
    root = find(parent, i)
    circuits[root] += 1
  end

  sizes = circuits.values.sort.reverse
  result = sizes[0] * sizes[1] * sizes[2]
  p result
end

start

# result 6840 too low
# correct 32103