nums = $stdin.read.split("\n").map(&:to_i)
nums.shift
# x = (nums.uniq.reduce(&:+) - (nums.first..nums.length).reduce(&:+)).abs
# x = (nums.sort.first..nums.length).find { |num| !nums.include?(num) }
x = ((nums.first..nums.length).to_a - nums.uniq).first
y = nums.select { |num| nums.count(num) == 2 }.first
puts x ? "#{y}, #{x}" : 'Correct'
