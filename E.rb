# TODO リファクタリング

# [["6", "7"], ["1", "1", "2"], ["1", "2", "3"], ["1", "3", "4"], ["1", "1", "5"], ["1", "5", "6"], ["3", "1"], ["2", "6"]]
input = $stdin.read.split("\n").map(&:split)
# 6
user_count = input.slice(0).first.to_i
# [{:id=>1, :following_ids=>[]}, {:id=>2, :following_ids=>[]}, {:id=>3, :following_ids=>[]}, {:id=>4, :following_ids=>[]}, {:id=>5, :following_ids=>[]}, {:id=>6, :following_ids=>[]}]
storages = (1..user_count).map { |user_id| { id: user_id, following_ids: [] } }
# [["1", "1", "2"], ["1", "2", "3"], ["1", "3", "4"], ["1", "1", "5"], ["1", "5", "6"], ["3", "1"], ["2", "6"]]
logs = input.slice(1..-1)

# [{:id=>1, :following_ids=>[2, 5, 3, 6]}, {:id=>2, :following_ids=>[3]}, {:id=>3, :following_ids=>[4]}, {:id=>4, :following_ids=>[]}, {:id=>5, :following_ids=>[6]}, {:id=>6, :following_ids=>[1, 5]}]
logs.each do |log|
  operation_type = log[0].to_i
  case operation_type
  when 1
    executer_id = log[1].to_i
    following_id = log[2].to_i
    executer_storage = storages.find { |data| data[:id] == executer_id }
    executer_storage[:following_ids] << following_id
  when 2
    executer_id = log[1].to_i
    user_ids = storages.select { |data| data[:following_ids].include?(executer_id) }
                       .flat_map { |data| data[:id] }
    executer_storage = storages.find { |data| data[:id] == executer_id }
    executer_storage[:following_ids] = executer_storage[:following_ids] | user_ids
  when 3
    executer_id = log[1].to_i
    executer_storage = storages.find { |data| data[:id] == executer_id }
    following_following_ids = executer_storage[:following_ids].flat_map do |following_id|
      storages.find { |data| data[:id] == following_id }[:following_ids]
    end
    executer_storage[:following_ids] = executer_storage[:following_ids] | following_following_ids
  else
    raise 'Unknown Operation Type💩'
  end
end

storages.each do |storage|
  puts (1..user_count).map { |user_id| storage[:following_ids].include?(user_id) ? 'Y' : 'N' }.join
end

# ->
# NYYNYY
# NNYNNN
# NNNYNN
# NNNNNN
# NNNNNY
# YNNNYN
