def square (base, altitude)
  0.5 * base * altitude
end

puts "Введите основание:"
base = gets.to_f

puts "Введите высоту:"
altitude = gets.to_f

puts "Площадь треугольника - #{square(base, altitude)}"
