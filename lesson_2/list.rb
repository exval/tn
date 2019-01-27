list = Hash.new

puts "Type here what u want to add in list or 'exit' for exit"
loop do 
  puts "Name of product:"
  product = gets.chomp
  break if product == 'exit' 

  puts "Price for one:"
  price = gets.to_f

  puts "Quantitty:"
  quantitty = gets.to_i

  list[product] = { price: price, quantitty: quantitty }
end

puts list 

  all_stuff = 0
  list.each do |name, gen| 
    summa = gen[:price] * gen[:quantitty]
    puts "Product - #{name} on sum #{summa}"
    all_stuff += summa
  end
puts "Total amount: #{all_stuff}"
