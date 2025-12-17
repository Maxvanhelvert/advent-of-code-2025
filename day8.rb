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
	circuits = []
	
	(0...1000).each do |i|
		first_box = connections[i][1]
		second_box = connections[i][2]
		circuits << [first_box, second_box] if circuits.empty?

		circuits.each_with_index do |circuit, j|
      if circuit.include?(first_box)
        circuit << second_box
        break
      elsif circuit.include?(second_box)
			  circuit << first_box
        break
      elsif j == circuits.length - 1
        circuits << [first_box, second_box]
		  end
		end
	end

  circuits.sort_by!(&:length)
  circuits.reverse!

  result = circuits[0].length * circuits[1].length * circuits[2].length
  p result
end

start

# result 6840 too low