---
layout: post
title: New Year!! & Coursera VLSI CAD course note
tags:
  - coursera
excerpt: "VLSI CAD course note"
date: 2015-02-20 16:43:08 +0800
---

Happy New Year of Goat!! (or sheep, whatever...)

(Actually, it might not be that happy -- my grandmother just passed away last week on 14th, Feb.. R.I.P.)

And one of my best friends just got married. Best wishes to her!!

---

#### The Note
I am starting to post my course note for all my coursera courses here.

---

BDD Basics
----------

### Big Ideas:
1. Use **BDD**: Boolean Decision Diagram
2. Ordering: *Restrict* global ordering of variables 
    * Terminology: **Canonical form**, same function of same variables always produces exactly *same* representation.
    * Every path from root to leaves visits variables in the same order.
        * order matters
        * one can skip some variables
3. Reduction
    * Purposes:
        1. reduce graph size
        2. determine canonical form / simplest form of graph representation
    * Rules:
        1. Merge *Equivalent* leaves
        2. Merge *Isomorphic* Nodes -- nodes with 1) same variables; 2) identical children
        3. Eliminate *Redundant* Tests -- variable nodes whose children go to the same node

{% include image.html url="/images/diaries/feb/merge-isomorphic-nodes.png" description="Merge Isomorphic Nodes" %}
{% include image.html url="/images/diaries/feb/eliminate-redundant-tests.png" description="Eliminate Redundant Tests" %}

BDD Sharing
-----------
Every BDD node (not just root) represents **some** boolean function in a canonical way.

Multi-rooted graph: BDD Sharing


BDD Ordering
------------

### How BDDs are *really* implemented
* Recursive methods like URP
* A set of operators (ops) on the BDDs
* Operate on a universe of boolean data as input / output
* Big Trick: Implement each op so that:
    * inputs are **shared, reduced, ordered** -> outputs are so as well
    * e.g. input: BDD, gates: ops

### BDD applications 
1. compare logic implementations:
   * same pointer -> same BDD
   * build BDD $ H = F \oplus G $
2. Tautology checking: pointer directly points to node `1`
3. Satisfiability: any path to `1` node

### Problem: variable ordering *matters*
* Graph size growth
* e.g. $ a_{1} b_{1} + a_{2} b_{2} $
    * linear growth: $ a_{1} \rightarrow b_{1} \rightarrow a_{2} \rightarrow b_{2} $
    * exponential growth: $ a_{1} \rightarrow a_{2} \rightarrow b_{1} \rightarrow b_{2} $
* no universal solution

### How to handle: graph size growth
* variable ordering heuristics
* characterisation: know what problems *never* have nice BDDs
    * e.g. multipliers
* Dynamic ordering

#### intuition:
* related inputs should be near to each other
* groups of inputs that can *determine function by themselves* should be 1) close and 2) near top of BDD
* e.g. $ a_{1} b_{1} + a_{2} b_{2} $
    * when $ a_{1} b_{1} $ are grouped, they can determine function output
    * if they are not grouped, graph goes big since it needs to 'remember' all possibilities of $ a_{1} $ stored above -> more edges
* not all arithmetic circuits are easy
    * multipliers: exponential for best and worst ordering

Practical node size: ~100M

SAT: dont need the whole function


SAT
---

### SAT: Boolean Satisfiability
* function is satisfied -- find a set of $ x_{1}, x_{2}, ... , x_{n} $ making $F(x_{1}, x_{2}, ... , x_{n}) = 1$ 

### CNF: Conjunctive Normal Function
* Standard POS (Product of Sums) form
    * clause: $(a + b)$
    * positive literal: $a$
    * negative literal: $\bar{a}$
* Useful:
    * only need to determine *one* clause to eval `0`
    * but need *all* clauses to eval `1`
* Clauses can be: (due to certain assignments)
    * conflicting: contradict with the goal (clause = 0)
    * satisfied: (clause = 1)
    * unresolved: not sure of the result of the clause -- variables remain

### How to "solve" this? -- SAT problem
* Recursively
    1. Decision
        * *select* a variable and *assign* its value
        * *simplify* CNF as much as you can
    2. Deduction
        * iteratively simplify, until nothing simplifies
        * if CAN decide SAT, good
        * if CANNOT, back to *Decision*

### Use BCP to do deduction
* BCP: Boolean Constraint Propagation
    * given a set of fixed variable assignment, what else can you *deduce* abouot necessary assignments by *propagating constraints*?
* **Unit** clause:
    * most famous strategy
    * def: clause has exactly one unassigned literal (others being `0`)
    * implication: unit clause has exactly one way to be satisfied
* BCP iterative: go until no more implications
  * flow:
    1. assignment
    2. if there is any implication
        * leads to SAT, return
        * leads to unit clause, use implications as next assignment
    3. if there is no implication, go to 1.
* BCP termination cases:
    * SAT: found an SAT assignment, all clauses resolve to `1`; return;
    * UNRESOLVED: one or more clauses being unresolved; pick another unassigned variable, recurse;
    * UNSAT: found conflict -- one or more clauses eval to `0`.
* This is DPLL: Davis-Putnam-Logemann-Loveland Algorithm

### SAT progress in last ~20 years
* efficient data structure
* efficient variable selections
* efficient BCP mechanisms
* learning mechanisms -- find patterns of vars that NEVER lead to SAT, avoid them

SAT for Logic
-------------

### BDD vs. SAT
* Same:
    * works for many problems, but not guaranteed
    * can *build* BDD to represent function $\phi$
    * can *solve for* SAT on function $\phi$
* Diff:
    * sometime cannot
        * build BDD due to **SPACE**
        * solve SAT due to **TIME**
    * function representation
        * BDD: full
        * SAT: not full
    * Quantifiers
        * BDD: can build $\exists{xyz}~F$ and $\forall{xyz}~F$
        * SAT: versions of quantified SAT exists, for solving SAT on $\exists{xyz}~F$ and $\forall{xyz}~F$

### Practical SAT problems
* F&G: are they same? with the same inputs
    * $Z = F \oplus G$ 
    * Z SAT?
* Gates -> CNF
    * e.g. $\bar{ab} = d$
        * gate consistency function: $\phi_{d} = [d == (\bar{ab})] = (a+d)(b+d)(\bar{a} + \bar{b} + \bar{d})$ 
    * $\phi = (\text{output var})\prod_{(\text{k is output wire)}}{\phi_{k}}$
    * Formula:
        * $z = x \rightarrow (\bar{x} + z)(x + \bar{z})$
        * $z = \text{NOT}(x) \rightarrow (x + z)(\bar{x} + \bar{z})$
        * $z = \text{NOR}(x_1, x_2, ..., x_n) \rightarrow [\prod_{i=1}^{n}{(\bar{x_i} + \bar{z})}][(\sum_{i=1}^{n}{x_i}) + z]$
        * $z = \text{OR}(x_1, x_2, ..., x_n) \rightarrow [\prod_{i=1}^{n}{(\bar{x_i} + z)}][(\sum_{i=1}^{n}{x_i}) + \bar{z}]$
        * $z = \text{NAND}(x_1, x_2, ..., x_n) \rightarrow [\prod_{i=1}^{n}{(x_i + z)}][(\sum_{i=1}^{n}{\bar{x}_i}) + \bar{z}]$
        * $z = \text{AND}(x_1, x_2, ..., x_n) \rightarrow [\prod_{i=1}^{n}{(x_i + \bar{z})}][(\sum_{i=1}^{n}{\bar{x}_i}) + z]$

