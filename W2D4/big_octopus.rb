# Big O-ctopus and Biggest Fish
def sluggish_o(array)
  longest = nil
  longest_l = 0

  array.each do |el|
    longest = el if el.length > longest_l
  end

  longest
end

def dominant_o(array)
  return "" if array.empty?
  return array.first if array.length == 1

  mid_i = array.length / 2

  pivot = array[mid_i]
  left = dominant_o(array[0...mid_i])
  right = dominant_o(array[mid_i + 1..-1])

  options = [ left, right, pivot ]
  longest = options.map(&:length).max

  options.select { |x| x.length == longest }.first
end

def clever_o(array)
  length = array.map(&:length)
  array[length.index(length.max)]
end

# Dancing Octopus

def slow_dance(move, tiles_array)
  tiles_array.index(move)
end

def convert_to_hash(array)
  result = {}

  array.each_with_index do |el, i|
    result[el] = i
  end

  result
end

def fast_dance(move, new_tiles_data_structure)
  new_tiles_data_structure[move]
end

tiles_array = [
  "up",
  "right-up",
  "right",
  "right-down",
  "down",
  "left-down",
  "left",
  "left-up"
]

p slow_dance("up", tiles_array)
p slow_dance("right-down", tiles_array)

new_tiles_data_structure = convert_to_hash(tiles_array)

p fast_dance("up", new_tiles_data_structure)
p fast_dance("right-down", new_tiles_data_structure)
