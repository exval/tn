list = Hash.new

puts "Type here what u want to add in list or 'exit' for exit"
loop do 
<<<<<<< HEAD
  puts "Name of product:"
  product = gets.chomp
  break if product == 'exit' 

  puts "Price for one:"
  price = gets.to_f

  puts "Quantitty:"
  quantitty = gets.to_i

  list[product] = { price: price, quantitty: quantitty }
=======
	puts "Name of product:"
	product = gets.chomp
	break if product == 'exit' 

	puts "Price for one:"
	price = gets.to_f

	puts "Quantitty:"
	quantitty = gets.to_i

	list[product] = { price: price, quantitty: quantitty }
>>>>>>> 872e0950e73696a1a16f564bec0d73f10c70f727
end

puts list 

<<<<<<< HEAD
all_stuff = 0
  list.each do |name, gen| 
    summa = gen[:price] * gen[:quantitty]
    puts "Product - #{name} on sum #{summa}"
    all_stuff += summa
  end
=======
	all_stuff = 0
	list.each do |name, gen| 
		summa = gen[:price] * gen[:quantitty]
		puts "Product - #{name} on sum #{summa}"
		all_stuff += summa
	end
>>>>>>> 872e0950e73696a1a16f564bec0d73f10c70f727
puts "Total amount: #{all_stuff}"
