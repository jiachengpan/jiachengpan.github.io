---
layout: post
title: Diary of April
modified:
categories: 
excerpt: Diary of the jobless (wish not entire) April
tags: [thoughts]
image:
  feature:
date: 2016-04-01T10:27:52+08:00
---

#### Day I, April the first.

都是泪。

从去年夏天有了这换工作的念想，随后告诉前同事，到年初下定决心交辞职信，老板挽留，再到昨天的离职，已半年有余。

我想我还是热爱着这份工作的。毕竟，它是毕业后的第一份工作，老板同事们都很好，还有能够相互敞开心扉的校友兼同事。
只是，弱势的部门的角色的感觉在每一个project做完后都会在我心中加深印象；越发熟练的我，却越发感觉陷入了comfort zone无法自拔。

我决定改变。却又不舍。

不舍这三年的情谊、老板的信任，不舍这环境，不舍未完成的、还有提升空间的测试工具，不舍周周都有false alarm、却承担着质量保证的regression failure，不舍那些坑。

但生活还是要继续。我要拥抱变化。泪，就让它流吧。流完了，或许新工作也便找到了。希望我不会辜负半年来的准备。

不过，在拥抱变化前，让我拥抱光华楼的阳光和猫，我知道你们能够止住我的泪水，让我重新回到找工作的正途中去。

TwT

----------

#### Day II, 2nd. April

早晨五点45分，出发扫墓。父亲去世九年，每年如此。

母亲每年都会叠无数的锡箔元宝，想必她是将思念寄托在这些上面了吧。

九年，我也只会诺诺地在坟前和母亲一起祈愿，保佑我们母子康健。

<br>

中午回来，去养老院看望外公。母亲兄妹四人依旧瞒着他外婆去世的消息，一年有余。看着午睡的外公，无言，离开。

<br>

或许今天太累，看CMU 15-418的课件总要睡着。。。于是转而看电影，《孩子们》，讲述韩国90年代的一宗悬案。依旧睡着。
但，梦见外婆，开门招呼“诚诚啊”。惊醒。

想起多年前梦见父亲，也是瞬间惊醒。为什么我不能多睡会儿，让他们把话讲完？

<br>

今天的我，似乎已经不会再为离职而流泪了。这是好事。我应该能集中精力coding并找工作了吧。

----------

##### Day III, 3rd. April

GAE-Cralwer

休息一天，写了一个不费脑力但又略有用处的东西：[GAE-Crawler](https://github.com/jiachengpan/gae-crawler)
主要就是一个cronjob，定时crawl东西，一方面可以是一个crawler，另一方面可以及时通知我讯息。

比如。。最近想入surface pro，于是特别关注相关的优惠。。。

又比如。。租房是个问题，这个或许可以成为一个小站的start point？（我固然知道已经有类似的了，例如zuber，但总觉的缺点什么。。（比如推送最新符合要求的讯息。。

Anyway，极其放松的一天。明天看外婆，扫完墓后继续fight！！

----------

##### Day IV, 4th. April

扫墓。

第二次到外婆的墓前。母亲依旧很伤心。锡箔烧了好久。

堵车。回到家已经将近4点。

稍微仔细地看了几份cmu15418在2015spring学期的project final write up，决定在下周尝试实现两个在GPU上：

* parallel minimum spanning tree
* TSP / ant colony optimization

之前费了好久（一周？）实现了GPU Gems里的并行betweenness算法。。或许有理由说工作忙。如今便没有理由了。

逛github，看到trending里有个[acm cheat sheet](https://github.com/soulmachine/acm-cheat-sheet)。拿过来看了下，蛮不错的，可以系统复习下算法了，虽然leetcode medium 和 hard尚未刷完。。。

另，逛知乎时发现操作系统的知识有些生疏了。。要补补。

就是这样。今天开始早睡早起。

----------

##### Day V, 5th. April

Mother's birthday. Happy birthday to her!!

Well, revisited KMP algorithm. I have to say that Professor Sedgewick's book is really fascinating! The elegant DFA approach is much cleaner than the "next" array approach, IMO.

AND!!! I just realised that fduwireless can access Google (and other blocked sites by [GFW](https://en.wikipedia.org/wiki/Great_Firewall)) quickly and freely!!
Lucky FDUers!

Also, starting to explore MST on GPU. I have decided to start with this [benchmark suite](http://www.cs.cmu.edu/~pbbs/benchmarks.html).

---------

##### Day VI, 6th, April

MST and GAE.

The serial implementation of MST in the [benchmark suite](http://www.cs.cmu.edu/~pbbs/benchmarks.html) is interesting:

* the union-find is so compact: it implements the path compression, and it uses negative values to represent the root size, so that implements weighted union-find for balancing the tree.
* it does a two-phase kruskal's algorithm -- after the first one which scans `min(4/3n, m)` edges, it takes a break to reduce the edges left so that only non-self ones remains. Then it does loop over the rest edges.

After reading the "Fast Minimum Spanning Tree Computation" in the GPU Computing Gems, I realise that I need more exercises and readings to know how to apply data-parallelism techniques.

I knew scan, split, segmented scan, etc. But I just could not think of such a nice way as the chapter does to parallelise the MST, even I now know Boruvka's algorithm.

Well. More exercises. I need to implement this first.

<br>
However, I again spent quite much time on the GAE crawler... extracting address, rent price, and room condition information from the post descriptions on Douban Group.

It is interesting, but not quite intellectually challenging. (yet still time consuming...

However, while I did thought of using some text analytics techniques I learnt from Coursera, it turns out a naiive approach of using a dictionary of names of Shanghai roads is simple and efficient!
Well, I will postpone the experiment which is "intellectually challenging"... (anyway, I dont think GAE can use sklearn...

<br>
Alright. That's all for today... I wish I can finish most of the MST problem tomorrow...

I DO need to start sending my resume...

---------

##### Day VII, 7th, April

Thrust.

Starting to implement MST using data parallelism. I was considering using thrust, which though I have known it for a long time, I havent really tried it in-depth.

And not quite surprisingly, I was stucked... by a compiling error. 
It turns out that I need to explicitly define the input type of a custom binaryOp functor, 
when I was attempting to use it with `thrust::reduce_by_key` with values being of `zip_iterator<tuple<counting_iterator, device_vector<double>::iterator>>` ...
i.e. the functor needs to be defined *without* something like `template<typename Tuple>`...

Okey... I didn't dig deeper into it (but I may when I have a chance) 
(and it confused me because when the values are of something like `zip_iterator<tuple<double, double>>`, the world is quiet and clear...)... 

Continue the MST tomorrow...

<br>
BTW, more explorations are made using GAE backend instances. I have long been waiting for this chance...
But it turns out that the function I added to my [GAE crawler](https://github.com/jiachengpan/gae-crawler) can just be served using frontend instances which saves a lot of running hours.
Well then, I reverted it to using frontend...

----------

##### Day VIII, 8th, April

Bug.

There is a bug in the random graph generator in the [benchmark suite](http://www.cs.cmu.edu/~pbbs/benchmarks.html), which claims to generate an undirected graph, but actually it is possible to: 1) generate duplicated edges; 2) generate loops if one take the edge list as one for a directed graph.

Maybe this is the most worthwhile finding today...

<br>

Wechat, which I again attempted to play with to create a "public service account" so as to provide message pushing service, 
again proved to be time-wasting since it doesnt provide enough permission for individuals to send messages actively, or even passively within 48 hours after user's action.

I didnt realise this until I have setup the GAE app and got everything to work roughly!!

I wont step into the time-wasting trap again. Wechat is nothing more than a chat app to me...

----------

##### Day IX, 9th, April

CodeJam.

This is the third time I participate this interesting competition, which always reminds me that I need try harder with algorithms.

As usual, the qualification round is relatively easy, and the solutions to the small problem are quite straight-forward:

* countingSheep: simply check the occurred digits. For the small problem, it is ok to setup a hard-coded upper limit to determine if the starting number is looping and one cannot visit all 10 digits -- i.e. yielding "INSOMNIA".
* pancakeRevenge: BFS can solve this -- in particluar the small problem. For the large one, errrrrr... I tried A* and got no luck... Not yet sure how to do it with DP if possible...
* jamcoin: just play with prime numbers... For base10, one can actually brute-force the divisors of the 16-length number as the upper limit shall be no longer than 8-digits, which takes about 100MB space to store the pre-computed primes, I believe.
However, when it comes to the large numbers, overflow is the major problem... I dropped it and went to lunch...
* fractiles: errrr... super easy for small since `S == K` -- one can always check the first `S` tiles since that can always partition out the pattern without gold. For the large one, errrr... again, I think I need to continue my minimum spanning tree problem (I am qualified to the second round anyway... barely...)

So, again, I can tell that I still need to try harder... I hope one day I can solve all these kinds of problems (the large ones) without any difficulties.

*(this post will not be published until the end of the qualification round)*


----------

##### Day X, 10th, April

MST. Again.

Finally... I have almostly completed the MST data parallelism. I am really behind the schedule. However, it is really both annoying and worthwhile to debug the *evitable* mistakes I made during writing parallel programmes and kernels.

It's a little bit late today. I will need to finish the write-up tomorrow.


----------

##### Day XI, 11th, April

Lessons.

There are so many pitfalls when using thrust... Sometimes you just cannot imagine what the function will behave -- you need to read the documents thoroughly and do real experiments (and fall into the pitfalls so as to feel it...).

I have got several good (Gosh!) experiences to remember here:

##### reduce_by_key

The one I used is like 

    reduce_by_key(keys.begin(), keys.end(), values.begin(), 
                  out_keys.begin(), out_values.begin(), 
                  binary_predicate(), 
                  binary_op())

Looks nice, doesnt it? However, the `out_keys` **does not** correspond to the `out_values` as the input key-values.

i.e. when your keys are like `(u, v)` pairs and you are customising the binary prediate so that only `u`'s are used; and when your binary_op is essentially a `minimum_op`:
the `out_values` are nice, but their corresponding keys are missing -- the `out_keys` may contain something that does not correspond to the minimum value of the `values`.

##### *still* reduce_by_key

This time, I used something like:

    reduce_by_key(kvs.begin(), kvs.end(), kvs.begin(),
                  out_kvs.begin(), out_kvs.begin(),
                  binary_predicate(), 
                  binary_op())

Well, I was too optimistic about thrust -- I shouldn't have assumed that it will "smartly" understand what my expectation is, which is I store both kv inside the same AOS, while using customised predicates and binop to do the segmentation and reduction.

And it's wrong -- the `out_kvs` in the `out_keys` position may be stored *after* the `out_kvs` in the `out_values` position got stored -- 
I was actually getting the result for `out_keys`, whose corresponding values are **not** reduced using my binary_op. And the real `out_kvs` for `out_values` which is what I want is overwritten!

##### printing device_vector

It is really very convenient to access device_vectors and print so as to debug, as long as the data type is primitive (e.g. int).

When it comes to struct, it seems that I need to do something like `SOME_STRUCT tmp = vec[i]`,
or (e.g. doing something like `cout << vec[i].something` rather than `cout << tmp.something`) I would get a really wierd value.

I guess maybe compiler thinks that it is a `device_dereference`? 

##### printf in kernel

Maybe I am too addicted to Python, but I shouldn't have used something like `printf("%s", var);` where `var` is an int!!

This is stupid...


<br>
And after verification, I notice that my MST isn't producing an MST with the smallest weight. Still debugging...

Wish me good luck tomorrow...

----------

##### Day XII, 12th, April

Correct but Corrupt.

My MST based on [this](http://dl.acm.org/citation.cfm?id=1572769.1572796&coll=ACM&dl=ACM&type=series&idx=SERIES304&part=series&WantType=Proceedings&title=GH) paper is finally implemented based on thrust correctly.

However, it fails the competion with the serial implementation using Kruskal's algorithm, by ~5x. After using nvvp, I realised that I hit the memory wall.

The `thrust::zip_iterator` is handy, but it shows that at least one of my kernels has high latency due to accessing tuple elements wrapped by `zip_iterator`.
I am not yet sure so far if I could improve it by transforming the original two data arrays into one. Let me try after dinner.

-----

![quoting something to my delight](../images/posts/Screenshot_2016-04-12_19-11-07.png)

<br>
When reading [Fast and Memory-Efficient Minimum Spanning Tree on the GPU](http://www.par.univie.ac.at/publications/download/TR-11-1.pdf#page=13),
I am content that I was implementing Boruvka's algorithm correctly following [Fast minimum spanning tree for large graphs on the GPU](http://dl.acm.org/citation.cfm?id=1572769.1572796&coll=ACM&dl=ACM&type=series&idx=SERIES304&part=series&WantType=Proceedings&title=GH),
because I also hit similar (if not exactly the sam) problems: 1) I need 2x edge_size memory; 2) sort is heavily needed for each iteration / recursion.

Of course, as I mentioned before dinner, I also suffered inefficient memory accessing problem, which is my fault T_T

<br>
I have further experimented. The most significant bottleneck is the `sort_by_key` call, which is highly bounded by memory. 
I am not sure but maybe there are just too many things to be moved (structs of 12 bytes and 8-byte double).

Experiments showed that smaller data elements present with better performance -- at least when I merged my AOS edges and array of weights with AOS edge+weight, the speed was degraded by half.

I will do more standalone experiments to see if this is indeed due to data size, or if it is my inferior usage of fancy iterators...

<br>
Generally, it has been a fruitful day, though I have been greatly behind my schedule.

However, feeling falling into pitfalls is just great, when I am interested in the path I am walking on, feeling that I can go further smoothly after all these.

I wish I still have time to implement something that can be *seen* as something eye-catching in my resume, knowing that I have been resting for nearly two weeks.


<br>
BTW, it's been 9 years my father passed away, on the 12th of April. His figure shall always remain in my heart. And I wish I, as his only son, has never and will never let him down. Bless my mother and me.


----------

##### Day XIII, 13th, April

It's been a nice morning since I found out how to improve the performance of my MST in terms of the sorting block. (see [this](http://jiacheng.space/improving-cuda-thrust-sorting-array-of-structs/))

However, I again falled into the swamp of bugs which I am still debugging now -- mistakes are made when using thrust, scattering / gathering in-place which is not supported, which makes the result **sometimes** correct and sometimes not...

And there is still a small bug remaining, which I will certainly fix tomorrow and seek for further improvement potentials (the current occupancy / memory bandwidth is still dissatisfying...).

----------

##### Day XIV, 14th, April

Comparison.

Until now which is eleven o'clock in the morning, I think I have achieved equivalent performance (if not better) as the author of [Fast minimum spanning tree for large graphs on the GPU](http://dl.acm.org/citation.cfm?id=1572769.1572796&coll=ACM&dl=ACM&type=series&idx=SERIES304&part=series&WantType=Proceedings&title=GH).
In fact, according to the paper [Fast and Memory-Efficient Minimum Spanning Tree on the GPU](http://www.par.univie.ac.at/publications/download/TR-11-1.pdf#page=13),
I achieved ~36.9ns/edge with input size being 10 million edges, (this counts each unique edge twice, but even if we count edges once (so the input is actually 5 million), the throughput is still 77.8ns/edge, which is still better than the author's figures...)
whereas in [Fast and Memory-Efficient Minimum Spanning Tree on the GPU](http://www.par.univie.ac.at/publications/download/TR-11-1.pdf#page=13), author achieved ~130ns/edge with the same input.

But I am not that happy -- compared with the serial implementation of Kruskal's algorithm with weight and path-compress union-find, I am still slow -- in the benchmark suite, the serial implementation achieved 29.5ns/edge performance.

So I will need to take a deeper look at the latter paper to see if I can squeeze more performance out of the algorithm...

(I was really depressed these days because in the first paper, author claimed that the speedup is ~40x compared to serial version. Gosh! I really dont know what serial verion they are comparing to... At least, my serial verion is faster than parallel version... And that made me down until today I realise that in terms of the figures, I am better...)

-----

OK. Experiments shows that my GPU implementation is a little bit worse than serial kruskal when handling random graph, but all better, especially for 2D grid graph, than serial kruskal by at most 2x.

This probably shows that memory accessing pattern is important to GPU -- the 2D grid, I can imagine, is much more regular than a random one. Whereas serial implementations look to be less sensitive.

-----

I really think that GAE is a time-consuming pitfall. I again wasted the entire afternoon on a wechat robot, which is still under construction...

I swear I will not touch it until I find a new job :angry:

----------

##### Day XV, 15th, April

Cloth.

OK. I have determined to change a course and implement a cloth simulator using CUDA and let the MST programme rest for a while (maybe 2 days?), reason being that I eagerly want to *see* something I have implemented :sunglasses:...

-----

The basic cloth simulation is interesting, and I am happy that I have successfully got openGL to work (for the first time :smile:), though there are still some bugs that make my cloth fly against the gravity and scatter...

----------

##### Day XVI, 16th, April

Beautiful Cloth.

Beautifully done (partially):

{% include image.html url="/images/posts/Screenshot_2016-04-16_23-54-51.png" description="flag" %}
{% include image.html url="/images/posts/Screenshot_2016-04-16_23-56-45.png" description="flat flag" %}
{% include image.html url="/images/posts/Screenshot_2016-04-16_23-58-23.png" description="wind comes from below" %}
{% include image.html url="/images/posts/Screenshot_2016-04-16_23-59-15.png" description="three-point fixed" %}

Though the self collision part is a little bit weird and need further debugging, and object-collision part is left undone.

I wish both of them can be completed tomorrow, and I will start implementing the CUDA version, which shan't be difficult (in fact, much simpler than MST) since I see really many parallelism potential opportunities...

  
---------

##### Day XVII, 17th, April

Rest.

I stayed at home for a rest today.

Despite this, I continued my cloth simulator a little bit, expanding it with constraint post-processing so as to reduce the possibility that the cloth explode... 
In fact, the method introduced by [this tutorial](http://cg.alexandra.dk/?p=147) is good enough. However, I still plan to implement [this famous paper](https://graphics.stanford.edu/papers/cloth-sig02/cloth.pdf), even though I really feel a little bit difficult when reading it... (No wonder... CG is really new to me...)

And a few wrap-up works are done today, pretty relaxed.

I think if things go well, I need to conclude this cloth simulation and embrace MST again, which looks much more interesting in terms of practising CUDA.

17 days... I need to hurry.


----------

##### Day XVIII, 18th, April

DPK

Data parallel Kruskal. 

Implementing... And I found yet more bugs... Havent really reached the phase to check QoR, since I am still struggling with the correctness.

But honestly, it is much easier to code since I am already very familiar with thrust, compared with previous experience.

I think it will be feasible to finish it by tomorrow and finish some write-up as a summary.

And I need to start sending my resume.


BTW, cloth simulator is just so simple, while bounded by the network speed, I need to postpone it since I can hardly visually see my programme as I work remotely in classroom -- the link speed is way too low...


----------

##### Day XIX, 19th, April

MST project is done.

I have finally implemented and verified DPK, which, to my delight, presents with 3x speedup compared to serial Kruskal's.

I understand that this figure is not that big, compared to many other applications' speedup with GPU, even though, I am very content since this figure is very much close (if not better) to the experiments presented in the papers.

The journey is tough, but meaningful.

Data parallel primitives are really helpful, and it is very interesting to restruct the MST problem into another form that fits the data parallelism.
Although there are quite many many pitfalls during the implementation, into which I falled tens of times, 
and tens of hours are spent, I am happy since I haven't really debugged a tough programme for years using C++ :joy:

Well, since this is done, I think I am ready to start hunting jobs, really.

And now, leetcode will be my friend :triumph:


-----

BTW, I really feel frustrated writing data-parallel primitives when implementing DPK -- sometimes I need to maintain the temporary arrays myself as registers to ASM...
Maybe I could find or implement something (interface?) that makes this much simpler (like spark?).


----------

##### Day XX, 20th, April

CV.

CV is updated. I am ready to fight.

----------

##### Day XXI, 21st, April

Leetcode

Reading papers about cloth collisions makes me headache :cry: (I am not into this field really after all :joy:)

So I decided to play with Leetcode... and finished yet another several M problems. (the pass ratio is not good enough, I need more practising)

Several former colleagues wished me good luck today, I wish I will.

The Chinese version CV is also updated today, with a better font selected :sunglasses: I think it is much better (more beautiful in shape) than the one forged three years ago.

I wish it will also help me to get several more interviews.

----------

##### Day XXII, 22nd, April

Break

I am not sure what I have done today, except reading the book *The Annotated STL Sources*...

Maybe I was experimenting porting Pandas to GAE, but withdrew; playing with ricequant and writing a new strategy; considering building a back-testing platform of my own, but distracted by too many choices...

OK. I need a break...


----------

##### Day XXIV, 24th, April

Geburtstag

I was very much surprised that the Doodle today is birthday cake for me :smile:

![cake](/images/posts/birthday-doodle.png)


And for two days, I have been resting enough -- breaking my swearing that I would not touch GAE until I got a job, and finally made the project [wechat-rent](https://github.com/jiachengpan/wechat-rent) work.

Basically if one want to make use of GAE freely, she needs to make full use of the memcache. Or, enjoy datastore operations hitting the quota limit!

In that sense, this project is far from being made public on wechat -- once users started to subscribe, I can imagine either it is going to stop working due to the limit, or my billing account is going to explode...


---

As for the job hunting, I need to be cautious to each interview, though I find it really simple to answer many of the questions as I felt from the previous interviews merely for fun.

Reading the book "The Annotated STL Sources", I realised that I am just not aware that I have known so much :smirk:

So, be ready and be yourself.

Cheers.


----------

##### Day XXVI, 26th, April

Leetcode, Leetcode, Leetcode...

It's been interesting to work on those problems, though some of them really made my brain explode almostly...

The most exciting moment is to know some approach in the forum that is so elegant, brief, and efficient, that one would really hope that she could though of such approach herself.

Anyway, I may not be that great, and it would be just lucky if I could get AC within 10 minutes for a medium problem... (and that's one reason for myself to push me try harder hopefully...

---

Well, tomorrow morning will be filled with an interview with IQIYI. Good luck!


----------

##### Day XXVII, 27th, April

Tired.

I am tired because IQIYI is located soooooooo far away and it is simply a waste of interviewee's time if the so-called interview is merely a "scan" lasting for slightly more than half an hour.
Why not just phone me to save me 2 hours plus 0.5 hour waiting at your lobby?

And I am really not accustomised to wearing suit... though I look really better than usual :smirk:


Besides, just got 2 more potential interview opportunities. Get ready!!


----------

##### Day XXX, 30th, April

Summary of April.

Time flies. I thought it would be yet afar but now it just comes.

Sadly I remain unemployed still, which is very much behind my plan. However, I think this jobless April makes me think and learn, and feel the life I have longed for three years after I started to work.

---

Think and learn.

I was usually overwhelmed by work, and some unimportant hobbies and affairs when I was employed, therefore hardly had got time to think deeply and dig deeply into something I showed interest.

I tried to take courses, listen lecture records, do course projects, do peer reviews, etc., wishing to touch a little bit deeper into some field that I was not into when I was in college.
I achieved my goal in general, and really felt that it was important to do a mocking project to really apply the knowledge learnt.

Two similar series of courses offered by UIUC. For the data mining, I really embraced it and carefully accomplished the projects. I learnt, and I remember. 
For the cloud computing capstone, on the contrast, I hardly did the projects as carefully as the data mining capstone, and the consequence is that I feel hollow when looking back at the scripts, codes I ever wrote, and the principles of the frameworks I ever used.

I know, that one cannot expect more that what she sacrificed.

And in April, I wish to re-gain the feeling of learning the data mining specialisation, while trying to soliden my knowledge in CUDA and parallel computing.
I did 2 small projects, deeply used thrust, reproduced 2 papers, read even more, and so on.

This not only prettified my CV, but also really impressed me with the parallel computing knowledge.
And most importantly, pushed me to feel as if I am doing the job I claimed to be pursuing -- parallel computing. Do I really want to do it for the next coming years?

Frankly, when hit memory walls and faced with bugs, I thought of giving up as usual. But I exclaimed, how could I be so weak that not even be able to pursue something you liked?
I have made inferior decisions before due to the lack of strong nerve. I cannot let it happen again, at least not now.

Then I continued, and I really cannot forget the feeling of delight when my programme just walked through and reproduced the performace claimed in the papers.

I succeeded.

And that should be one of the most fruitful experience gained during this jobless month.

---

Feeling the leisure life.

Leisure, I longed for it since I started to do the internship.

But when I really am free in terms of employment status, I cannot be delight.
I am still under pressure of unemployment and financial stress.

Although I attempted to swipe the bad feeling intentionally, by doing personal projects and fill up my schedule, I cannot overlook them when I rest in bed and closed my eyes.

Freedom of every aspect never exists.

And now I can certainly be sure that filling myself into a social position, be it a job or a student, is essential to be free in some certain extent -- I do not need to consider the pressure of sustaining life which is one of the aspects I think important.

(Or, maybe it is the feeling of depression after such a long time of being solitude socially, though I am not some extrovert person.)

---

*"out of a sudden", I realised that I have written so many mind-streaming bullshit...*

But anyway, go on and try harder. Find a job and pursue the wished life. 

