# ブロック付きメソッド

def my_benchmark
  start_t = Time.now.to_f
  # ブロックの呼び出し
  yield
  end_t = Time.now.to_f

  puts "経過時間:#{end_t - start_t}秒"
end

my_benchmark do
  sleep(3)
end

#---------------------------------

# 渡されたブロックをeachメソッドで処理する
data = ['apple', 'orange', 'remon', 'greap']

def block_proc(list, &block)
  puts 'start....'
  list.each &block
  puts 'end....'
end

block_proc(data) do |item|
  puts item
end

#---------------------------------


data = [1.3, 3.3, 1.1, 2.9]
p data.map(&:ceil)

#---------------------------------

## procの利用例

#5という数で好きなことをしてもらうメソッド
def magic_five_box(after_input, someProck)
  someProck.call(5, after_input)
end

# 5を使って足し算をする
sum_proc = Proc.new do |x, y| # オブジェクト化
  p x + y 
end

magic_five_box(3, sum_proc)

# 文字列を5回表示させる
string_proc = Proc.new do |x, string|
  puts string * x
end

magic_five_box('HelloWorld', string_proc)


# ----------
#  オリジナル
# 消費税のメソッド
def calculate_tax_box(after_input, someProc)
  someProc.call(1.1, after_input)
end



sum_proc = Proc.new do |x,y|
    # puts "#{@price}"
    p (x * y).round
end

puts "値段を入力"
price = gets.to_i

calculate_tax_box(price, sum_proc)