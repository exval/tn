<<<<<<< HEAD
MONTHS = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

def leap_year? (year)
    year % 4 == 0 && year % 100 != 0 || year % 400 == 0
end

def count (day_of_month, month, year)
    additional_day = leap_year?(year) && (month > 2) ? 1 : 0
    MONTHS.take(month-1).sum + day_of_month + additional_day
end
=======
	MONTHS = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

	def leap_year? (year)
		year % 4 == 0 && year % 100 != 0 || year % 400 == 0
	end

	def count (day_of_month, month, year)
		additional_day = leap_year?(year) && (month > 2) ? 1 : 0
		MONTHS.take(month-1).sum + day_of_month + additional_day
	end
>>>>>>> 872e0950e73696a1a16f564bec0d73f10c70f727

puts "Input all in integer!"
puts "Enter the day of month:"
day_of_month = gets.to_i

<<<<<<< HEAD
if day_of_month > 31 || day_of_month <= 0
    abort "Wrong day, check and try again"  
end
=======
	if day_of_month > 31 || day_of_month <= 0
		abort "Wrong day, check and try again"  
	end
>>>>>>> 872e0950e73696a1a16f564bec0d73f10c70f727

puts "Enter the month:"
month = gets.to_i

<<<<<<< HEAD
if month > 12 || month <= 0 
    abort "Wrong month, check and try again"
end

puts "Enter the year:"
year = gets.to_i
  
if year <= 0 
    abort "Wrong year!"
end
  
puts "Count for current date: #{count(day_of_month, month, year)}"
=======
	if month > 12 || month <= 0 
		abort "Wrong month, check and try again"
	end

puts "Enter the year:"
year = gets.to_i

	if year <= 0
		abort "Wrong year!"
	end

puts "Count for current date: #{count(day_of_month, month, year)}"
 
>>>>>>> 872e0950e73696a1a16f564bec0d73f10c70f727
