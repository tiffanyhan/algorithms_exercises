def reverse_string(s)
  pointer_one = 0
  pointer_two = s.length - 1
  item_one = nil
  item_two = nil
  temp = nil

  until pointer_one >= pointer_two
    item_one = s[pointer_one]
    item_two = s[pointer_two]

    temp = item_one
    s[pointer_one] = item_two
    s[pointer_two] = temp

    pointer_one += 1
    pointer_two -= 1
  end

  s
end

puts reverse_string ''
puts reverse_string('') == ''
puts reverse_string 'hello'
puts reverse_string('hello') == 'olleh'
puts reverse_string 'hellos'
puts reverse_string('hellos') == 'solleh'