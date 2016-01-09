---
layout: post
title: Pattern Discovery in Data Mining -- Course Notes 
tags:
  - coursera
date: 2015-02-22 19:17:16 +0800
excerpt: "Coursera course note of pattern discovery in data mininig"
---

Pattern Evaluation
------------------

### Limitation of the Support-Confidence Framework
* How to judge if a Rule / Pattern is **Interesting**  
    * Measures: **Objective** vs. **Subjective**
    * Objective:
        * Measures: support, confidence, correlation, ...
    * Subjective:
        * One man's trash could be another man's treasure
        * Query-based: relevant to a user's particular request
        * Against one's knowledge: expectation, freshness, timeliness
        * Visualisation tools: multi-dimensional, interactive examination
            * let user pick
* Limitation of the Support-Confidence Framework
    * Example data:
        1. play-basketball => eat-cereal (40%, 66.7%) (high s&c) 
        2. not-play-basketball => eat-cereal (35%, 87.5%) (high s&c) 
    * Interpretations:
        * play-basketball is more likely to eat-cereal, deduced by high support of data 1.
        * not-play-basketball is more likely to eat-cereal, deduced by high confidence of data 2.

{% include image.html url="/images/diaries/feb/example-limitation-of-support-confidence.png" description="Example of Limitation of the Support-Confidence Framework"%}

### Interestingness Measures: Lift and $\chi^2$
* Lift
    * $lift(B, C) = \frac{c(B \rightarrow C)}{s( C )} = \frac{s(B \cup C)}{s(B) * s( C )}$
    * B: play-basketball, C: eat-cereal
    * Measure of dependent / correlated events
        * = 1: B and C are independent
        * \> 1: B and C are positively correlated
        * < 1: B and C are negatively correlated
        * intuition: $p(B\|C) = p(B) * lift(B, C)$ 
            * if C happens, the intrinsic probability of B is then *lifted* by a factor of **$lift(B, C)$**
        * e.g. $lift(B, C) = 0.89$, $lift(B, \bar{C}) = 1.33$
            * B and C are negatively correlated
            * i.e. B and not-C are positively correlated
* $\chi^2$
    * $\chi^2 = \sum{\frac{(\text{Observed} - \text{Expected})^2}{\text{Expected}}}$
    * For B, C: "Expected" value of B is determined by the distribution of C, and vise versa
        * e.g. using C distribution, which is $750:250 = 3:1$ to determine B, that is $3:1 = 450:150$ 
        * e.g. using B distribution, which is $600:400 = 3:2$ to determine not-C, that is $3:2 = 150:100$
    * Measure of correlated events
        * = 0: independent
        * \> 0: correlated, positive or negative, need further evaluation
        * e.g. $\chi^2 = \frac{(400 - 450)^2}{450} + \frac{(350 - 300)^2}{300} + \frac{(200 - 150)^2}{150} + \frac{(50 - 100)^2}{100} = 55.56$ (slides may be incorrect)
            * according to the example data, B and C are negatively correlated, since the expected value is 450, but the observed is 400

{% include image.html url="/images/diaries/feb/example-chi-square.png" description="Example of $\chi^2$, Expected value vs. Observed value"%}

* Null transactions may "spoil the soup"
    * Null transactions: transactions that contain neither B nor C
    * e.g. $BC$(100) is smaller than $\bar{B}C$(1000), $B\bar{C}$(1000), and $\bar{B}\bar{C}$(100000)
        * B and C are unlikely to happen together
        * but $lift$ and $\chi^2$ both yields that B and C are positively correlated, which is contrary to the direct impression

{% include image.html url="/images/diaries/feb/example-null-transactions.png" description="Example with big null-transactions"%}

### Null Invariance Measures
* Null invariance: Value does not change with the number of null-transactions

{% include image.html url="/images/diaries/feb/interestingness-measures.png" description="A few interestingness measures"%}

* Null invariance: an important property
    * when null-transactions goes either too-big or too-small, things might go wrong
    * for the table below:
        * $D_1$ shows that milk and coffee are more likely to be bought together
        * but for $D_2$, with too-small null-transactions, the independent conclusion of lift and $\chi^2$ is incorrect
        * same for $D_3$, with too-big null-transactions, the positive correlated conclusion is incorrect
            * when the data actually shows that milk and coffee are more likely to be bought separately

{% include image.html url="/images/diaries/feb/example-null-invariance.png" description="Example to show the importance of null invariance"%}

### Comparison of Null-Invariant Measures
* Conclusion: Kulc with Imbalance-Ratio together present a clear picture
* $Kulczynski(A, B) = \frac{1}{2} (\frac{s(A \cup B)}{s(A)} + \frac{s(A \cup B)}{s(B)}) $
* $IR(A, B) = \frac{\|s(A) - s(B)\|}{s(A) + s(B) - s(A \cup B)}$
* e.g. $D_4$ is neutral and balanced, $D_5$ and $D_6$ are neutral and imbalanced
* real example: analysis of DBLP co-author relationships
    * advisor-advisee relationship is more likely when authors correlation is imbalanced
    * advisee is more likely to publish papers with advisor, but advisor not with advisee since he may publish papers with others

{% include image.html url="/images/diaries/feb/example-kulc-measure.png" description="Example to show Kulczynski and IR"%}



Mining Diverse Patterns
-----------------------
### Mining Multi-Level Associations
* Items often form hierarchies
* How to set min-support thresholds?
    * Uniform min-support across multiple levels
    * Level-reduced min-support: items at lower level are expected to have lower support
* Efficient mining: **shared** multi-level mining
    * use the lowest min-support to pass down the set of candidates
    * later use the higher min-support to filter when doing further analyses

{% include image.html url="/images/diaries/feb/multi-level-min-support-thresholds.png" description="Multi-level min-support thresholds"%}

* Redundancy filtering at mining multi-level associations
    * A rule is **redundant** if its support is close to *expected* value, according to its *ancestor* rule (rule of higher level), and it has a similar confidence as its *ancestor*
    * Such rule should be pruned
* Customised min-support for different kinds of items
    * Items differ in values, therefore differ in frequency
    * It is necessary to have customised min-support settings for different kinds of items

### Mining Multi-Dimensional Associations
* Single dimensional rules 
    * e.g. buys(X, "milk") => buys(X, "bread")
* Multi-dimensional rules
    * inter-dimension association rules (no repeated predicates)
        * e.g. age(X, "18-25") ^ occupation(X, "student") => buys(X, "coke")
    * hybrid-dimension association rules (repeated predicates)
        * e.g. age(X, "18-25") ^ buys(X, "popcorn") => buys(X, "coke")
* Attributes can be categorical or numerical
    * categorical: e.g. "bread", "milk"
    * numerical: e.g. 15, 20

### Mining Quantitative Associations
* Mining Quantitative Associations
    * methods
        * Static discretization based on pre-defined concept hierarchies
            * discretization: partitioning numerical attributes, e.g. age: 18-20, 20-25, etc.
            * data-cube-based aggregation
        * Dynamic discretization based on data distribution
        * Clustering: Distance-based association
            * first one-dimensional clustering, then association
        * Deviation analysis:
            * e.g. gender == female => wage: 7\$/hr, while overall: 9\$/hr, this may be interesting...
* Mining Extraordinary Phenomena in Quantitative Association Mining
    * Mining Extraordinary / Interesting phenomena
        * e.g. gender == female => wage: 7\$/hr (while overall: 9\$/hr)
        * LHS: a subset of the population
        * RHS: an extraordinary behaviour of this subset
    * The rule is accepted only if a statistical test (e.g. Z-test) confirms the inference with high confidence
    * Subrule: highlights the extraordinary behaviour of a subset of the population of the super rule
        * e.g. (gender == female) ^ (south == yes) => wage: 7\$/hr (while overall: 9\$/hr)
    * Rule condition may be categorical or numerical

### Mining Negative Correlations
* Rare Patterns vs. Negative Patterns
    * Rare patterns
        * very low support, but interesting (e.g. buying Rolex watches)
        * need to set customised min-support thresholds for different groups of items
            * usually small for these rare ones
    * Negative patterns
        * negatively correlated -- unlikely to happen together
* Defining Negative Correlated Patterns
    * A support-based definition
        * if A and B are both *frequent* but rarely occur together, i.e. $sup(A \cup B) \ll sup(A) * sup(B)$
        * then they are negatively correlated
        * actually that is: $lift(A, B) = \frac{sup(A \cup B)}{sup(A) * sup(B)} \ll 1$
        * $lift(A, B) \ll 1$
    * This definition may be **not good** when
        * there are **many null-transactions**
    * A good definition should take care of the null-invariance problem
    * A Kulczynski-measure-based definition
        * if item A and B are frequent but $\frac{1}{2}(P(A\|B) + P(B\|A)) < \epsilon $
        * $\epsilon$ is a negative pattern threshold, then A and B are negatively correlated
        * Kulczynski measure ranges from 0 to 1, the smaller, the more confidence of negative correlation

### Mining Compressed Patterns
* Why: Too many scattered patterns but not so meaningful
    * For the example below:
        * using closed patterns, there will still be many output (no compression actually)
        * using max patterns, output will be P3, which has information loss
        * desired output may be P2, P3, P4
* How:
    * Pattern distance measure
        * $Dist(P1, P2) = 1 - \frac{\|T(P1) \cap T(P2)\|}{\|T(P1) \cup T(P2)\|}$
    * $\delta$-clustering
        * for each pattern P, find all patterns
            * which can be expressed by P
            * whose distance to P is within $\delta$ ($\delta$-cover)
        * all patterns in the cluster can be represented by P
        * there are methods for efficiently directly mining the compressed frequent patterns

{% include image.html url="/images/diaries/feb/example-mining-compressed-patterns.png" description="Example of Mining Compressed Patterns"%}

* Redundancy-aware top-k patterns
    * Desired patterns: high significance & low redundancy
    * For the picture below:
        * Traditional top-k method may only see the left cluster while missing the right cluster
            * causing an information loss  
            * because all the significant patterns are to the left (top-k only)
        * Using redundancy-aware top-k, the right cluster can be seen (b)
    * Method: Use MMS (Maximal Marginal Significance) for measuring the combined significance of a pattern set
        * paper: Extracting Redundancy-Aware Top-K Patterns, KDD'06

{% include image.html url="/images/diaries/feb/redundancy-aware-top-k.png" description="Redundancy-aware Top-k Patterns"%}

### Mining Colossal Patterns
* Mining Long / Large Patterns: Challenges
    * needed in many fields, e.g. bio-informatics, SNA, etc.
        * so far introduced methods, for short patterns (< 10)
    * challenges:
        * the curse of "downward closure" property of frequent patterns
            * all sub-pattern of a frequent pattern are frequent
            * e.g. if a 100-length pattern is frequent, then there will be $2^{100}$ such frequent patterns
        * searching with breadth-first (e.g. Apriori) or depth-first (e.g. FPgrowth) leads to combinational explosion
            * still adopt the "small to large" step-by-step growing paradigm
* A Motivation Example
    * Frequent pattern of length 40
    * Number of closed / maximal patterns of length 20 is: $\left( \begin{matrix} 40 \\\\\\ 20 \end{matrix} \right)$
    * Request: only min the pattern of near-40 size
    * Existing algorithms need to go through all the sub-patterns, which is not efficient
* Pattern-Fusion
    * strive for mining **almost complete and representative** colossal patterns
    * not strive for completeness
        * it is not accurate / complete, but still representative
    * key observation
        * the larger / more distinct the pattern is
        * the more likely it will be generated from smaller ones
        * details see below
    * philosophy: collection of small patterns hints / fuses into larger patterns
* Observation: Colossal patterns and core patterns
    * a colossal pattern has far more core patterns than small-sized patterns
    * a colossal pattern has far more core patterns of a smaller size c
    * a random draw from a complete set of patterns of size c will be more likely to pick a core pattern of a colossal pattern
    * a colossal pattern can be generated by merging / fusing a set of core patterns
* Robustness of colossal patterns
    * core pattern:
        * for a frequent pattern $\alpha$, and a sub-pattern $\beta$
        * if $\beta$ shares a similar support with $\alpha$, similarity defined by:
            * $\frac{\|D_{\alpha}\|}{\|D_{\beta}\|} \ge \tau$, $0 \lt \tau \le 1$ where $\tau$ is called the core ratio
            * i.e. support of $\alpha$ over support of $\beta$, the ratio is smaller than $\tau$
        * then $\beta$ is a $\tau$-core pattern of $\alpha$
    * (d, $\tau$)-robustness
        * a pattern $\alpha$ is (d, $\tau$)-robust if d is the maximum number of items that can be removed from $\alpha$
            * for the remaining patterns to remain a $\tau$-core pattern of $\alpha$
    * for a (d, $\tau$)-robust pattern, it has $\Omega(2^d)$ core patterns
        * a colossal pattern tends to have more core patterns -- d tends to be bigger
        * such core patterns can be clustered to form *"dense balls"* based on the distance defined earlier
            * $Dist(\alpha, \beta) = 1 - \frac{\|D_{\alpha} \cap D_{\beta}\|}{\|D_{\alpha} \cup D_{\beta}\|}$
* The Pattern-Fusion Algorithm
    * initialisation: create initial pool with existing algorithm to mine all frequent patterns up to a small size of c, e.g. 3
    * iteration
        * K seed patterns are randomly picked from the current pattern pool
        * find all patterns with in a bounding ball centred at the seed pattern
        * all found patterns are fused together to generate a set of super-patterns
        * generated super-patterns form a new pool for next iteration
    * termination: when current pool contains no more than K patterns
        


Constraint-Based Pattern Mining
-------------------------------

### Why Constraint-Based Pattern Mining
* Why
    * Different kinds of constraints => different pruning strategies
    * Unrealistic to find all patterns
    * Constraint-based mining
        * provides user flexibility: provides constraints on what to be mined
        * provides optimisation opportunity: efficient mining
            * constraint-pushing
* Constraints in general data mining
    * knowledge type constraint
        * e.g. classification, association, clustering
    * data constraint
        * e.g. particular time
    * dimension / level constraint
    * rule / pattern constraint
    * interestingness constraint
* Meta-rule guided mining
    * $P_1 \land P_2 \land ... \land P_l \rightarrow Q_1 \land Q_2 \land ... \land Q_l$
    * methods
        * find frequent (l + r) predicates (based on *min-support*)
        * push constraints
        * push min_conf, min_correlation, etc.
    * to study: how to push

### Different Kinds of Constraints Leads to Different Pruning Strategies
* Kinds of Constraints
    * Pattern space pruning constraints:
        * anti-monotonic: if S violates the constraint, so does any of its superset
        * monotonic: if S satisfies the constraint, all its supersets also satisfy
        * succinct: constraint can be enforced by directly manipulating the data
        * convertible: constraint can be converted into monotonic or anti-monotonic, if items can be properly ordered in processing
    * Data space pruning constraints
        * data succinct: data space can be pruned at the initial pattern mining process
        * data anti-monotonic: transaction t can be pruned if it violates the constraint, to reduce data processing effort

### Constrained Mining with Pattern Anti-Monotonicity
* Pattern space pruning with pattern anti-monotonicity
    * e.g. range(S.profit) < 15 is anti-monotone
        * for tid=10, range(a, b) is already over 15
        * so no need to examine its (a, b) supersets further
    * e.g. support(S) >= $\sigma$ is also anti-monotone
        * if S already violates this constraint, its supersets will also violate the constraint
        * Apriori pruning is essentially pruning with an anti-monotonic constraint

{% include image.html url="/images/diaries/feb/example-pattern-anti-monotonicity.png" description="Example of Anti-Monotonicity"%}

### Constrained Mining with Pattern Monotonicity
* Pattern monotonicity and its roles
    * e.g. sum(S.price) >= v is monotone

### Constrained Mining with Data Anti-Monotonicity
* May improve data exploring efficiency

### Constrained Mining with Succinct Constraints
* Succinctness
    * e.g. to find those patterns containing i
        * mine only i-projected DB (data space pruning)
    * e.g. min(S.price) <= v
        * start with patterns with low price items (pattern space pruning)
        * remove transactions with only high price items (data space pruning)
    * e.g. sum(S.price) >= v is not succinct

### Constrained Mining with Convertible Constraints
* convert tough constraints into (anti-)monotonic ones by proper ordering of items in transactions
    * e.g. avg(S.profit) > 20
        * order items in each transactions by value-descending order
            * e.g. <a, g, f, b, h, d, c, e>
        * if avg(a, g) = 20, then it's anti-monotone -- no need to check the supersets
    * doesn't work for Apriori algorithm

### Handling Multiple Constraints
* beneficial to use multiple constraints
* apply constraints in the order of their pruning power
    * when they are convertible, but conflicting in required sorting order 

