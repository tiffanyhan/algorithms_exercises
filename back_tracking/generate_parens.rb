# Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.

# For example, given n = 3, a solution set is:

# [
#   "((()))",
#   "(()())",
#   "(())()",
#   "()(())",
#   "()()()"
# ]

# result is an array of strings
# so combo is a string, we generate a new string every time (no mutation)

# which is the backtracking part?
# return when length of string == max_pairs * 2
# no need to continue, bc after this no further solution is promising
# since we want solutions of a certain length

# after we return, we can climb out of the rabbit hole and jump into the other rabbit hole

# rules
# our open_count cannot be more than pair_count - only add closing parentheses now

#           (
#          /\
#         (
#        /  \
#       (    )
#       /\  /  \
#         )
#        / \
#           )
#           \
#            )

# @param {Integer} n
# @return {String[]}
def generate_parenthesis(n)
  result = []
  backtrack(result, "(", 1, 1, n)
  result
end

def backtrack(result, solution, pair_count, open_count, n)
  if solution.length == n * 2
    result << solution
    return
  end

  if open_count == 0
    backtrack(result, solution + "(", pair_count + 1, open_count + 1, n)
  elsif pair_count >= n
    backtrack(result, solution + ")", pair_count, open_count - 1, n)
  else
    backtrack(result, solution + "(", pair_count + 1, open_count + 1, n)
    backtrack(result, solution + ")", pair_count, open_count - 1, n)
  end
end

p generate_parenthesis 3

# ( first if is true; parens_helper pushed onto stack
# ( first if is true; parens_helper pushed onto stack
# ( first if is true; parens_helper pushed onto stack
# ) first if is false, second if true; parens_helper pushed onto stack
# ) first if is false, second if true; parens_helper pushed onto stack
# ) first if is false, second if true; parens_helper pushed onto stack

# return

# parens_helper popped from stack, (last line of call is evaluated)
# parens_helper popped from stack, (last line of call is evaluated)
# parens_helper popped from stack, (last line of call is evaluated)

# back to
# (
# (
# return from recursive call in first if condition
# execution continues (did not return anything yet)
# ) second if is true; parens_helper pushed onto stack
# ( first if is true; parens_helper pushed onto stack
# ) first if is false, second if is true; parens_helper pushed onto stack
# ) first if is false, second if is true; parens_helper pushed onto stack

# return

# parens_helper popped from stack, (last line of call is evaluated)
# parens_helper popped from stack, (last line of call is evaluated)

# back to

# (
# (
# ) x
# return from recursive call in first if condition
# execution continues (did not return anything yet)
# ) second if is true; parens_helper pushed onto stack x
# ( first if is true; parens_helper pushed onto stack x
# ) first if is false, second if is true; parens_helper pushed onto stack x

# return

# parens_helper popped from stack, (last line of call is evaluated)
# execution continues, second if is false
# parens_helper popped from stack, (last line of call is evaluated)
# parens_helper popped from stack, (last line of call is evaluated)
# parens_helper popped from stack, (last line of call is evaluated)

# (
# )

# [
#   "((()))",
#   "(()())",
#   "(())()",
#   "()(())",
#   "()()()"
# ]

def generate_parenthesis max_pairs
  parens_helper result=[], '', max_pairs, 0, 0
  result
end

def parens_helper result, combo, max_pairs, left, right
  return result << combo if combo.length == max_pairs * 2

  parens_helper(result, combo+'(', max_pairs, left+1, right  ) if left  < max_pairs
  parens_helper(result, combo+')', max_pairs, left  , right+1) if right < left
end

# kevin's solution and notes

# well-formed parens:
#   - all the open parens have to match the close parens


# - solution?
#   - a string (2*n length) of well formed parens
# - branching?
#   - how do I build to the solution one step at a time?
#   - what's a step?
#     - add a '('
#     - add a ')'
# - dead end?
#    - can't have close paren before an open paren
#       - remaining_open_parens
#       - if remaining_open_parens < 0
#         - backtrack
#   - more than n open parens, backtrack
# - adjust state?
#   - yes if I mutate string
#   - no if I create a new string out of concatenation

# @param {Integer} n
# @return {String[]}
def generate_parenthesis(n)
  result = []
  generate_parenthesis_helper(n, "", 0, 0, result)
  result
end

def generate_parenthesis_helper(n, solution, left, right, result)
  return if left > n || right > n || right > left
  if solution.size == 2*n
    result << solution.clone
  else
    generate_parenthesis_helper(n, solution+"(", left+1, right, result)
    generate_parenthesis_helper(n, solution+")", left, right+1, result)
  end
end
