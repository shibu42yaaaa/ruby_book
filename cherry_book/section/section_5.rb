## ハッシュ　シンボル

# currencies = {'japan'=>'yen', 'us'=>'dollar', 'india'=>'rupee'}

# currencies['itary'] = 'euro'

# p currencies
# # >> {"japan"=>"yen", "us"=>"dollar", "india"=>"rupee", "itary"=>"euro"}

# --

# currencies = {'japan' => 'yen', 'us' => 'dollar', 'india' => 'rupee'}

# currencies.each do |key, value|
#   puts "#{key}:#{value}"
# end
## # >> japan:yen
## >> us:dollar
## >> india:rupee

# --
## シンボル

# currencies = {:japn => 'yen', :us => 'dollar', :india => 'rupee'}
# p currencies[:japn]

# currencies = {japan: 'yen', us: 'dollar', india: 'rupee'}
# p currencies[:us]

# --
# person = {
#     name: 'Alice',
#     age: 24,
#     friends: ['Bob','Carol'],
#     phones: {home: '123-4444', mobile: '080-1111-2222'}
# }

# p person[:age]
# p person[:friends]
# p person[:phones][:mobile]
# --

# ハッシュについて応用

# currencies = {japan: 'yen', us: 'dollar', india: 'rupee'}
# p currencies.has_key?(:japan)


# --

# def buy_burger(menu, options = {})
#     puts options
# end

# buy_burger 'fish', {'drink' => true, 'potato' => false}

# --

