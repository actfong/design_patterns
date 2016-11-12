def iterate_internally(arr, &block)
  index = 0
  while index < arr.size
    yield(arr[index])
    index += 1
  end
end

arr = %w(a b c d e f)
iterate_internally(arr) { |elem| puts elem.upcase }
