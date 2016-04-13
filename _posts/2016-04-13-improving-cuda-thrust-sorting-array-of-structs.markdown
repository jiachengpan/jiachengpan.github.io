---
layout: post
title: Improving Cuda Thrust Sorting Array of Structs
modified:
categories: 
excerpt:
tags: [cuda]
image:
  feature:
date: 2016-04-13T12:11:40+08:00
---

Inspired by [this post](http://stackoverflow.com/questions/23541503/sorting-arrays-of-structures-in-cuda),
I realised that there are much potential for improvement in my MST implementation, in particular the sorting part.

I am noting some experimental results in this post as a future reminder.

Essentially, I did a standalone performance timing on:

1. directly sorting cuda builtin type `int3`;
2. directly sorting user struct type containing `int x, y, z` which is the same as `int3`;
3. split the struct into 2 (keys and values) arrays and first do `sort_by_key` along with the indices, and then scatter the values using the indices.

The code:

{% gist jiachengpan/5f53eb055b75ab0c4059d615f8b3a7c2 %}

The result:

    Sorting sort_array_of_int3 elapsed time:  111.8 ms 
    Sorting sort_array_of_struct elapsed time:  110.4 ms 
    Sorting sort_struct_of_array elapsed time:  33.3 ms 

Obviously, it is much faster if we only sort on small data (the key and indices), and then use `gather` to move the values as well.
This reduces memory bandwith during the sort (therefore improving the performance), and gathering is very efficient as well.

Strangely, the performances of sorting int3 and struct are on-par, while what I think I observed in my MST implementation, int3 presented with better performance... Not yet sure why...

Sometimes, a habit of using less steps dominates my mind when coding, mostly because usually in serial programmes this means better efficiency.

But in GPU programming, more steps doesnt necessarily mean bad performance as long as one makes memory accessing pattern coaleased. And that is what GPU programming fascinates me (and I have a long way to go...).

