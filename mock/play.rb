# Given an input string, reverse the string word by word.

# For example,
# Given s = "the sky is blue",
# return "blue is sky the"

# Assume the input doesn't contain leading or trailing spaces
# and the words are always separated by a single space.

# Go through different solutions. Ideally solve it in O(N) time and O(1) space.

# split up input string by ' ', to get a list of words.
# ['the' , 'sky', 'is', 'blue']

# S: O(N), T: O(N)

# 'the sky is blue'

# 'eulb si yks eht'
# reverse 'eulb', 0, 3

# 'blue si yks eht'

def reverse_words string
  reverse string, 0, string.length - 1

  anchor = 0
  runner = 0

  while runner < string.length + 1
    runner += 1

    if string[runner] == ' ' || string[runner] == nil
      reverse(string, anchor, runner - 1)
      runner += 1
      anchor = runner
    end
  end

  string
end

def reverse string, left, right
  while left < right
    temp = string[left]
    string[left] = string[right]
    string[right] = temp

    left += 1
    right -= 1
  end
end

puts reverse_words 'the sky is blue' # 'blue is sky the'
