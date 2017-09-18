/**
 * @param {string} s
 * @param {string[]} wordDict
 * @return {boolean}
 */

/* mental model: can the word ending at index i (exclusive) be segmented into dictionary words? */
// boolean in the cache means that the substr from 0 to that idx (exclusive) CAN be
// segmented into valid dictionary words

// i represents the ending idx (exclusive) of the word we're considering
// what does j represent? j seems to represent the indices coming before the partition
  // j represents the idx right before where the substr starts that
  // ends at i

// 'leetcode'
// i = 1
// j = 0

// dp[0] => true
// s.slice(j, i) => 'l'

// if true && true
//   dp[i] = true // the substr ending at i (exclusive) CAN be segmented into dictionary words

// i = 2
// j = 0

// dp[0] => true
// s.slice(j, i) => 'le'

// i = 2
// j = 1

// dp[1] => boolean 'l'
// s.slice(j, i) => 'e'

// outer loop:
//   'leetcode' =>
//   'l'           i = 1
//   'le'
//   'lee'
//   'leet'
//   'leetc'
//   'leetco'
//   'leetcod'
//   'leetcode'    i = s.length

// inner loop:
  // say our outer loop is on 'leet', i = 4
  // j goes from 0..3
    // 'leet'         j = 0, check if str ending at idx 0 excl is valid, E.g. ''
    // 'eet'          j = 1, check if str ending at idx 1 excl is valid, E.g. 'l'
    // 'et'           j = 2, check if str ending at idx 2 excl is valid, E.g. 'le'
    // 't'            j = 3, check if str ending at idx 3 excl is valid, E.g. 'lee'

    // ''      'l'

    // ''       'le'
    // 'l'      'e' (first one)

    // ''        'lee'
    // 'l'       'ee'
    // 'le'      'e' (second one)

    // 'lee' => 'l', 'e', 'e'
    //          'l', 'ee'
    //          'le', 'e'
    //          'lee'

    // ''      'leet'
    // 'l'     'eet'
    // 'le'    'et'
    // 'lee'   't'

// outer loop expands, while inner loop contracts

// does this give us all possible partitions? yup
// notice that when we generate all possible partitions,
// we reuse certain sub-partitions over again. (makes sense when you think of branching)
// our solution makes use of a cache to reuse the result we already got for these repeats

// the && ensures that we only check if 2nd partition is valid,
// IF the first partition was valid (nice short-circuiting behavior)

// first partition validity already set, bc
// before it was the second partition of earlier iterations

// we break bc we already have our answer:
// whether the substring ending here can be validly segmented
// doesn't matter if this can happen correctly in more than one way

var wordBreak = function(s, wordDict) {
  var cache = [true];

  for (var expandIdx = 1; expandIdx <= s.length; expandIdx++) {
    for (var contractIdx = 0; contractIdx < expandIdx; contractIdx++) {

      if (cache[contractIdx] && wordDict.includes(s.slice(contractIdx, expandIdx))) {
        cache[expandIdx] = true;
        break;
      }
    }
  }

  return !!cache[s.length];
};
