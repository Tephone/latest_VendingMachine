require "thor"
require "pry"
require_relative 'kawamurasan'
require_relative 'customer_method'

MONEY = [10, 50, 100, 500, 1000].freeze
@vm = VendingMachine.new

puts 'こんにちはお客様、あなた望みはなんでしょう？'
puts '1:飲み物を買う事'
puts '2:この会話を止める事'
number = gets.to_i
if number == 2
  puts'そうですか、さようならお元気で'
elsif number == 1
  insert_money_process
  while true
    puts '何が飲みたいですか？'
    puts '以下メニューから飲みたいドリンク名を入力してください'
    drink_menu 
    drink_name = gets.chomp
    #binding.pry
    buy_process(drink_name.to_s)
    puts 'もう一ついかがですか？'
    puts '1:お言葉に甘えて'
    puts '2:もういらないよ'
    number = gets.to_i
    if number == 2
      puts "#{@vm.total_money}円のおつりです" 
        @vm.return_money
        break
    elsif number == 1
      puts '購入可能なドリンクリストは以下の通りです'
      @vm.purchasable_drink_list
      puts 'お金を追加しますか？'
      puts '1:はい'
      puts '2:いいえ'
      number = gets.to_i
      if number == 1
        insert_money_process
      end
    end
  end
end


