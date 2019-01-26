alphabet = ('a'..'z').to_a
lowels = ['a', 'e', 'i', 'o', 'u', 'y']
hash_of_lowels = {}
alphabet.each_with_index { |all, lowel| hash_of_lowels[all] = lowel + 1 if lowels.include?(all) }
puts hash_of_lowels
