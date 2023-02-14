# 閏年のプログラム

# 西暦が4で割り切れる時
# ただし、100で割り切れるときは平年
# ただし、400で割り切れるときは閏年

def uru(n)
  if n % 4 != 0
    puts "平年"
  elsif n % 100 == 0 && n % 400 != 0
    puts "平年"
  else
    puts "閏年"
  end
end

uru(1900)
uru(1980)
uru(2000)
uru(2019)
uru(2020)
uru(2022)
uru(2023)
uru(2024)
