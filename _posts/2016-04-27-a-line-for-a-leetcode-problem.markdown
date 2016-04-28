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

I am going to record my solutions for all the leetcode problems, in one line for each -- albeit the fact that I have already done > 80 in this session and > 100 earlier months ago.

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

#### 38. Count and Say
Just loop and call a "transform" function as per the question's requirement

#### 46. Permutations
Sort and `stl::next_permutation` can do the trick

#### 58. Length of Last Word 
Loop, note the space indice, note the non-space right bound, and get the difference between these two indices.

#### 67. Add Binary
Simple... loop over and maintain a carry

#### 75. Sort Colors
Partition (see *Algorithms*); or bucket / radix sort.

#### 89. Gray Code
The next 2^i gray codes are essentially the same reverse-ordered generated 2^i code sequence with each of them setting their next-highest bit.

#### 96. Unique Binary Search Trees
DP. using different number as the root, the count of BST of such configuration is the product of the configurations of left subtrees and the one of right subtrees.

#### 101. Symmetric Tree
A tree is symmetric if its left subtree is mirror of its right subtree, and left-left right-right, left-right right-left, recursively judged by a helper predicate function.

#### 190. Reverse Bits
Mask, shift, and, or...

#### 203. Remove Linked List Elements
Simple... loop over and delete.

#### 319. Bulb Switcher
Brainteaser... I cannot know the optimal solution unless reading [this](https://leetcode.com/discuss/91371/share-my-o-1-solution-with-explanation)

