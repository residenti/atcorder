# 問題: 下記のlsコマンドの出力結果と同じような結果を出力するプログラムを実装せよ
# mac atcoder (main) % ls
# B.rb        README.md   hoge.txt    others        wan.xt
# C.rb        fuga.txt    mya.txt     piyo.txt

require 'active_support/core_ext/array/grouping.rb' # TODO: ActiveSupport使わない

items = Dir.glob('*').sort
colum_length = 6.0
row_length = (items.length / colum_length).ceil
items_grouped_by_column = items.in_groups_of(row_length, '').map do |column_data|
  max_length = column_data.max { |a, b| a.length <=> b.length }.length
  column_data.map { |item| item.ljust(max_length) }
end
items_grouped_by_column.transpose.each { |row| puts row.join(' ') }
