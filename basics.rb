p 'Get First 3 character of string'
p my_string = 'my string'
p my_string[0, 3]

p 'Get last 3 character of string'
p my_string = 'my string'
p my_string[-3, 3]

p 'Get first character of string'
p my_string = 'my string'
p my_string[0]

p 'Get last character of string'
p my_string = 'my string'
p my_string[-1]


p 'Delete last 3 characters from string'
p my_string = 'my string'
p my_string[0...-3]   # Remember it has 3 dots not 2. Zero means remove 0 from start, -3 means remove 3 from last
p my_string.delete_suffix(my_string[-3, 3])