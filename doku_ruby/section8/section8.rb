

# 可変長引数メソッド

# def total_products(*values)
#   result = 1
#   values.each do |value|
#     result *= value
#   end
#   result
# end

# puts total_products(12, 15, -1)
# puts total_products(5,7,5,6,12)

# ------------------

# 可変長切り捨て
# def show(msg, *) # 2番目以降切り捨て
#   puts msg
# end
# show('こんにちは','こんばんは','さようなら')

# ------------------



#def create_book(isbn:, title:, **options)
#   book = { isbn: isbn, title: title }
#   book.merge(options)
# end

# b = create_book(isbn:'111-1111-111',
#                 title: 'ノルウェーの森',
#                 prive: 500,
#                 publisher: 'Haruki Murakami')

# p b

# ---------------------------------------

# def create_book(isbn:, title:, **options)
#   book = { isbn: isbn, title: title }
#   book.merge(options)
# end


# info = create_book(isbn:'111-1111-111',
#     title: 'ノルウェーの森',
#     prive: 500,
#     publisher: 'Haruki Murakami')

# p create_book(**info) # ハッシュを受け取れる

