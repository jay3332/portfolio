#import "../../../root.typ": *

#show: book-section.with(name: "Basis and Dimension")

== Bases for Vector Spaces

#definition(ref: <basis>)[Basis Set][
  Let $cal(B)$ be a subset of a vector space $V$. $cal(B)$ is a *basis* for $V$ iff the following conditions hold:

  + *Linear independence.* $cal(B)$ is a linearly independent set.
  + *Spanning set.* $cal(B)$ is a spanning set for $V$, i.e. $span(cal(B)) = V$.

  The elements of $cal(B)$ are called the *basis vectors* of $V$ under $cal(B)$.
]

#example[Show that ${(1, 2), (3, 4)} subset RR^2$ is a basis for $RR^2$][
  Let $cal(B) = {bf(b)_1, bf(b)_2}$, where $bf(b)_1 = (1, 2) in RR^2$ and $bf(b)_2 = (3, 4) in RR^2$.
  We must show that $cal(B)$ is a linearly independent set and a spanning set for $RR^2$.

  + *Linear independence.* Suppose that $c_1, c_2 in RR$ are scalars such that 
    $c_1 bf(b)_1 + c_2 bf(b)_2 = bf(0)$. Then we have:
    $
      c_1 (1, 2) + c_2 (3, 4) &= (0, 0) \
      (c_1 + 3 c_2, 2 c_1 + 4 c_2) &= (0, 0).
    $
    This gives us the system of equations:
    $
      c_1 + 3 c_2 &= 0 \
      2 c_1 + 4 c_2 &= 0.
    $
    Using elementary algebra, we can solve for $c_1$ and $c_2$ to find that
    $c_1 = 0$ and $c_2 = 0$ is the only solution. By #card-prefix-ref(<linear-independence-formalism>),
    $cal(B)$ is a linearly independent set.

  + *Spanning set.* Let $bf(v) = (x, y)$ be an arbitrary vector in $RR^2$. 
    We will show that there exist scalars $c_1, c_2 in RR$ such that $bf(v) = c_1 bf(b)_1 + c_2 bf(b)_2$,
    that is:
    $
      (x, y) &= c_1 (1, 2) + c_2 (3, 4) \
      (x, y) &= (c_1 + 3 c_2, 2 c_1 + 4 c_2).
    $
    This gives us the system of equations:
    $
      c_1 + 3 c_2 &= x \
      2 c_1 + 4 c_2 &= y.
    $
    Using elementary algebra, we find that $c_1 = 3y slash 2 - 2x$ and $c_2 = x - y slash 2$.
    Thus, by choosing $c_1$ and $c_2$ as such, we have $bf(v) = c_1 bf(b)_1 + c_2 bf(b)_2$. 
    Since $bf(v)$ was an arbitrary vector in $RR^2$, we have shown that every vector in $RR^2$ can be 
    expressed as a linear combination of the vectors in $cal(B)$, so $cal(B)$ is a spanning set for $RR^2$.

  Since $cal(B)$ is a linearly independent set and a spanning set for $RR^2$, $cal(B)$ is a basis for $RR^2$. #proof-qed
]

#nonexample(oneline: true)[
  The set ${(1, 2), (2, 4)} subset RR^2$ is not a basis for $RR^2$ 
  since it is not linearly independent.
]

#nonexample(oneline: true)[
  The set ${(1, 2)} subset RR^2$ is not a basis for $RR^2$ 
  since it is not a spanning set for $RR^2$.
]

#terminology[Finite-Dimensional and Infinite-Dimensional Vector Spaces][
  A vector space $V$ is *finite-dimensional* iff there exists a basis for $V$ that
  is a finite set (called a *finite basis*). Otherwise, $V$ is *infinite-dimensional*
  and has an *infinite basis*.
]

Combining the two criteria from #card-prefix-ref(<basis>), we can deduce the following:

#theorem(ref: <unique-representation-theorem>)[Unique Representation Theorem][
  A set of vectors ${bf(b)_1, bf(b)_2, ..., bf(b)_n}$ is a finite basis for a vector space $V$
  over $F$ if and only if for any $bf(v) in V$, there is _exactly one_ solution 
  $c_1, c_2, ..., c_n in F$ for the equation:
  $
    bf(v) = c_1 bf(b)_1 + c_2 bf(b)_2 + dots.c + c_n bf(b)_n.
  $
]

This theorem states that a basis $cal(B)$ for a vector space $V$ is a set of vectors from $V$ 
such that every vector in $V$ can be uniquely expressed as a linear combination of the vectors in $cal(B)$. 

This is a statement of _uniqueness and existence_:
- *Uniqueness.* Every vector in $V$ can be expressed as a linear combination of the vectors in $cal(B)$ in _at most_ one way.
- *Existence.*  Every vector in $V$ can be expressed as a linear combination of the vectors in $cal(B)$ in _at least_ one way.

#proof(card-title-ref(<unique-representation-theorem>))[
  Suppose that $cal(B) = {bf(b)_1, bf(b)_2, ..., bf(b)_n}$ is a basis for $V$ over $F$. 
  By the definition of a basis, $cal(B)$ is a linearly independent set and a spanning set for $V$.
  Particularly, $cal(B)$ spans $V$, so for any $bf(v) in V$, there exists at least one solution $c_1, c_2, ..., c_n in F$ for the equation:
  $
    bf(v) = c_1 bf(b)_1 + c_2 bf(b)_2 + dots.c + c_n bf(b)_n.
  $
  Suppose $d_1, d_2, ..., d_n$ is another solution to this equation. That is, suppose that:
  $
    bf(v) = d_1 bf(b)_1 + d_2 bf(b)_2 + dots.c + d_n bf(b)_n.
  $
  By the definition of linear independence, we must have $c_1 = d_1, c_2 = d_2, ..., c_n = d_n$.
  Thus, for any $bf(v) in V$, there is exactly one solution $c_1, c_2, ..., c_n in F$ for the equation
  $
    bf(v) = c_1 bf(b)_1 + c_2 bf(b)_2 + dots.c + c_n bf(b)_n.
  $

  The converse is trivial. #proof-qed
]

#note(oneline: true)[
  A common pattern for uniqueness and existence in proofs is that by showing
  uniqueness and existence, we can conclude that there is exactly one of something.
]

#theorem(ref: <reduce-to-basis>)[Spanning Sets can be Reduced to a Basis][
  Let $V$ be a vector space, and let $S$ be a finite spanning set for $V$. 
  Then there exists an improper subset of $S$ that is a basis for $V$.
]

#proof(card-prefix-ref(<reduce-to-basis>))[
  Let $V$ be a vector space, and let $S$ be a finite spanning set for $V$. 
  By the #card-title-ref(<spanning-set-theorem>), 
]

#theorem(ref: <extend-to-basis>)[Linearly Independent Sets can be Extended to a Basis][
  Let $V$ be a vector space, and let $S$ be a finite linearly independent set of vectors from $V$. 
  Then there exists an improper superset of $S$ that is a basis for $V$.
]

#proof(card-prefix-ref(<extend-to-basis>))[

  Let $V$ be a vector space, and let $S$ be a finite linearly independent set of vectors from $V$. 
  By the #card-title-ref(<characterization-of-linearly-independent-sets>),
]

== Dimension of Vector Spaces

#theorem(ref: <unique-size-theorem>)[Unique Size Theorem][
  Let $V$ be a finite-dimensional vector space. If $cal(B)$ and $cal(B)'$ are two bases for $V$, 
  then $abs(cal(B)) = abs(cal(B)')$.
  That is, all bases for $V$ have the same number of vectors.
]

#proof(card-title-ref(<unique-size-theorem>))[
  TODO
]

As a result of this theorem, we can define the _dimension_ of a finite-dimensional vector space as the 
number of vectors in _any_ basis for the vector space:

#definition(ref: <dimension>)[Dimension of a Vector Space][
  Let $V$ be a finite-dimensional vector space. The *dimension* of $V$, denoted $dim(V)$, 
  is the number of vectors (the cardinality) in any basis for $V$.
  To say that V is _$n$-dimensional_ means that $dim(V) = n$.
]

Combining #card-prefix-ref(<unique-size-theorem>) and #card-prefix-ref(<dimension>) together,
we see that although a finite-dimensional vector space $V$ can have many different bases, they all
have the same number of vectors, namely $dim(V)$ number of vectors. 

#corollary(oneline: true)[
  A vector space $V$ is finite-dimensional if and only if $dim(V)$ is well-defined.
]

#important(oneline: true)[
  The dimension of the trivial vector space ${bf(0)}$ is 0. That is, $dim thin {bf(0)} = 0$.
  It would then follow that the empty set $emptyset$ is the _only_ basis for ${bf(0)}$.
]

#notation(oneline: true)[
  An infinite-dimensional vector space may be said to have *infinite dimension*, and 
  $dim(V) = oo$ may be used to denote that $V$ is infinite-dimensional. This is an abuse 
  of notation since $dim(V)$ is not well-defined for infinite-dimensional vector spaces.
]

#theorem(ref: <basis-theorem>)[Basis Theorem][
  Let $V$ be a finite-dimensional vector space with dimension $n$.
  + If $cal(B)$ is a linearly independent set of $n$ vectors from $V$, then $cal(B)$ is a basis for $V$.
  + If $cal(B)$ is a spanning set of $n$ vectors from $V$, then $cal(B)$ is a basis for $V$.
]

That is, if we know the dimension $n$ of a vector space and we have a set of exactly $n$
vectors from that vector space, then we only need to check one of the two criteria from 
#card-prefix-ref(<basis>) to determine if that set is a basis for the vector space. 

If the set of $n$ vectors is linearly independent, it is a basis, so we get spanning for free. 
If the set of $n$ vectors is a spanning set, it is a basis, so we automatically get linear independence for free.

#proof(card-title-ref(<basis-theorem>))[
  Suppose $V$ is a finite-dimensional vector space with dimension $n$.

  + Suppose $cal(B) = {bf(b)_1, bf(b)_2, ..., bf(b)_n} subset.eq V$ is a linearly independent set of 
    $n$ vectors. For the sake of contradiction, assume that $cal(B)$ is _not_ a basis for $V$. Then
    $cal(B)$ is not a spanning set for $V$ ($cal(B)$ is already linearly independent, so the other
    condition of a basis cannot be true.) That is, there exists some vector $bf(v) in V$ such that
    $bf(v) in.not span(cal(B))$. By #card-prefix-ref(<characterization-of-linearly-independent-sets>),
    then, the set ${bf(b)_1, bf(b)_2, ..., bf(b)_n, bf(v)}$ is linearly independent.
]

#proposition(ref: <relative-dimensions-of-subspaces>)[Relative Dimensions of Subspaces][
  Let $H$ be a subspace of a finite-dimensional vector space $V$. Then $dim(H) <= dim(V)$.
  Furthermore, $dim(H) = dim(V)$ if and only if $H = V$.
]

#proof(card-prefix-ref(<relative-dimensions-of-subspaces>))[
  Let $H$ be a subspace of a finite-dimensional vector space $V$. Let $dim(H) = m$ and $dim(V) = n$.
  Let $cal(B)_H$ be a basis for $H$, and let $cal(B)_V$ be a basis for $V$. 

  By #card-prefix-ref(<extend-to-basis>), there exists an improper superset of $cal(B)_H$ that is a basis 
  for $V$. Since $cal(B)_V$ is a basis for $V$, it must have the same number of vectors as any other basis 
  for $V$, including the improper superset of $cal(B)_H$. Thus, the number of vectors in the improper 
  superset of $cal(B)_H$ is equal to the number of vectors in $cal(B)_V$, which is $n$. Since the improper
  superset of $cal(B)_H$ contains all the vectors in $cal(B)_H$, the number of vectors in the improper 
  superset of $cal(B)_H$ is greater than or equal to the number of vectors in $cal(B)_H$, which is $m$. 
  Therefore, we have:
  $
    n >= m <=> m <= n <=> dim(H) <= dim(V).
  $
  Furthermore, if $m = n$, then the improper superset of $cal(B)_H$ that is a basis for $V$ has the same number of vectors as $cal(B)_H$, so $cal(B)_H$ must be the same set as the improper superset of $cal(B)_H$, which is a basis for $V$. Thus, $cal(B)_H$ is a basis for $V$, so $H = V$. #proof-qed
]

#theorem(ref: <dimension-formula>)[Dimension Formula][
  Let $X$ and $Y$ be subspaces of a finite-dimensional vector space $V$. Then:
  $
    dim(X + Y) = dim(X) + dim(Y) - dim(X inter Y).
  $
]

#proof(card-title-ref(<dimension-formula>))[
  TODO
]

If $X + Y$ is a direct sum, then $X inter Y = {bf(0)}$ which has dimension $0$, so:

#corollary(oneline: true, ref: <dimension-of-direct-sum>)[
  If $V = X plus.o Y$ is a finite-dimensional vector space, then $dim(X plus.o Y) = dim(X) + dim(Y)$.
  By extension, if $V = H_1 plus.o H_2 plus.o dots.c plus.o H_n$ is finite-dimensional, then
  $dim(V) = dim(H_1) + dim(H_2) + dots.c + dim(H_n)$. 
]

== Basis Coordinates and the Standard Basis

#definition[Strictly Ordered Sets][
  A set $S$ is *strictly partially ordered* if there exists a binary predicate $prec$ on $S$
  such that:

  - *Irreflexivity.* $forall x in S, x prec.not x$.
  - *Asymmetry.* $forall x, y in S$, if $x prec y$, then $y prec.not x$.
  - *Transitivity.* $forall x, y, z in S$, if $x prec y$ and $y prec z$, then $x prec z$.

  A strictly partially ordered set $S$ is *strictly totally ordered* if in addition to the above conditions,
  $S$ additionally satisfies:

  - *Totality.* $forall x, y in S$, if $x != y$, then either $x prec y$ or $y prec x$.
]

#definition[Ordered Basis][
  An *ordered basis* for $V$ is a basis for $V$ that is a strictly totally ordered set.
]

In other words, an ordered basis is a basis which defines precisely which
basis vector is "first," which is "second," and so on.

#notation(oneline: true)[
  In the context of a basis, a basis set written in the form $cal(B) = {bf(b)_1, bf(b)_2, ..., bf(b)_n}$
  induces a strict total ordering on the vectors in $cal(B)$ in the order in which they are written.
  That is, a strict ordering $prec$ is induced on $cal(B)$ such that $bf(b)_1 prec bf(b)_2 prec dots.c prec bf(b)_n$.
]

#notation(oneline: true)[
  An ordered finite basis $cal(B) = {bf(b)_1, bf(b)_2, ..., bf(b)_n}$ may be denoted as a list
  $bf(b)_1, bf(b)_2, ..., bf(b)_n$ or tuple $(bf(b)_1, bf(b)_2, ..., bf(b)_n)$ instead of a set.
]

Recall that by the #card-title-ref(<unique-representation-theorem>), every vector in a vector space $V$
can be represented as a unique linear combination of vectors from a basis $cal(B)$. 
With $cal(B)$ ordered, the weights of that linear combination can be properly defined:

#definition[Basis Coordinates][
  Let $cal(B) = bf(b)_1, bf(b)_2, ..., bf(b)_n$ be an ordered, finite basis for a vector space $V$ 
  over $F$, and let $bf(v)$ be a vector in $V$. The *coordinates* of $bf(v)$ with respect to the basis 
  $cal(B)$ are the unique weights $c_1, c_2, ..., c_n in F$ such that:
  $
    bf(v) = c_1 bf(b)_1 + c_2 bf(b)_2 + ... + c_n bf(b)_n.
  $
  That is, the coordinates of $bf(v)$ with respect to $cal(B)$ are the weights
  of the unique linear combination of the vectors $bf(b)_1, bf(b)_2, ..., bf(b)_n$ that 
  represents $bf(v)$.
]

A basis for $V$ over a field $F$ has $dim(V)$ number of vectors, so there would be $dim(V)$ number of 
coordinates for each vector in $V$ with respect to that basis. Thus, we can represent each vector in $V$ 
as an $n$-tuple of coordinates in $F$, where $n = dim(V)$. An $n$-tuple of coordinates in $F$ is an
element of $F^n$, so we can represent each vector in $V$ as a vector from $F^n$. Specifically:

#definition[Basis Coordinate Vector][
  If $c_1, c_2, ..., c_n in F$ are the coordinates of $bf(v)$ with respect to an ordered, finite basis
  $cal(B)$ for a vector space $V$ over $F$, then the *basis coordinate vector* of $bf(v)$ with respect to $cal(B)$, denoted $[bf(v)]_cal(B)$, is the vector in $F^n$ given by:
  $
    [bf(v)]_cal(B) = (c_1, c_2, ..., c_n) in F^n.
  $
]

This naturally leads to the fact that the vector space $F^n$ should have dimension $n$,
since it takes $n$ coordinates to represent each vector in $F^n$:

#corollary(oneline: true)[
  The vector space $F^n$ is $n$-dimensional, i.e., $dim(F^n) = n$.
]

Since $F^n$ is a vector space, it has a basis. In particular, the basis that self-describes
the coordinates of vectors in $F^n$ is called the _standard basis_ for $F^n$:

#definition(ref: <standard-basis>)[Standard Basis][
  The *standard basis* for the vector space $F^n$ is the ordered basis 
  $cal(E) = bf(e)_1, bf(e)_2, ..., bf(e)_n$, where $bf(e)_i$ is the vector in $F^n$ with the 
  $i$#th coordinate set to $1$ and all other coordinates set to $0$:
  $
    cal(E) = bf(e)_1, bf(e)_2, ..., bf(e)_n "where"
    bf(e)_1 &= (1, 0, 0, ..., 0) \
    bf(e)_2 &= (0, 1, 0, ..., 0) \
    & dots.v \
    bf(e)_n &= (0, 0, 0, ..., 1).
  $
]

#example(oneline: true)[
  The vector $(1, 2, 3) in RR^3$ has coordinates $(1, 2, 3)$ under the standard basis $cal(E)$,
  since $1 bf(e)_1 + 2 bf(e)_2 + bf(e)_3 = 1 (1, 0, 0) + 2 (0, 1, 0) + 3 (0, 0, 1) = (1, 2, 3)$.
]

#corollary(oneline: true)[
  For any $bf(v) in F^n$, $[bf(v)]_cal(E) = bf(v)$.
]

#notation(oneline: true)[
  The standard basis for $F^n$ may be denoted $cal(E)_n$ or even $cal(E)_n (F)$
  to indicate that it is the standard basis for $F^n$.
]

== Exercises

#exercise(oneline: true)[
  Describe the set of all vector spaces with exactly one basis.
]

#exercise(oneline: true)[
  Show that if $S$ is a set of $n$ vectors from an $(n + 1)$-dimensional vector space $V$, 
  then $S$ cannot span $V$.
]

#exercise(oneline: true)[Extension of #card-prefix-ref(<subspaces-are-spans>)][
  Suppose $V$ is a finite-dimensional vector space with dimension $n$, and $H$ is a subspace of $V$.
  Show that there exists a set of _at most_ $n$ vectors from $V$ that spans $H$.
]

#exercise(oneline: true)[
  Show that if ${bf(v)_1, bf(v)_2, bf(v)_3, bf(v)_4}$ is a basis for a vector space $V$,
  then ${bf(v)_1 + bf(v)_2, bf(v)_2 + bf(v)_3, bf(v)_3 + bf(v)_4, bf(v)_4}$ is also a basis for $V$.
]

#exercise(oneline: true)[
  Let $PP_2(RR)$ be the vector space of all polynomials with real coefficients of degree at most 2.
  Define two bases for $PP_2(RR)$: $cal(B) = {1, x, x^2}$ and $cal(C) = {1, 1 + x, 1 + x + x^2}$.
  Find $[3 + 2x + x^2]_cal(B)$ and $[3 + 2x + x^2]_cal(C)$. 
]

#exercise(oneline: true)[
  Suppose $V$ is a vector space and $cal(B)$ is a basis for $V$. Show that for any $bf(v), bf(w) in V$,
  $
    [bf(v) + bf(w)]_cal(B) = [bf(v)]_cal(B) + [bf(w)]_cal(B).
  $
]

#exercise(oneline: true)[
  Suppose $V$ is a vector space and $bf(v)_1, bf(v)_2, bf(v)_3 in V$ are linearly independent.
  Show that $dim(span thin {bf(v)_1 + bf(v)_2, bf(v)_1 - bf(v)_3, bf(v)_2 + bf(v)_3}) = 2$.
]

#exercise(oneline: true)[
  Suppose ${bf(v)_1, bf(v)_2, dots, bf(v)_p}$ is a linearly independent set in $V$, and $bf(w) in V$. Show that:
  $
    dim(span thin {bf(v)_1 + bf(w), bf(v)_2 + bf(w), dots, bf(v)_p + bf(w)}) >= p - 1.
  $
]

#exercise(oneline: true)[
  For any three subspaces $X$, $Y$, and $Z$ of a finite-dimensional vector space $V$, show that:
  $
    dim(X + Y + Z) & = dim(X) + dim(Y) + dim(Z) \ 
      & - dim(X inter Y) - dim(X inter Z) - dim(Y inter Z) \
      & + dim(X inter Y inter Z).
  $
]

#exercise(oneline: true)[
  For any three subspaces $X$, $Y$, and $Z$ of a finite-dimensional vector space $V$, show that:
  $
    dim(X + Y + Z) &= dim(X) + dim(Y) + dim(Z) \
      & trueminus 1/3 lr( (dim(X inter Y) + dim(X inter Z) + dim(Y inter Z)), size: #150% ) \
      & trueminus 1/3 lr( (dim((X + Y) inter Z) + dim((X + Z) inter Y) + dim((Y + Z) inter X)), size: #150% ).
  $
]

#exercise(oneline: true)[
  Suppose $V$ is finite-dimensional, and $X$ and $Y$ are subspaces of $V$ such that
  $V = X + Y$. Show that there exists a basis $cal(B)$ for $V$ such that $cal(B) subset.eq X union Y$.
]

#exercise(oneline: true)[
  Suppose $V$ is a finite-dimensional vector space, and $U$ and $W$ are subspaces of $V$
  such that $dim(U) + dim(W) > dim(V)$. Show that $U inter W$ contains a nonzero vector.
]

#exercise(oneline: true)[
  Let $X$ and $Y$ be subspaces of a vector space $V$ such that $V = X plus.o Y$. 
  Let ${bf(x)_1, bf(x)_2, ..., bf(x)_m}$ be a basis for $X$ and 
  ${bf(y)_1, bf(y)_2, ..., bf(y)_n}$ be a basis for $Y$.
  Show that ${bf(x)_1, bf(x)_2, ..., bf(x)_m, bf(y)_1, bf(y)_2, ..., bf(y)_n}$ is a basis for $V$.
  (This is an extension of #card-prefix-ref(<union-of-spanning-sets>).)
]

#exercise(oneline: true)[
  Suppose $V$ is a finite-dimensional vector space, and $X$ is a subspace of $V$.
  Show that there exists a subspace $Y$ of $V$ such that $V = X plus.o Y$.
]

#exercise(oneline: true)[
  Recall from #exercise-ref(<RR-vector-space-over-QQ>) that 
  $RR$ is a vector space over $QQ$. Show that in particular,
  $RR$ is an infinite-dimensional vector space over $QQ$. 
]

#exercise(oneline: true)[
  Show that the vector space $C_[0, 1](RR)$, the set of all real-valued functions that are continuous on 
  the closed interval $[0, 1]$, is infinite-dimensional.
]
