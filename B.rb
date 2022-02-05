input = [10, 9, 10, 3, 100, 100, 90, 80, 10, 30, 10]

input.shift(1)
arr = input.map.with_index(1) do |x, i|
  next if input[i].nil?
  diff = input[i] - x
  if diff.zero?
    'stay'
  elsif diff.negative?
    "down #{diff.abs}"
  else
    "up #{diff}"
  end
end
arr.delete(nil)
p arr

# refactoring
values = [10, 9, 10, 3, 100, 100, 90, 80, 10, 30, 10]
values.shift(1)
values.each.with_index(1) do |current_value, index|
  diff = values[index] - current_value
  if diff.zero?
    puts 'stay'
  elsif diff.negative?
    puts "down #{diff.abs}"
  else
    puts "up #{diff}"
  end
end
