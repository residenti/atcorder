nums = $stdin.read.split("\n").map(&:to_i)
nums.shift(1)
nums.each.with_index(1) do |current_num, index|
  diff = nums[index] - current_num
  if diff.zero?
    puts 'stay'
  elsif diff.negative?
    puts "down #{diff.abs}"
  else
    puts "up #{diff}"
  end
end
