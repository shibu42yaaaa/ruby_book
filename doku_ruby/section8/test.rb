# 8.3
# 与えられた任意の個数の引数について、平均値を求めるagerageメソッドを定義する
def average(*values)
  values.sum.fdiv(values.length)
end

puts average(18, 20, 19, 19, 25)
