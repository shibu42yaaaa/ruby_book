def fibonacci(num)
  # 再帰終了条件
  if num == 0
    return 0
  # 再帰終了条件
  elsif num == 1
    return 1
  else
    # 再帰呼び出し
    fibonacci(num - 1) + fibonacci(num - 2)
  end
end

# 第 0 項から第 9 項までを出力
(1..1000).each do |i|
  puts "第 #{i} 項： #{fibonacci(i)}"
end