#import "../../../root.typ": *

#show: book-section.with(name: "Functions and Relations")

#definition[Relation][
  A *relation* $R$ from a set $A$ to a set $B$ is a subset of the Cartesian product $A times B$:
  $
    R "is a relation from" A "to" B "iff" R subset.eq A times B.
  $
  If $(a, b) in R$, we say that $a$ is *related* to $b$ by $R$, and we write $a thin R thin b$.
]

#definition[Function][
  A relation $R subset.eq A times B$ is a *function* iff the following two conditions hold:
  + *Totality.* $forall a in A, exists b in B "such that" (a, b) in R$.
  + *Uniqueness.* $forall a in A, forall b_1, b_2 in B, [(a, b_1) in R "and" (a, b_2) in R] => b_1 = b_2$.
]

#terminology[Domain, Codomain, Range][
  For a function $f: A -> B$, the set $A$ is called the *domain* of $f$, the set $B$ is called the *codomain* of $f$, and the set $f(A) = {f(a) | a in A}$ is called the *range* of $f$.
]

#notation(oneline: true)[
  Denoting $a mapsto b$ under $f$ asserts that $f$ maps $a$ to $b$, i.e. that $f(a) = b$.
]

#definition[Graph of a Function][
  The *graph* $"Gr"(f)$ of a function $f: A -> B$ is the set of ordered pairs $(a, f(a))$ for all $a in A$:
  $
    "Gr"(f) = {(a, f(a)) | a in A}.
  $
]

#terminology[Partial Function][
  A *partial function* from $A$ to $B$ is a relation $R subset.eq A times B$ that satisfies the uniqueness condition of functions but not necessarily the totality condition. In other words, a partial function may not be defined for every element of $A$.
]

#terminology[Endofunction][
  An *endofunction* or *square function* over a set $A$ is a function from $A$ to itself, i.e. a function $f: A -> A$.
]

#definition[Identity Function][
  For any set $A$, the *identity function* on $A$, denoted $id_A$, is the endofunction from $A$ to $A$ defined by $x |-> x$ for all $x in A$.
]

== Functions with Multiple Arguments

#definition(ref: <n-ary-function>)[$n$-ary Function][
  An *$bold(n)$-ary function* is a function that takes $n$ arguments. Formally, an $n$-ary function from sets $A_1, A_2, ..., A_n$ to a set $B$ is a function $f: A_1 times A_2 times dots.c times A_n -> B$.
]

#terminology[Unary, Binary, Ternary Functions][
  In #card-prefix-ref(<n-ary-function>), when $n=1$, we call $f$ a *unary* function; when $n=2$, we call $f$ a *binary* function; and when $n=3$, we call $f$ a *ternary* function. Also, when $n=0$, we call $f$ a *nullary* function, which is just a constant element of $B$.
]

== Function Composition and Iteration

#definition[Composition of Functions][
  Let $f: A -> B$ and $g: B -> C$ be functions. The *composition* of $g$ and $f$, denoted $g compose f$, is the function from $A$ to $C$ defined by $(g compose f)(x) = g(f(x))$ for all $x in A$.
]

#theorem[Compositions Involving the Identity Function][
  Let $f: A -> B$ be a function. Then $id_B compose f = f compose id_A = f$.
]

#definition[Idempotent Function][
  A endofunction $f: A -> A$ is *idempotent* if $f compose f = f$.
]

== Iteration, Transients, and Periods

#definition[Iterated Function][
  Let $f: A -> A$ be an endofunction. The *$bold(n)$#th iterate* of $f$, denoted $f^n$, is defined recursively as follows:
  $
    f^0 = id_A, 
    f^(n+1) = f compose f^n "for" n >= 0.
  $
]

#definition[Trajectory of an Element under a Function][
  Let $f: A -> A$ be an endofunction and let $x in A$. The *trajectory* of $x$ under $f$, denoted $"traj"_f (x)$, is the sequence of elements obtained by iteratively applying $f$ to $x$: 
  $
    "traj"_f (x) = (x, f(x), f^2(x), f^3(x), ...)
  $
]

#example[
  Let $f: NN -> NN$ be defined by $x |-> x^2$. Then the trajectory of $2$ under $f$ is:
  $
    "traj"_f (2) = (2, 4, 16, 256, ..., 2^(2^n), ...)
  $
]

#remark(oneline: true)[
  While we are currently using $f^n$ to denote the $n$#th iterate of a function, the notation $f^n$ may also be used to denote the $n$#th power of a function in the context of function algebras, which is a different concept.
]

#definition[Periodic Element under a Function][
  Let $f: A -> A$ be an endofunction and let $x in A$. We say that $x$ is *periodic* under $f$ if there exists a positive integer $n$ such that $f^n (x) = x$. The smallest such positive integer $n$ is called the *period* of $x$ under $f$.
]

#theorem[Periodicity of Endofunctions with Finite Domains][

]

== Classification of Functions

#definition[Injective Function][
  A function $f: A -> B$ is *injective* or *one-to-one* if no two distinct elements in $A$ map to the same element in $B$. Formally:
  $
    f "is injective iff" forall x_1, x_2 in A, f(x_1) = f(x_2) => x_1 = x_2.
  $
]

#definition[Surjective Function][
  A function $f: A -> B$ is *surjective* or *onto* if every element in $B$ is the image of at least one element in $A$. Formally:
  $
    f "is surjective iff" forall y in B, exists x in A "such that" f(x) = y.
  $
]

#theorem[Alternative Characterization of Surjectivity][
  A function $f: A -> B$ is surjective iff the range of $f$ equal to its codomain $B$.
]

#definition[Bijection][
  A function $f: A -> B$ is *bijective* if it is both injective and surjective. In other words, a bijection is a function that establishes a _one-to-one correspondence_ between the elements of $A$ and the elements of $B$.
]

#theorem[Inverse of a Bijection][
  Let $f: A -> B$ be a bijection. Then there exists a unique function $f^(-1): B -> A$ such that $f^(-1) compose f = id_A$ and $f compose f^(-1) = id_B$. The function $f^(-1)$ is called the *inverse* of $f$.
]

For this reason, bijective functions are also called *invertible* functions.


== Exercises

#exercise(oneline: true)[

]