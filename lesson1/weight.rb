def perfect_weight(height)
	height - 110
end

puts "Как тебя зовут?"
name = gets.chomp.capitalize

puts "Каков твой рост?"
height = gets.to_i

puts "#{name}, ваш - #{perfect_weight(height) <= 0 ? 'вес уже оптимальный' : "ваш оптимальный вес #{perfect_weight(height)}"}"
