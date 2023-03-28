# メソッドの呼び出しと戻り値

def get_max_min(*args)
  return args.max, args.min
end

max_v, min_v = get_max_min(10,3,59,100, -4, -30)
puts "最大値: #{max_v}"
puts "最小値: #{min_v}"
# >>最大値: 100
# >>最小値: -30

# ----------------------------------

# 再帰呼び出し 階上（よくわからん）
def factorial(num)
  return num * factorial(num - 1) unless num == 0
  1
end

puts factorial(5)

# ----------------------------------

# ジェネレーター
gen = Enumerator.new do |y|
  y << 'アイウエオ'
  y << 'kakikukeko'
  y << 'さしすせそ'
end

gen.each { |y| puts y}

# # または
# # puts gen.next

# ----------------------------------

# 例題；実用性あり 素数を求めるジェネレーター
primes = Enumerator.new do |y|
  (2..).each do |num|
    y << num if prime?(num)
  end
end

# 引数valueが素数か判定する
def prime?(value)
  result = true
  (2..Math.sqrt(value).floor).each do |i|
    if value % i == 0
      result = false
      break
    end
  end
  result
end

primes.each do |p|
  puts p
  break if p > 100
end










