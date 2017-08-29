# try walid's O(N) solution

# def two_sum numbers, target
#   h = {}
#   numbers.each_with_index do |num, idx|
#     complement = target - num
#     if h[complement]
#       return [idx + 1, h[complement] + 1].sort
#     else
#       h[num] = idx
#     end
#   end
# end

def two_sum(numbers, target)
  left = 0
  right = numbers.length - 1

  while left < right
    if numbers[left] + numbers[right] == target
      return [left + 1, right + 1]
    elsif numbers[left] + numbers[right] > target
      right -= 1
    else
      left += 1
    end
  end
end

p two_sum([2, 7, 11, 15], 9) # [0, 1]
