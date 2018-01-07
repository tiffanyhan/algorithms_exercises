def render_binary integer, bits
  integer.to_s(2).slice(-bits..-1)
end

# 1 0 1 0 0 OR
# 0 0 0 1 0
# ---------
# 1 0 1 1 0

# set position to 1
def set_bit num, position
  mask = 1 << position
  render_binary(num | mask, 5)
end

# puts set_bit 10100, 1 # 10110
# puts set_bit 10100, 3 # 11100

# 1 0 1 0 1 &
# 1 1 0 1 1
# ---------
# 1 0 0 0 1

# set position to 0
def clear_bit num, position
  mask = ~(1 << position)
  render_binary(num & mask, 5)
end

# puts clear_bit 10101, 2 # 10001
# puts clear_bit 10101, 0 # 10100

# 1 0 1 0 1 XOR
# 0 1 0 0 0
# ---------
# 1 1 1 0 1

# 1 0 1 0 1 XOR
# 0 0 1 0 0
# ---------
# 1 0 0 0 1

def flip_bit num, position
  mask = 1 << position
  render_binary(num ^ mask, 5)
end

# puts flip_bit 10101, 2 # 10001
# puts flip_bit 10101, 3 # 11101

# 1 0 1 0 1 &&
# 0 0 1 0 0
# ---------
# 0 0 1 0 0 > 0

# 1 0 1 0 1 &&
# 0 1 0 0 0
# ---------
# 0 0 0 0 0 > 0

# return a boolean, "set" means = 1
def is_bit_set? num, position
  mask = 1 << position
  num & mask > 0
end

# puts is_bit_set? 10101, 2 # true
# puts is_bit_set? 10101, 3 # false

# return 0 or 1
def is_bit_set? num, position
  mask = 1 << position
  (num & mask) >> position
end

# puts is_bit_set? 10101, 2 # 1
# puts is_bit_set? 10101, 3 # 0

# 1 0 1 0 1 &
# 0 0 0 0 1
# ---------
# 0 0 0 0 1 == 0

# 1 0 1 0 0 &
# 0 0 0 0 1
# ---------
# 0 0 0 0 0 == 0

def even? num
  num & 1 == 0
end

# puts even? 10101 # false
# puts even? 10100 # true

# any power of two in binary has a leaing 1 and the rest all 0s

# 1 0 0 0 0
# -       1
# ---------
# 0 1 1 1 1

# 1 0 0 0 0 &
# 0 1 1 1 1
# ---------
# 0 0 0 0 0

# 1 0 0 0 1 &
# 1 0 0 0 0
# ---------
# 1 0 0 0 0

# 0 1 1 1 1 &
# 0 1 1 1 0
# ---------
# 0 1 1 1 0

# 0 0 0 0 1 &
# 0 0 0 0 0
# -----------
# 0 0 0 0 0

# returns a boolean, a power of 2 is 8,16,32,64,etc.
def power_of_two? num
  mask = num - 1
  num & mask == 0
end

# puts power_of_two? 01111 # false
# puts power_of_two? 10000 # true
# puts power_of_two? 10001 # false
# puts power_of_two? 00100 # true

# 1 0 1 0 1 XOR
# 0 1 1 0 1
# ---------
# 1 1 0 0 0 < 0

# 1 0 1 0 1 XOR
# 1 1 1 0 1
# ---------
# 0 1 0 0 0 < 0

def opposite_sign? num1, num2
  (num1 ^ num2) < 0
end

# puts opposite_sign? 10101, 01101 # false
# puts opposite_sign? 10101, 11101 # true
