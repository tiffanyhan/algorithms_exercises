# subproblem:
# return all possible partitions of a string

# E.g. 'aab'

#       1       2      3
#      /\      /
#     1  2    1
#    /
#   1

# 'a' 'a' 'b'
# 'a' 'ab'
# 'aa' 'b'
# 'aab'

# at every level, we have 3 possibilities (length of str).
# except we take (str.length) - (length already partitioned) => new # of possibilities

# string[0..0] returns substring of first char
# string[0..string.length - 1] return whole string

def partition s
  partition_helper s, result=[], []
  result
end

def partition_helper s, result, solution
  return result << solution.clone if s.length.zero?

  (0..s.length - 1).each do |partition_idx|
    head   = s[0..partition_idx]
    substr = s[partition_idx + 1..s.length - 1]
    next unless is_palindrome?(head)

    solution << head
    partition_helper substr, result, solution
    solution.pop
  end
end

def is_palindrome? s
  left  = 0
  right = s.length - 1

  while left < right
    return false if s[left] != s[right]
    left  += 1
    right -= 1
  end

  true
end

puts is_palindrome? 'a'
puts is_palindrome? 'b'
puts is_palindrome? 'ab'

p partition 'aab'

















# kevin's solution

# @param {String} s
# @return {String[][]}
# def partition(s)
#   result = []
#   partition_helper(s, [], result)
#   result
# end

# def partition_helper(s, solution, result)
#   if s == ""
#     result << solution.clone
#   else
#     (1..s.size).each do |num|
#       substring = s.slice(0, num)
#       if palindrome?(substring)
#         solution << substring
#         partition_helper(s[substring.size..-1], solution, result)
#         solution.pop
#       end
#     end
#   end
# end

# def palindrome?(string)
#   return true if string.size == 0 || string.size == 1
#   string[0] == string[-1] && palindrome?(string[1..-2])
# end
