	MONTHS = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

	def leap_year? (year)
		year % 4 == 0 && year % 100 != 0 || year % 400 == 0
	end

	def count (day_of_month, month, year)
		additional_day = leap_year?(year) && (month > 2) ? 1 : 0
		MONTHS.take(month-1).sum + day_of_month + additional_day
	end

puts "Input all in integer!"
puts "Enter the day of month:"
day_of_month = gets.to_i

	if day_of_month > 31 || day_of_month <= 0
		abort "Wrong day, check and try again"  
	end

puts "Enter the month:"
month = gets.to_i

	if month > 12 || month <= 0 
		abort "Wrong month, check and try again"
	end

puts "Enter the year:"
year = gets.to_i

	if year <= 0
		abort "Wrong year!"
	end

puts "Count for current date: #{count(day_of_month, month, year)}"
 
