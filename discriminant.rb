puts "Введи коэффицент 'a': "
a = gets.chomp.to_f

puts "Введи коэффицент'b': "
b = gets.chomp.to_f

puts "Введи коэффицент 'c': "
c = gets.chomp.to_f

discriminant = b**2 - 4 * a * c

x1 = 0
x2 = 0

if discriminant > 0
	x1 = (-b + Math.sqrt(discriminant)) / (2 * a)
	x2 = (-b - Math.sqrt(discriminant)) / (2 * a)
	puts "Дискриминант - #{discriminant}, \nпервый корень #{x1}, \nвторой корень #{x2} "
elsif discriminant == 0 
	puts "Дискриминант = #{discriminant}. x = #{-b / 2.0 * @a}"
else
	puts "Корней нет!"
end
		