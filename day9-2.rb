def get_input
  input_data = 'day9-input.txt'

  input_arr = []
  File.foreach(input_data) { |line| input_arr << line.chomp.split(',')}
  input_arr.map! do |line|
    line.map! { |val| val.to_i}
  end
  input_arr
end

def rectangle_inside?(row_intervals, xmin, xmax, ymin, ymax)
  return false if xmax - xmin < 1 || ymax - ymin < 1

  (ymin + 1 ... ymax).each do |y|
    intervals = row_intervals[y]
    return false if intervals.nil?

    covered = intervals.any? do |ix1, ix2|
      ix1 <= xmin + 1 && xmax - 1 <= ix2
    end

    return false unless covered
  end

  true
end


def start
  tiles = get_input

  edges = []
  tiles.each_with_index do |p, i|
    q = tiles[(i + 1) % tiles.length]
    edges << [p, q]
  end

  row_intersections = Hash.new { |h, k| h[k] = [] }

  edges.each do |(x1, y1), (x2, y2)|
    next unless x1 == x2  # only vertical edges

    y_min, y_max = [y1, y2].minmax

    # IMPORTANT: half-open interval avoids double counting corners
    (y_min...y_max).each do |y|
      row_intersections[y] << x1
    end
  end

  row_intervals = {}

  row_intersections.each do |y, xs|
    xs.sort!
    intervals = []

    xs.each_slice(2) do |x1, x2|
      intervals << [x1, x2 - 1]
    end

    row_intervals[y] = intervals
  end

  largest = 0
  itt = 0 

  tiles.each do |a|
    p itt
    itt += 1
    tiles.each do |b|
      x1, y1 = a
      x2, y2 = b

      xmin, xmax = [x1, x2].minmax
      ymin, ymax = [y1, y2].minmax

      area = (xmax - xmin + 1) * (ymax - ymin + 1)
      next if xmin == xmax || ymin == ymax
      next unless area > largest

      next unless rectangle_inside?(row_intervals, xmin, xmax, ymin, ymax)

      largest = area
    end
  end

  largest
end

p start

# answer 1470009489 too low
# 