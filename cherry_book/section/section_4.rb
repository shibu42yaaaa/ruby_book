# # 配列
# # 基本

a = [1,2,3]
puts a[0]

# # 432
number = [1,2,3,4]
sum = 0
number.each do |n|
  sum += n
end

puts sum

# 配列の要素を削除する条件を自由に指定する
a = [1,2,3,1,2,3]
a.delete_if do |n|
  n.odd? # 奇数の場合削除
end

p a # >> [2, 2]

# # ------------------------

numbers = [1,2,3,4]
sum = 0
numbers.each do |n|
  p sum += n
end

# # -----------------------

numbers = [1,2,3,4]
sum = 0
numbers.each do |n|
  sum_value = n.even? ? n * 10 : n # if ~ 偶数の場合 n * 10 else n
  sum += sum_value
end
p sum

# # ------------------------

numbers = [1,2,3,4]
sum = 0
sum_value = 100
numbers.each do |sum_value| # ブロック内部のsum_valueが優先される
  sum += sum_value
end
p sum # >> 10 
# ------------------------

# 1行で書くパターン

numbers = [1,2,3,4]
sum = 0
numbers.each { |n| sum += n }
p sum

# ----------------------------

numbers = [1,2,3,4]
sum = 0
numbers.each { |n|
  sum += n
}

p sum

# ------------------------

# # 441
numbers = [1,2,3,4,5]
new_numbers = numbers.map { |n| n * 10 }
p new_numbers # >> [10, 20, 30, 40, 50]

# ------------------------

numbers = [1,2,3,4,5,6]
# select : ブロックの戻り値が真になった要素だけ集める
even_numbers = numbers.select { |n| n.even? }
p even_numbers

# ------------------------

numbers = [1,2,3,4,5,6]
nun_multiples_of_three = numbers.reject { |n| n % 3 == 0} # 3で割って0のものを除外
p nun_multiples_of_three # >> 1, 2, 4, 5]

# ------------------------

numbers = [1,2,3,4,5,6]
even_numbers = numbers.find { |n| n.even? } # ブロックの戻り値が真になった最初の要素を返す
p even_numbers
# ------------------------

numbers = [1,2,3,4]
# 初回はresultに0, nは1から順番に入る。どんどん足していく
sum = numbers.inject(0) {|result, n| result + n}
p sum

------------------------

p ['ruby', 'java', 'python'].map { |s| s.upcase }
# 簡潔に書く
p ['ruby', 'java', 'python'].map(&:upcase)

# 奇数を返す
p [1,2,3,4,5,6].select {|n| n.odd?}
# 簡潔に書く
p [1,2,3,4,5,6].select(&:odd?)

# ------------------------

case
def charge(age)
  case age
  when 0..5
    0
  when 6..12
    300
  when 13..18
    600
  else
    1000
  end
end

puts charge(3)
puts charge(12)
puts charge(16)
puts charge(25)

# # ------------------------

sum = 0
(1..10).each {|n| sum += n}
p sum

------------------------

numbers = []
(1..10).step(2) {|n| numbers << n}
p numbers

------------------------

a = [1,2,3,4,5]
p a.values_at(0,2,4)

------------------------

# 472
a = [1,2,3,4,5]
a[1,3] = 100
p a # >> [1, 100, 5]

# --
#  push : 追加
a = []
p a.push(1) # >> [1]
p a.push(2,3) # >> [1,2,3]

p "--"
# delete 削除
a = [1,2,3,1,2,3]
# 値が2のものを削除
p a 
a.delete(2) # >> [1, 2, 3, 1, 2, 3]
p a# >> [1, 3, 1, 3]
# 存在しない値だとnilが返る

# p "--"

# 473 結合
# concat

a = [1]
b = [2,3]
p a.concat(b) # >> [1, 2, 3]
# 破壊的メソッドのため変更される
p a# >> [1, 2, 3]

p "--"

# 474 集合など
a = [1,2,3]
b = [3,4,5]
# 和集合（重複なし）
p a | b # >> [1, 2, 3, 4, 5]

# p "--"

# 差集合
# 左辺から右辺の配列に含まれる要素を取り除く
p a - b # >> [1,2]

p "--"

# 積集合（共通）
p a & b # >> [3]

p "--"
require 'set'

a = Set.new([1,2,3])
b = Set.new([3,4,5])
p a | b
p a - b
p a & b

p "--"

e, *f = 100, 200, 300
p e # >> 100
p f # >> [200, 300]

p "--"

a = []
b = [2,3]
a.push(1)
p a.push(*b) # (a.push(2,3)と同じ)
# >> [1, 2, 3]

p "--"

def greeting(*names)
  p "#{names.join('と')}, こんにちは" # join: 区切り文字を使って配列を一つの文字列にする
end

greeting('田中さん') # >> "田中さん, こんにちは"
greeting('田中さん', '鈴木さん') # >> "田中さんと鈴木さん, こんにちは"
greeting('田中さん', '鈴木さん', '佐藤さん') # >> "田中さんと鈴木さんと佐藤さん, こんにちは"

p "--"

# 配列
p %w(apple melon orange) # >> ["apple", "melon", "orange"]

p %W(
    apple
    melon
    lemon
)

p "--"

prefix = 'This is'
p %W(#{prefix}\ an\ apple small\nmelon orange )

p "--"

# 文字列を配列に変換
# 1文字1文字を配列の要素に分解
p 'Ruby'.chars # >> ["R", "u", "b", "y"]

p 'Ruby, Java, Perl, PHP'.split(',')
# >> ["Ruby", " Java", " Perl", " PHP"]

p "--"
# 配列要素10, 1~3までを繰り返す
p a = Array.new(10){|n| n % 3 + 1}
# 配列要素10, 1~4までを繰り返す
p a = Array.new(10){|n| n % 4 + 1}
# 配列要素10, 1~5までを繰り返す
p a = Array.new(10){|n| n % 5 + 1}

p "--"

p a = Array.new(5, 'default')

str = a[0]
p str

str.upcase! # 破壊的メソッド
p str

p a # >> ["DEFAULT", "DEFAULT", "DEFAULT", "DEFAULT", "DEFAULT"]

# 全てが変更されないようにする

a = Array.new(5) {'default'}
str = a[0]
p str.upcase! # >> "DEFAULT"
p a # >> ["DEFAULT", "default", "default", "default", "default"]

p "--"

# ブロックについて

fruits = ['apple', 'orange', 'melon']
fruits.each_with_index{|fruit, i| p "#{i}: #{fruit}" }
# >> 0: apple
# >> 1: orange
# >> 2: melon
p "--"
# 添字も同時に取得する
fruits.map.with_index(10) {|fruit, i| p "#{i}: #{fruit}"}
# >> "0: apple"
# >> "1: orange"
# >> "2: melon"

fruits.delete_if.with_index {|fruit, i| fruit.include?('a') && i.odd?}
p fruits # >> ["apple", "melon"]


p "--"

dimisions = [
    [10, 20],
    [30, 40],
    [50, 60]
]

areas = []
dimisions.each do |dimision|
  length = dimision[0]
  width = dimision[1]
  areas << length * width
end
p areas

# 別解
dimisions.each do |length, width|
  areas << length * width
end
puts areas

p '--'

dims = [[10, 20]]
a = []
dims.each do |dim|
  length = dim[0]
  width = dim[1]
  a << length * width
end

puts a

p "--"

dimisions = [
    [10, 20],
    [30, 40],
    [50, 60]
]

dimisions.each_with_index do |(length, width), i|
  puts "length:#{length}, width:#{width}, i:#{i}"
end
n
p "--"

# 頻出度　低
numbers = [1,2,3,4]
sum = 0
numbers.each do |n; sum|
  sum = 10
  sum += n
  p sum # >> 11, 12, 13, 14
end
p "ブロックがいの値は#{sum}"


p "--"

繰り返し

sum = 0
5.times {|n| sum += n}
p sum

p "--"

a = []
10.upto(14){|n| a << n}
p a

b = []
14.downto(10){|n| b << n}
p b

a = []
# 1から10まで2つずつ値を増やす
1.step(10, 2) {|n| a << n}
p a


a = []
# 10から1まで2つ飛ばし
10.step(1, -2){|n| a << n}
p a # >> [10, 8, 6, 4, 2]

# 繰り返しの制御

numbers = [1,2,3,4,5].shuffle
numbers.each do |n|
  puts n
  break if n == 5
end

p "--"

# nが3になれば抜けて次のfruitにいく
fruits = %w(apple melon orange)
numbers = [1,2,3]
fruits.each do |fruit|
  numbers.shuffle.each do |n|
    puts "#{fruit}, #{n}"
    break if n == 3
  end
end

p "--"
fruits = ['apple', 'melon', 'orange']
numbers = [1,2,3]
fruits.each do |fruit|
  numbers.shuffle.each do |n| # ランダム設定
    puts "#{fruit}, #{n}"
    break if n == 3
  end
end

p '--'

fruits = %w(apple melon orange)
numbers = [1,2,3]
catch :done do
  fruits.shufflxe.each do |fruit|
    numbers.shuffle.each do |n|
        puts "#{fruit}, #{n}"
      if fruit == 'orange' && n == 3
        throw :done
      end
    end
  end
end


p "--"

# numbers = [1,2,3,4,5]
# numbers.each do |n|
#   next if n.even? # 偶数の場合飛ばす
#   puts n
# end

p '--'

fruits = %w(apple melon orange)
numbers = [1,2,3]

fruits.each do |fruit|
  numbers.each do |n|
    next if n.even? # 奇数の時に飛ばす
    puts "#{fruit}, #{n}"
  end
end

p "--"

foods = %w(ピーマン トマト セロリ)
foods.each do |food|
  print "#{food}は好きですか？"
  answer = ['はい', 'いいえ'].sample
  puts answer

  redo unless answer == 'はい'
end



p '--'
foods = %w(ピーマン トマト セロリ)
count = 0
foods.each do |food|
  print "#{food}は好きですか？"
  answer = 'いいえ'
  puts answer

  count += 1
  redo if answer != 'はい' && count < 2 
  # カウントリセット
  count = 0
end


p "--"

# 番外編 九九
for i in 1..9 do
  for j in 1..9 do
    print(j,"x", i, "=", (j*i) , "\t")
  end
  print("\n")
end