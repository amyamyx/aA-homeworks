def sum_to(n)
  return nil if n < 0
  return n if n == 0
  n + sum_to(n - 1)
end

def add_numbers(nums_arrays)
  return nil if nums_arrays.empty?
  return nums_arrays.first if nums_arrays.length == 1
  nums_arrays.first + add_numbers(nums_arrays[1..-1])
end

def gamma_fnc(n)
  return nil if n <= 0
  return 1 if n == 1
  (n - 1) * gamma_fnc(n - 1)
end

def ice_cream_shop(flavors, favorite)
  return flavors.first == favorite if flavors.length <= 1
  return true if flavors.first == favorite
  ice_cream_shop(flavors[1..-1], favorite)
end

def reverse(string)
  return string if string.length <= 1
  string[-1] + reverse(string[0...-1])
end
