---
layout: post
title: A Line for a Leetcode Problem
modified:
categories: 
excerpt:
tags: []
image:
  feature:
date: 2016-04-27T13:45:58+08:00
---

Before it is too late.

I am going to record my solutions for all the leetcode problems, in one sentence for each -- albeit the fact that I have already done > 80 in this session and > 100 earlier months ago.

---

#### 1. two sum
Sort, loop and binary_search, and find the indices (nlogn + nlogn + n)

#### 9. Palindrome Number
Note the negative, use long to avoid overflow, just generate a reversed long and compare with the original

#### 27. Remove Element
Fast and slow, loop, swap, and when hit the val-to-remove skip incrementing slow.

#### 28. Implement strStr()
Brute-force shall surfice, but kmp is also good... (for dfa kmp, **do** understand the backup state!! (read *algorithms* by Robert Sedgewick)

#### 29. Divide Two Integers
2^n increment to determine the upper bound, binary search after upper bound is determined. **take care of overflow**!

#### 31. Next Permutation
(read stl code...) find the first misordered one (ascending pair, item first) from backward, find the first guy bigger than the misordered one, swap, reverse everything beyond the misordered one.
(this makes sure the first misordered guy is corrected by the first bigger guy, and reversing makes sure the guys beyond the misordered guy are ascending)

#### 34. Search for a Range
`lower_bound` and `upper_bound` can do the trick, or one can write his own binary search routines.

#### 35. Search Insert Position
`lower_bound` can do the trick.

#### 38. Count and Say
Just loop and call a "transform" function as per the question's requirement

#### 39. Combination Sum
DFS, maintaining a current pos in candidates, a current chosen list and current value, and the next chosen candidates being all candidates beyond pos if they are smaller than `(target-current_value)`.

#### 46. Permutations
Sort and `stl::next_permutation` can do the trick

#### 58. Length of Last Word 
Loop, note the space indice, note the non-space right bound, and get the difference between these two indices.

#### 67. Add Binary
Simple... loop over and maintain a carry

#### 74. Search a 2D Matrix
`lower_bound`, `lower_bound`, note how to choose `mid` so that there would not be an infinite loop. (ceil or floor the mid)

#### 75. Sort Colors
Partition (see *Algorithms*); or bucket / radix sort.

#### 89. Gray Code
The next 2^i gray codes are essentially the same reverse-ordered generated 2^i code sequence with each of them setting their next-highest bit.

#### 96. Unique Binary Search Trees
DP. using different number as the root, the count of BST of such configuration is the product of the configurations of left subtrees and the one of right subtrees.

#### 101. Symmetric Tree
A tree is symmetric if its left subtree is mirror of its right subtree, and left-left right-right, left-right right-left, recursively judged by a helper predicate function.

#### 134. Gas Station
Contract neighbour net-costs (gas-cost) when both negative or first positive and sum positive, and move the last to first, and do again, until the length is 1 or 2, using the sign of the last element to determine if feasible to travel around.

#### 143. Reorder List
Two pointers to find the middle, reverse the tail, contract the head and tail until met.

#### 153. Find Minimum in Rotated Sorted Array
Binary search. Take care of a sorted sub-partition -- you may run into the maximum instead of the minimum...

#### 155. Min Stack
Two stacks, one normal, one minstack.

#### 190. Reverse Bits
Mask, shift, and, or...

#### 203. Remove Linked List Elements
Simple... loop over and delete.

#### 222. Count Complete Tree Nodes
When left-most level == right-most level, return 2^level-1, otherwise, recursively count the left subtree and right subtree.

#### 274. H-Index
Binary search, using the indices and the descending-sorted citation count.

#### 275. H-Index II
Binary search, same as 274 albeit the sorting order is ascending.

#### 278. First Bad Version
Binary search.

#### 319. Bulb Switcher
Brainteaser... I cannot know the optimal solution unless reading [this](https://leetcode.com/discuss/91371/share-my-o-1-solution-with-explanation)

