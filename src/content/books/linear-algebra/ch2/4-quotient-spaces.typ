#import "../../../root.typ": *

#show: book-section.with(name: "Product and Quotient Spaces")

== Product Spaces

#definition[Product Space][
  Let $V_1, V_2, dots, V_n$ be vector spaces over a field $F$. The *product space* (or just *product*) 
  of $V_1, V_2, dots, V_n$, denoted $V_1 times V_2 times dots.c times V_n$, is the vector space extended from the cartesian product
  $V_1 times V_2 times dots.c times V_n$:
  $
    V_1 times V_2 times dots.c times V_n = {(bf(v)_1, bf(v)_2, dots, bf(v)_n) 
    suchthat bf(v)_1 in V_1, dots, bf(v)_n in V_n},
  $
  with vector addition and scalar multiplication defined componentwise:
  $
    (bf(v)_1, dots, bf(v)_n) + (bf(w)_1, dots, bf(w)_n) = 
    (bf(v)_1 + bf(w)_1, dots, bf(v)_n + bf(w)_n), #h(1em)
    a (bf(v)_1, dots, bf(v)_n) = (a bf(v)_1, dots, a bf(v)_n).
  $
  That is, the product space $V_1 times dots.c times V_n$ is the cartesian product 
  $V_1 times dots.c times V_n$ equipped with componentwise vector addition and scalar multiplication.
]

#theorem[Product Space is a Vector Space][
  Let $V_1, dots, V_n$ be vector spaces over $F$. Then the product space 
  $V_1 times dots.c times V_n$ is a vector space over $F$.
]

#notation(oneline: true)[
  For a vector space $V$, the product space $V^n$ is defined as:
  $
    V^n = underbrace(V times dots.c times V, n "times").
  $
]

#example(oneline: true)[
  $F^n$ is the product space $F times dots.c times F$.
]

#theorem[Dimension of a Product Space][
  Let $V_1, dots, V_n$ be finite-dimensional vector spaces over $F$. Then the product space 
  $V_1 times dots.c times V_n$ is also finite-dimensional, with:
  $
    dim(V_1 times dots.c times V_n) = dim(V_1) + dots.c + dim(V_n).
  $
]

#corollary(oneline: true)[For a finite-dimensional vector space $V$, $dim(V^n) = n dim(V)$.]

#definition[Summation Map][
  Let $V_1, dots, V_n$ be vector spaces over a field $F$. The *summation map* 
  $Gamma: V_1 times dots.c times V_n -> V_1 + dots.c + V_n$ is the linear map defined by:
  $
    Gamma(bf(v)_1, dots, bf(v)_n) = bf(v)_1 + dots.c + bf(v)_n.
  $
]

#proposition(oneline: true)[The summation map $Gamma$ is indeed a linear map.]

#theorem[Injectivity of the Summation Map][
  Let $V_1, dots, V_n$ be vector spaces over a field $F$. Then
  $V_1 + dots.c + V_n$ is a direct sum if and only if the summation map 
  $Gamma: V_1 times dots.c times V_n -> V_1 + dots.c + V_n$ is injective#footnote[
    Since surjectivity of $Gamma$ is trivial, we could also say $V_1 + dots.c + V_n$ is a direct sum iff
    $Gamma$ is _invertible_.
  ].
]


== Quotient Spaces

#notation(oneline: true)[
  Let $V$ be a vector space, and suppose $bf(v) in V$. For any $U subset.eq V$, the
  set $bf(v) + U$ is defined by:
  $
    bf(v) + U = {bf(v) + bf(u) suchthat bf(u) in U}.
  $
  The set $bf(v) + U$ is called the *translate* of $U$ by $bf(v)$.
] 

#definition[Quotient Space][
  Let $V$ be a vector space over a field $F$, and let $U subset.eq V$ be a subspace of $V$. 
  The *quotient space* (or just *quotient*) of $V$ by $U$, denoted $V slash U$, is the set of all 
  translates of $U$ by vectors in $V$:
  $
    V slash U = {bf(v) + U suchthat bf(v) in V}.
  $
]

#definition[Quotient Map][
  Let $V$ be a vector space over a field $F$, and let $U subset.eq V$ be a subspace of $V$. 
  The *quotient map* $pi: V -> V slash U$ is the linear map defined by:
  $
    pi(bf(v)) = bf(v) + U.
  $
]

#proposition(oneline: true)[The quotient map $pi$ is indeed a linear map.]

#theorem[Dimension of a Quotient Space][
  Let $V$ be a finite-dimensional vector space over a field $F$, and let $U subset.eq V$ be a subspace of $V$. 
  Then the quotient space $V slash U$ is also finite-dimensional, with:
  $
    dim(V slash U) = dim(V) - dim(U).
  $
]

#definition[Induced Maps on Quotient Spaces][
  Suppose $T: V -> W$ is a linear map. The *induced map* of $T$, denoted $tilde(T)$, is the linear map 
  $tilde(T): V slash ker(T) -> W$ defined by:
  $
    tilde(T)(bf(v) + ker(T)) = T(bf(v)).
  $
]

#proposition(oneline: true)[The induced map $tilde(T)$ is indeed a linear map.]

#corollary(oneline: true)[
  Let $pi$ be the quotient map of $V$ onto $V slash ker(T)$. Then $tilde(T) compose pi = T$.
]

== Exercises

#exercise(oneline: true)[
  For any vector space $V$ and $n >= 1$, show that $V^n$ is isomorphic to $cal(L)(F^n, V)$.
]