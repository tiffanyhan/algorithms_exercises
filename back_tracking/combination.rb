def combine limit, size
  combine_helper result=[], [], 1, limit, size
  result
end

def combine_helper result, combo, start, limit, size
  return result << combo.clone if combo.size == size

  (start..limit).each do |num|
    combo << num
    combine_helper(result, combo, num + 1, limit, size)
    combo.pop
  end
end

p combine 4, 2
