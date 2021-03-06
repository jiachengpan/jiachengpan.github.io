---
layout: post
title: A Sentence for a Leetcode Problem
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

#### 15. 3Sum
Outer loop iterates the first guy of result triplets, inner loop tries to contract the left subarray so as to find the other two of the resulting triplets. Note to remove duplicates by skipping duplicate elements.

#### 16. 3Sum Closest 
Same as 15.

#### 18. 4Sum
Similar to 3Sum. Note that one can think of some way to do pruning. (e.g. skip when 3*MAX_OF_SUB_ARRAY < TARGET)

#### 19. Remove Nth Node From End of List 
Two pointers with n-offset.

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

#### 40. Combination Sum II
DFS, maintaining a start pos in candidates and a current chosen list, push result when current sum equals to target.

#### 46. Permutations
Sort and `stl::next_permutation` can do the trick

#### 47. Permutations II
`next_permutation` (make sure you know how to implement it yourself)

#### 58. Length of Last Word 
Loop, note the space indice, note the non-space right bound, and get the difference between these two indices.

#### 60. Permutation Sequence
From left to right, each digit of the result can be determined by chosing the $floor(k / fac(n-i))$-th candidate digits where $i$ refer to $i$th digit, and after each step, the chosen digit shall be removed. The candidate digits are sorted ascendingly.

#### 61. Rotate List
Find the length, find where to disconnect, connect the first segment to the tail. (note if k >= length, we need to mod it)

#### 63. Unique Paths II 
DP. Simply set 0 to blocked grid. Note this applies to the first row and column -- one should not simply set them to 1 as in problem "Unique Paths".

#### 67. Add Binary
Simple... loop over and maintain a carry

#### 69. Sqrt(x)
Newton's method.

#### 71. Simplify Path
Just split tokens using "/", and pop when hit "..". Note when the tokens (to pop) is empty and dont forget to push the last token even if there is no trailing "/".

#### 74. Search a 2D Matrix
`lower_bound`, `lower_bound`, note how to choose `mid` so that there would not be an infinite loop. (ceil or floor the mid)

#### 75. Sort Colors
Partition (see *Algorithms*); or bucket / radix sort.

#### 77. Combinations 
DFS, maintaining a current list and current start.

#### 79. Word Search
Recursive DFS. Better to reuse `board` to keep track of visited grid -- it's simpler.

#### 80. Remove Duplicates from Sorted Array II
Two pointers with `prev` and `first` -- one more predicate than duplicate I.

#### 86. Partition List
Advance pointer to the first guy that is >= x, record it, and when further advancing the earlier pointer, move the node to the position before the recorded position if the node is < x.

#### 89. Gray Code
The next 2^i gray codes are essentially the same reverse-ordered generated 2^i code sequence with each of them setting their next-highest bit.

#### 93. Restore IP Addresses
DFS / backtracking. Note we dont allow 0-leaded number e.g. 01.01.01.01

#### 95. Unique Binary Search Trees II
DP, storing $f(x)$, and $f(x+1) = (f_0(0) \times f_1(x)) + (f_0(1) \times f_2(x-1)) + ...$, where the subscript of $f()$ means that all the nodes of the trees represented by $f()$ need to increment their values by the subscript so as to meet the requirement of a BST.
 
#### 96. Unique Binary Search Trees
DP. using different number as the root, the count of BST of such configuration is the product of the configurations of left subtrees and the one of right subtrees.

#### 101. Symmetric Tree
A tree is symmetric if its left subtree is mirror of its right subtree, and left-left right-right, left-right right-left, recursively judged by a helper predicate function.

#### 108. Convert Sorted Array to Binary Search Tree
DFS. Divide and conquer, half by half.

#### 120. Triangle 
DP using an array with size being the size of the last row of the triangle, following $min_paths(x) = min_path + min(x) for min_path in min_paths(x-1)$ where $min_paths()$ refers to the solution function and $min()$ refers to the minimum next-value of the two elements of the corresponding path.

#### 121. Best Time to Buy and Sell Stock 
Overkilling way: DP with 2 states as 309; simple way: maintain a `min_price` and `max_profit` (derived by `price[i]-min_price`).

#### 131. Palindrome Partitioning 
DFS / backtracking, with optional 2d array for storing substr-being-parlidrome predicate.

#### 133. Clone Graph 
DFS. Note how to handle when the node is already visited -- we still need to add the cloned node to the neighbours.

#### 134. Gas Station
Contract neighbour net-costs (gas-cost) when both negative or first positive and sum positive, and move the last to first, and do again, until the length is 1 or 2, using the sign of the last element to determine if feasible to travel around.

#### 142. Linked List Cycle II  
Two pointers, fast and slow. Assume the start of circle is X steps away from the head, slow goes K steps after entering the circle and fast goes 2K+2X in total. We have `K%C = (2K+X)%C => (K+X)%C = 0`. i.e. when fast and slow hits, fast is X steps away from the entrance. So we just need to reset slow to head and increment both step by step.

#### 143. Reorder List
Two pointers to find the middle, reverse the tail, contract the head and tail until met.

#### 151. Reverse Words in a String
Remove duplicate / trailing / leading spaces, reverse each word, and reverse the entire string.

#### 153. Find Minimum in Rotated Sorted Array
Binary search. Take care of a sorted sub-partition -- you may run into the maximum instead of the minimum...

#### 155. Min Stack
Two stacks, one normal, one minstack.

#### 162. Find Peak Element 
Binary search. Recursively search the "increasing" part by checking the middle item trend / differential compared to its neighbours. When the middle item is a peak itself, obviously return it as well.

#### 172. Factorial Trailing Zeroes
Count how many 5s... Note that 25 has two 5s, and 125 three 5s, and so on... ($\log_5n$)

#### 190. Reverse Bits
Mask, shift, and, or...

#### 203. Remove Linked List Elements
Simple... loop over and delete.

#### 207. Course Schedule
is_dag.
<br> *the BFS way to detect cycles in [this post](https://leetcode.com/discuss/42543/18-22-lines-c-bfs-dfs-solutions) is interesting *

#### 209. Minimum Size Subarray Sum
Two pointers, shrink the subarray when sum matches the requirement.

#### 210. Course Schedule II
Topology sort. Refer to *Algorithms* by Robert Sedgewick.

#### 211. Add and Search Word - Data structure design
Trie and DFS (for '.' case). Don't forget to initialise pointers even if they are NULL!!

#### 216. Combination Sum III
DFS / backtracking. Simple.

#### 221. Maximal Square 
DP. $f(x, y) = min(f(x-1, y-1), f(x, y-1), f(x-1, y)) + 1$ if $matrix(x, y)$ else $0$ where $f()$ represents the max width of square that can be formed using this point as bottom-right corner.

#### 222. Count Complete Tree Nodes
When left-most level == right-most level, return 2^level-1, otherwise, recursively count the left subtree and right subtree.

#### 229. Majority Element II
[Boyer-Moore majority vote algorithm](https://leetcode.com/discuss/43248/boyer-moore-majority-vote-algorithm-and-my-elaboration). Two counters. $log(2n)$ -- 2 loops, first get the two candidates, then get the real count of the two candidates and see if they meet the requirement.

#### 264. Ugly Number II
DP. Maintain a vector of indices showing for each prime what the last ugly number is. Each iteration is essentially finding the minimum of the product of each prime and their "last ugly number". For each hit, increment their indices to point to the next ugly.

#### 274. H-Index
Binary search, using the indices and the descending-sorted citation count.

#### 275. H-Index II
Binary search, same as 274 albeit the sorting order is ascending.

#### 278. First Bad Version
Binary search.

#### 279. Perfect Squares
DP. $f(n) = \min(f(n-i) + f(i))$ where $i$ is a perfect square number. Or, a [better solution](https://leetcode.com/discuss/57020/java-solution-o-n-1-2-time-and-o-1-space), and refer to [Lagrange's four-square theorem](https://en.wikipedia.org/wiki/Lagrange%27s_four-square_theorem)

#### 303. Range Sum Query - Immutable 
Prefix sum.

#### 304. Range Sum Query 2D - Immutable
Prefix sum. Or more daring: ["2d" prefix sum](https://leetcode.com/discuss/69424/clean-c-solution-and-explaination-o-mn-space-with-o-1-time)

#### 309  Best Time to Buy and Sell Stock with Cooldown
DP with state machine (3n space complexity, 3 for three states -- before buy / after cooling, after buy / before sell, after sell / before cooling). Refer to [this post](https://leetcode.com/discuss/72030/share-my-dp-solution-by-state-machine-thinking)

#### 310. Minimum Height Trees
BFS, shrinking the graph from outer frontier where nodes only has one degree, updating the degrees as the frontier nodes are removed.

#### 319. Bulb Switcher
Brainteaser... I cannot know the optimal solution unless reading [this](https://leetcode.com/discuss/91371/share-my-o-1-solution-with-explanation)

#### 322. Coin Change
DP. $f(x) = \min(f(x-coin_i)+1)$ where $f()$ refer to the coin number. 
<br>*TODO: Pruning need to be done so as to reduce the runtime?*

#### 332. Reconstruct Itinerary
DFS, tracking edge count. [a better solution resembles topology sort](https://leetcode.com/discuss/85439/short-iterative-solution-explanation-recursive-backtracking)

#### 347. Top K Frequent Elements
Sort, sort by occurrence, get the first K. nlogn (using heap can be faster I think, though complexity is still nlogn).

