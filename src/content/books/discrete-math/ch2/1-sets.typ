#import "../../../root.typ": *

#show: book-section.with(name: "Naive Set Theory")

#definition[Set and Set Membership][
  A *set* is a mathematical object completely defined by its *elements* or *members*.
  If an object $x$ is an element of a set $A$, then we say that $x$ is an element of $A$ and denote that $x in A$.
]

#notation[Set Roster Notation][
  A set can be defined by explicitly listing its elements, separated by commas and enclosed in curly braces. For example, the set of natural numbers less than 5 can be defined as $A = {0, 1, 2, 3, 4}$.
]

Since a set is defined by the objects that belong to it, the following principles hold:
- The order in which we denote elements of a set does not matter.
- Repeated elements in a set do not affect the set's identity.

#example[
  Define the sets $A = {1, 2, 3}$, $B = {3, 2, 1}$, and $C = {1, 2, 2, 3}$. Then $A$, $B$, and $C$ are all the same set.
]

#definition[Subset and Proper Subset][
  A set $A$ is a *subset* of a set $B$, denoted $A subset.eq B$, iff $x in A$ implies $x in B$. Furthermore, $A$ is a *proper subset* of $B$, denoted $A subset B$ or $A subset.neq B$, iff $A subset.eq B$ and there exists some element in $B$ that is not in $A$. Formally:
  $
    A subset.eq B &"iff" forall x thin (x in A => x in B) \
    
    A subset B &"iff" A subset.eq B "and" exists x thin (x in B "and" x in.not A).
  $
]

#definition[Superset and Proper Superset][
  A set $A$ is a *superset* of a set $B$, denoted $A supset.eq B$, iff $B subset.eq A$. Furthermore, $A$ is a *proper superset* of $B$, denoted $A supset B$ or $A supset.neq B$, iff $B subset A$.
]

#example[
  Define the sets $A = {1, 2}$, $B = {1, 2, 3}$, and $C = {1, 2}$. Then $A subset B$, $B supset A$, and $A = C$.
]

#definition[Empty Set][
  The *empty set* $emptyset$ or ${}$ is the unique set that has no elements. 
]

#theorem[Universality of the Empty Set][
  For all sets $A$, $emptyset subset.eq A$.
]

#notation[Set Builder Notation][
  A set can also be defined by specifying a property that its elements must satisfy. This is called *set builder notation*. 

  If $S$ is the set of all elements $x$ such that $P(x)$ is true, we can write: $ S = {x suchthat P(x)}. $ 
  If we want to specify the universe of objects $U$ we are considering, we can write: $ S = {x in U suchthat P(x)}. $
  If $x$ needs to satisfy multiple predicates $P_1 (x), P_2 (x), ..., P_k (x)$, we can write:
  $
    S = {x in U suchthat P_1 (x), P_2 (x), ..., P_k (x)}.
  $
]

#corollary(oneline: true)[
  If $S$ is defined using set builder notation over a universe $U$, then $S subset.eq U$.
]

#corollary(oneline: true)[
  If $S$ is defined using set builder notation with predicate $P$, then $x in S$ if and only if $P(x)$ is true.
]

#definition[Standard Numeric Sets][
  The following sets of numbers are commonly used in mathematics:
  + The *natural numbers* $NN$ are the set of non-negative#footnote[Sometimes, $NN$ is defined to exclude $0$. Use the definition that includes $0$ for these notes.] integers: 
    $ NN = {0, 1, 2, 3, ...}. $
  + The *integers* $ZZ$ are the set of whole numbers and their negatives: 
    $ ZZ = {..., -3, -2, -1, 0, 1, 2, 3, ...}. $
  + The *positive integers* $ZZ^+$ are the set of integers greater than $0$: 
    $ ZZ^+ = {1, 2, 3, ...}. $
  + The *rational numbers* $QQ$ are the set of numbers that can be expressed as a fraction of two integers (with a nonzero denominator):
    $ QQ = {p/q suchthat p in ZZ and q in ZZ and q != 0}. $
  + The *real numbers* $RR$ are the set of all points on the number line, including both rational and irrational numbers.
]


#definition[Principle of Extensionality][
  Two sets $A$ and $B$ are equal, denoted $A = B$, if and only if they have the same elements. Formally:
  $
    A = B "iff" forall x thin (x in A <=> x in B).
  $
]

#theorem[Double Containment Theorem][
  Two sets $A$ and $B$ are equal if and only if $A subset.eq B$ and $B subset.eq A$. Formally:
  $
    A = B "iff" A subset.eq B "and" B subset.eq A.
  $
]

== Set Operations

It may be useful to define new sets in terms of existing sets using _set operations_. 

#definition[Intersection of Two Sets][
  The *intersection* of two sets $A$ and $B$, denoted $A inter B$, is the set of all elements that are in both $A$ and $B$. Formally:
  $
    A inter B = {x suchthat x in A and x in B}.
  $
]

#terminology[Disjoint Sets][
  Two sets $A$ and $B$ are *disjoint* if their intersection is the empty set, i.e. $A inter B = emptyset$.
]

#definition[Power Set][
  The *power set* of a set $A$, denoted $cal(P)(A)$, is the set of all subsets of $A$. Formally:
  $
    cal(P)(A) = {B suchthat B subset.eq A}.
  $
]

== Lists, Cartesian Products, Strings

A list, sequence, or tuple, is a collection of objects where the order of the objects matters and repetition is allowed. In the world of sets, it would be beneficial if lists were not "separate" objects, but rather could be represented as sets. This way, the theory of sets would be sufficient to define and reason about lists, sequences, tuples, and other ordered collections without needing to introduce new primitive objects.

In general, let $(x_1, x_2, ..., x_n)$ be an ordered $n$-tuple. Fix the following properties:
+ *Order.* $(x_1, x_2, ..., x_n) != (y_1, y_2, ..., y_n)$ if there exists some $i$ such that $x_i != y_i$.
+ *Repetition.* $(x_1, x_2, ..., x_n) != (x_1, x_2, ..., x_n, x_(n+1))$ for any $x_(n+1)$.

The following is a way to represent ordered pairs as sets:

#definition[Kuratowski Pairing Function][
  The *Kuratowski pairing* $pi(x, y)$ of two objects $x$ and $y$ is:
  $
    pi(x, y) = {{x}, {x, y}}.
  $
]

We can extend the Kuratowski pairing function to represent ordered triples, quadruples, and in general $n$-tuples as sets:
$
  pi(x_1, x_2, ..., x_n) = pi(pi(x_1, x_2, ..., x_(n-1)), x_n).
$

Thus, the Kuratowski pairing function can be generalized:

#definition[Kuratowski List][
  The *Kuratowski list* $pi(x_1, x_2, ..., x_n)$ of a finite sequence of objects $x_1, x_2, ..., x_n$ is the set defined as:
  $
    pi(x_1, x_2, ..., x_n) = cases(
      emptyset & "if" n = 0,
      x_1 & "if" n = 1,
      pi(pi(x_1, x_2, ..., x_(n-1)), x_n) & "otherwise",
    )
  $
]

The set of all lists can be denoted using a *Cartesian product* of sets. For two sets, it is defined as follows:

#definition[Cartesian Product][
  The *Cartesian product* of two sets $A$ and $B$, denoted $A times B$, is the set of all pairings of an element from $A$ and an element from $B$. Formally:
  $
    A times B = {pi(a, b) suchthat a in A, b in B}.
  $
]

#example(oneline: true)[
  Let $A = {1, 2}$ and $B = {x, y}$. Then the Cartesian product $A times B$ is:
  $
    A times B &= {pi(1, x), pi(1, y), pi(2, x), pi(2, y)} \ &= {{{1}, {1, x}}, {{1}, {1, y}}, {{2}, {2, x}}, {{2}, {2, y}}}.
  $
]

#notation(oneline: true)[
  In the context of sets, let the standard notation for an ordered sequence $(x_1, x_2, ..., x_n)$ 
  represent the Kuratowski list $pi(x_1, x_2, ..., x_n)$.
]

#definition[Alphabets and Strings][
  A *string* $s$ is a sequence of *characters* from a given *alphabet* $Sigma$. 
]

#definition[Finite Strings][
  A *finite string* $s$ of length $n$ over an alphabet $Sigma$ is an element of the catesian product of $Sigma$ with itself $n$ times:
  $
    s "is a string of length" n "over" Sigma "iff" s in underbrace(Sigma times Sigma times dots.c times Sigma, n "times").
  $
  The set of all finite strings over $Sigma$ of length $n$ is denoted $Sigma^n$.
]

#example(oneline: true)[
  The set of all 2D coordinates can be interpreted as the set of all strings of length 2 over the alphabet $RR$, i.e. $RR^2$.
]

#definition[Set of All Finite Strings][
  The set of all finite strings over an alphabet $Sigma$ is denoted $Sigma^*$ and is defined as the union of $Sigma^n$ for all $n in NN$:
  $
    Sigma^* = union.big_(n in NN) Sigma^n.
  $
]

== Exercises

#exercise(oneline: true)[Show that the empty set $emptyset$ is unique.]

#exercise(oneline: true)[
  Let $cal(L)$ be the Kuratowski list for a list of $n$ elements. How many pairs of braces are needed to express $cal(L)$ in set roster notation? 
]