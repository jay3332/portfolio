#import "../../../root.typ": *

#show: book-section.with(name: "Span and Linear Independence")

== Linear Combinations <linear-combinations>

A vector space is closed under vector addition and scalar multiplication.
We can generalize this property by defining the notion of a _linear combination_.

#definition(ref: <linear-combination>)[Linear Combination][
  Let $V$ be a vector space over a field $F$, and let $S = {bf(v)_1, bf(v)_2, dots, bf(v)_n} subset.eq V$. 
  A vector $bf(w)$ is a *linear combination* of $S$ iff there exist scalars $a_1, a_2, dots, a_n in F$ such that:
  $
    bf(w) = a_1 bf(v)_1 + a_2 bf(v)_2 + dots.c + a_n bf(v)_n = sum_(i=1)^n a_i bf(v)_i.
  $
  The scalars $a_1, a_2, dots, a_n$ are called the *weights* of the linear combination.
]

That is, a linear combination of some set of vectors $V$ is the sum of 
certain scalar multiples of vectors in $V$. Since a vector space is closed 
under vector addition and scalar multiplication, any linear combination of 
vectors in $V$ must itself be a vector in $V$.

#corollary(ref: <linear-combinations-in-v>, oneline: true)[
  Any linear combination of a set of vectors from $V$ is itself a vector in $V$.
]

#example[
  The vector $(5, 3) in RR^2$ is a linear combination of the vectors $(1, 0)$ and $(0, 1)$, since we can write:
  $
    (5, 3) = 5 dot (1, 0) + 3 dot (0, 1).
  $ 
]
#nonexample[
  The vector $(5, 3) in RR^2$ is _not_ a linear combination of the vectors $(1, 1)$ and $(2, 2)$, since any linear combination of these two vectors must be of the form:
  $
    a_1 dot (1, 1) + a_2 dot (2, 2) = (a_1 + 2 a_2, a_1 + 2 a_2).
  $
  The two components of this vector must be equal, which is not the case for $(5, 3)$.
]

#terminology(oneline: true)[
  A linear combination is *trivial* if all of its weights are zero, and *nontrivial* otherwise.
  A trivial linear combination, then, is always equal to $bf(0)$.
]

#theorem(ref: <alt-subspace-criteria>)[Alternative Subspace Criteria][
  Let $V$ be a vector space over a field $F$, and let $H subset.eq V$. Then $H$ is a subspace of $V$ if
  $V$ is *closed under linear combinations*, i.e. for all $bf(u), bf(v) in H$ and all scalars $alpha, beta in F$, we have:
    $
      alpha bf(u) + beta bf(v) in H.
    $
]

#proof(card-title-ref(<alt-subspace-criteria>))[
  Suppose $V$ is a vector space over $F$, and let $H subset.eq V$. Also suppose
  that $H$ is closed under linear combinations. We will show that $H$ satisfies the 
  three #card-title-ref(<subspace-criteria>).

  + *Existence of additive identity.* $bf(0)_V$ is the trivial linear combination, so $bf(0)_V in H$.
  + *Closure under vector addition.* Let $bf(u), bf(v) in H$. Then $bf(u) + bf(v)$ is a linear combination of $bf(u)$ and $bf(v)$ with weights $alpha = beta = 1_F$, so $bf(u) + bf(v) in H$.
  + *Closure under scalar multiplication.* Let $bf(v) in H$ and $k in F$. Then $k bf(v)$ is a linear combination of $bf(v)$ with weight $k$, so $k bf(v) in H$. #proof-qed
]

== Spans and Spanning Sets

Clearly, there are vectors that can be written as linear combinations 
of some set of vectors, but there may also exist vectors that _can't_. 
The _span_ of a set of vectors describes the set of all vectors that can be written as linear combinations of that set:

#definition[Span][
  Let $V$ be a vector space over a field $F$, and let $S = {bf(v)_1, bf(v)_2, ..., bf(v)_n} subset.eq V$. 
  The *span* of $S$, denoted $span(S)$ or $span thin {bf(v)_1, bf(v)_2, ..., bf(v)_n}$,
  is the set of all linear combinations of $S$:
  $
    span(S) = {sum_(i=1)^n a_i bf(v)_i suchthat a_1, a_2, ..., a_n in F}.
  $
]

#theorem(ref: <spans-are-subspaces>)[Spans are Subspaces][
  Let $V$ be a vector space, and let $S subset.eq V$. Then $span(S)$ is a subspace of $V$.
]

#proof(card-title-ref(<spans-are-subspaces>))[
  Let $V$ be a vector space over $F$, and let $S = {bf(v)_1, bf(v)_2, ..., bf(v)_n} subset.eq V$. Checking the three #card-title-ref(<subspace-criteria>):
  
  + *Existence of additive identity.* Fix all weights $a_1 = a_2 = ... = a_n = 0_F$.
    Then for any linear combination of $S$, we have:
    $
      sum_(i=1)^n a_i bf(v)_i = sum_(i=1)^n 0_F bf(v)_i = sum_(i=1)^n bf(0)_V = bf(0)_V.
    $
  + *Closure under vector addition.* Let $bf(u), bf(v) in span(S)$, so there exist 
    weights $a_1, a_2, dots, a_n$ and $b_1, b_2, dots, b_n$ such that:
    $
      bf(u) = sum_(i=1)^n a_i bf(v)_i, #h(3em) bf(v) = sum_(i=1)^n b_i bf(v)_i.
    $
    Then:
    $
      bf(u) + bf(v) = sum_(i=1)^n a_i bf(v)_i + sum_(i=1)^n b_i bf(v)_i = sum_(i=1)^n (a_i + b_i) bf(v)_i.
    $
    $F$ is closed under field addition, so $a_i + b_i in F$ for all $i$.
    Thus, $bf(u) + bf(v)$ is a linear combination of $S$, so $bf(u) + bf(v) in span(S)$.

  + *Closure under scalar multiplication.* Let $bf(v) in span(S)$, so there exist weights $a_1, a_2, ..., a_n$ such that:
    $
      bf(v) = sum_(i=1)^n a_i bf(v)_i.
    $
    Let $k in F$. Then:
    $
      k bf(v) = k sum_(i=1)^n a_i bf(v)_i = sum_(i=1)^n (k a_i) bf(v)_i.
    $
    $F$ is closed under field multiplication, so $k a_i in F$ for all $i$.
    Thus, $k bf(v)$ is a linear combination of $S$, so $k bf(v) in span(S)$.
    #proof-qed
]

#example[
  Let $V = RR^3$ and let $S = {(1, 0, 0), (0, 1, 0)} subset.eq V$. Define $H = span(S)$, so:
  $
    H = {a_1 dot (1, 0, 0) + a_2 dot (0, 1, 0) suchthat a_1, a_2 in RR} = {(a_1, a_2, 0) suchthat a_1, a_2 in RR}.
  $
  By #card-prefix-ref(<spans-are-subspaces>), $H$ is a subspace of $V$.
]

#terminology[Spanning Set][
  Let $V$ be a vector space and let $S subset.eq V$. All of the following statements are equivalent:
  - $span(S) = V$.
  - $S$ is a *spanning set* for $V$.
  - $S$ *spans* $V$.
  - $V$ is the subspace *generated* by $S$. 
]

That is, to say that "$S$ spans $V$" is to say that every vector in $V$ can be 
written as a linear combination of vectors in $S$.

#example[Show that the set of vectors ${(1, 0), (0, 1)}$ spans $RR^2$][
  By the definition of a spanning set, we must show that $span thin {(1, 0), (0, 1)} = RR^2$.

  Let $(x, y) in span thin {(1, 0), (0, 1)}$. Then $(x, y) in RR^2$ 
  since taking linear combinations of vectors in $RR^2$ must yield vectors in $RR^2$ by
  #card-title-ref(<linear-combinations-in-v>), so $span thin {(1, 0), (0, 1)} subset.eq RR^2$.

  Let $(x, y)$ be an arbitrary vector in $RR^2$. Then we can write the vector $(x, y)$ as a linear combination of the vectors $(1, 0)$ and $(0, 1)$ as follows:
  $
    (x, y) = x dot (1, 0) + y dot (0, 1).
  $
  So, $RR^2 subset.eq span thin {(1, 0), (0, 1)}$. 
  By double containment, $span thin {(1, 0), (0, 1)} = RR^2$. #proof-qed
]

#nonexample[
  The set of vectors ${(1, 1), (2, 2)}$ does _not_ span $RR^2$, since any linear combination of these two vectors must be of the form:
  $
    a_1 dot (1, 1) + a_2 dot (2, 2) = (a_1 + 2 a_2, a_1 + 2 a_2).
  $
  The two components of this vector must be equal, so there is no way to write a vector like $(5, 3)$ as a linear combination of these two vectors.
]

#important(oneline: true)[
  The empty set $emptyset$ spans the trivial subspace ${bf(0)}$.
]

#theorem(ref: <subspaces-are-spans>)[Subspaces are Spans][
  Let $V$ be a vector space, and let $H$ be a subspace of $V$.
  Then there exists a finite subset of $V$ that spans $H$:
  $
    exists S subset.eq V "such that" span(S) = H.
  $
  That is, _we can take vectors from $V$ to generate the subspace $H$._
]

#proof(card-title-ref(<subspaces-are-spans>))[
  Let $V$ be a vector space, and let $H$ be a subspace of $V$. 
  If $H = {bf(0)_V}$, then we can take $S = emptyset$, so assume that $H != {bf(0)_V}$.

  TODO #proof-qed
]

#theorem(ref: <spanning-set-theorem>)[Spanning Set Theorem][
  Let $S = {bf(v)_1, bf(v)_2, ..., bf(v)_n}$, and let $H = span(S)$ be the subspace generated by $S$.
  Then if some vector $bf(v)_k in S$ is a linear combination of the other vectors in $S$, then the
  set formed from $S$ by removing $bf(v)_k$ still spans $H$. Formally:
  $
    exists bf(v)_k in S "s.t." bf(v)_k in span(S without {bf(v)_k})
    #h(1em) => #h(1em) span(S without {bf(v)_k}) = span(S).
  $
]

#proof(card-title-ref(<spanning-set-theorem>))[]

#theorem(ref: <union-of-spanning-sets>)[Union of Spanning Sets][
  Let $S_1$ and $S_2$ be sets of vectors, and let $H_1 = span(S_1)$ and $H_2 = span(S_2)$ be the 
  subspaces generated by $S_1$ and $S_2$, respectively. Then the union of $S_1$ and $S_2$ spans the sum 
  of $H_1$ and $H_2$. Formally:
  $
    span(S_1 union S_2) = H_1 + H_2.
  $
]

#proof(card-prefix-ref(<union-of-spanning-sets>))[
  Let $S_1$ and $S_2$ be sets of vectors, and let $H_1 = span(S_1)$ and $H_2 = span(S_2)$ 
  be the subspaces generated by $S_1$ and $S_2$, respectively. 

  Suppose $bf(v) in span(S_1 union S_2)$. Then there exist weights $a_1, a_2, ..., a_n in F$ and 
  vectors $bf(u)_1, bf(u)_2, ..., bf(u)_n in S_1 union S_2$ such that:
  $
    bf(v) = sum_(i=1)^n a_i bf(u)_i.
  $
  We can partition the vectors $bf(u)_1, bf(u)_2, ..., bf(u)_n$ into two groups: those that are in $S_1$ 
  and those that are in $S_2$. Let the vectors in the first group be denoted by 
  $bf(s)_1, bf(s)_2, ..., bf(s)_k$, and let the vectors in the second group be denoted by 
  $bf(t)_1, bf(t)_2, ..., bf(t)_(n-k)$. Then we can rewrite the equation above as follows:
  $
    bf(v) = sum_(i=1)^k a_i bf(s)_i + sum_(j=1)^(n-k) a_(k+j) bf(t)_j.
  $
  The first sum is a linear combination of vectors in $S_1$, so the first sum is a vector in 
  $span(S_1) = H_1$; call it $bf(h)_1$. Similarly, the second sum is a linear combination of vectors in 
  $S_2$, so the second sum is a vector in $span(S_2) = H_2$; call it $bf(h)_2$. Thus, we can write:
  $
    bf(v) = bf(h)_1 + bf(h)_2, "where" bf(h)_1 in H_1 "and" bf(h)_2 in H_2.
  $
  Therefore, $bf(v) in H_1 + H_2$, so $span(S_1 union S_2) subset.eq H_1 + H_2$.

  Conversely, suppose that $bf(v) in H_1 + H_2$. Then there exist vectors $bf(h)_1 in H_1$ and 
  $bf(h)_2 in H_2$ such that:
  $
    bf(v) = bf(h)_1 + bf(h)_2.
  $
  Since $bf(h)_1 in H_1 = span(S_1)$, there exist weights $a_1, a_2, ..., a_k in F$ and vectors
  $bf(s)_1, bf(s)_2, ..., bf(s)_k in S_1$ such that:
  $
    bf(h)_1 = sum_(i=1)^k a_i bf(s)_i.
  $
  Similarly, since $bf(h)_2 in H_2 = span(S_2)$, there exist weights $b_1, b_2, ..., b_(n-k) in F$ and vectors
  $bf(t)_1, bf(t)_2, ..., bf(t)_(n-k) in S_2$ such that:
  $    
    bf(h)_2 = sum_(j=1)^(n-k) b_j bf(t)_j.
  $
  Thus, we can write:
  $
    bf(v) = sum_(i=1)^k a_i bf(s)_i + sum_(j=1)^(n-k) b_j bf(t)_j.
  $
  The vectors $bf(s)_1, bf(s)_2, ..., bf(s)_k$ and $bf(t)_1, bf(t)_2, ..., bf(t)_(n-k)$ are all 
  in $S_1 union S_2$, so $bf(v)$ is a linear combination of vectors in $S_1 union S_2$. 
  Therefore, $bf(v) in span(S_1 union S_2)$, so $H_1 + H_2 subset.eq span(S_1 union S_2)$. 
  
  By double containment, $span(S_1 union S_2) = H_1 + H_2$. #proof-qed
]

== Linear Independence

For some set of vectors $S$, there may be multiple configurations of weights to 
write a vector in $span(S)$. For example, if $S = {(1, 0), (0, 1), (1, 1)}$, 
then we can write the vector $(1, 1)$ as a linear combination of $S$ in two different ways:
$
  0 dot (1, 0) + 0 dot (0, 1) + 1 dot (1, 1) &= (1, 1). \
  1 dot (1, 0) + 1 dot (0, 1) + 0 dot (1, 1) &= (1, 1).
$

Some sets, called _linearly independent_ sets, have the property that each vector 
in their span (except for $bf(0)$) can be written as a linear combination of the set
with only one unique combination of weights.

#definition(ref: <linear-independence>)[Linear Independence][
  A set of vectors $S = {bf(v)_1, bf(v)_2, ..., bf(v)_n}$ is *linearly independent*
  iff each vector in $span(S)$ can be written as a linear combination of $S$ in only one way.

  Formally $S$ is linearly independent iff for some sets of weights $a_1, a_2, ..., a_n$ and $b_1, b_2, ..., b_n$:
  $
    sum_(i=1)^n a_i bf(v)_i = sum_(i=1)^n b_i bf(v)_i 
    => a_1 = b_1, a_2 = b_2, ..., a_n = b_n.
  $
]

We can restate #card-prefix-ref(<linear-independence>) as: _to say that a set of vectors 
$S$ is linearly independent means that if two linear combinations of vectors in $S$ are equal, 
then their weights must be equal._

#definition[Linear Dependence][
  A set of vectors $S$ is *linearly dependent* iff it is not linearly independent.
]

#terminology(oneline: true)[
  To say that vectors $bf(u)$ and $bf(v)$ are linearly independent means that
  the set ${bf(u), bf(v)}$ is linearly independent. Also, to say that $S$
  is a _linearly independent set in $V$_ means that $S$ is a set of vectors taken from $V$ 
  that is linearly independent.
]

#theorem(ref: <linear-independence-formalism>)[Formalism for Linear Independence][
  Let $V$ be a vector space over $F$, and let $S = {bf(v)_1, bf(v)_2, ..., bf(v)_n} subset.eq V$. Then $S$ is linearly independent if and only if the only solution to the equation:
  $
    sum_(i=1)^n a_i bf(v)_i = bf(0)_V
  $
  is the *trivial solution* $a_1 = a_2 = dots.c = a_n = 0_F$.
]



#proof(card-title-ref(<linear-independence-formalism>))[
  Let $V$ be a vector space over $F$, and let $S = {bf(v)_1, bf(v)_2, ..., bf(v)_n} subset.eq V$.
  Let $p$ be the statement that $S$ is linearly independent, 
  and let $q$ be the statement that the only solution to the equation
  $a_1 bf(v)_1 + a_2 bf(v)_2 + dots.c + a_n bf(v)_n = bf(0)_V$ is the trivial solution 
  $a_1 = a_2 = dots.c = a_n = 0_F$.

  *$bold(p => q)$.* Assume $S$ is linearly independent. Let $a_1, a_2, ..., a_n$ be scalars such that:
  $
    sum_(i=1)^n a_i bf(v)_i = bf(0)_V.
  $
  Then, by #card-prefix-ref(<zero-scalar-times-vector>), realize that:
  $
    sum_(i=1)^n 0_F bf(v)_i = sum_(i=1)^n bf(0)_V = bf(0)_V, "so"
    sum_(i=1)^n a_i bf(v)_i = sum_(i=1)^n 0_F bf(v)_i.
  $
  

  Since $S$ is linearly independent, the weights of these two linear combinations must be equal, so $a_1 = a_2 = ... = a_n = 0_F$. Therefore, the only solution to the equation is the trivial solution.

  *$bold(q => p).$* Assume that the only solution to the equation is the trivial solution. Let $a_1, a_2, ..., a_n$ and $b_1, b_2, ..., b_n$ be scalars such that:
  $
    sum_(i=1)^n a_i bf(v)_i = sum_(i=1)^n b_i bf(v)_i.
  $
  Then we can rearrange this equation as follows:
  $
    sum_(i=1)^n (a_i - b_i) bf(v)_i = bf(0)_V.
  $
  By our assumption, the only solution to this equation is the trivial solution, 
  so $a_i - b_i = 0_F$ for all $i$, so $a_1 = b_1$, $a_2 = b_2$, ..., $a_n = b_n$.
  Therefore, if two linear combinations of vectors in $S$ are equal, then their weights
  must be equal, so $S$ is linearly independent. 
  
  Since $p => q$ and $q => p$, we have $p <=> q$. #proof-qed
]

Following this theorem, if any one of the $bf(v)_i$ in the equation is the zero vector 
$bf(0)_V$, then any weight can be used for that vector and the equation in 
#card-prefix-ref(<linear-independence-formalism>)  would still hold, so the set 
would be linearly dependent. Thus, we have the following corollary:

#corollary(oneline: true)[
  If $bf(0) in S$, then $S$ is linearly dependent.
]

#theorem(ref: <characterization-of-linearly-dependent-sets>)[Characterization of Linearly Dependent Sets][
  An indexed set $S = {bf(v)_1, bf(v)_2, ..., bf(v)_n}$ with $bf(v)_1 != bf(0)$ is linearly dependent
  iff there exists some $k > 1$ such that $bf(v)_k$ is a linear combination of the preceding vectors, i.e.
  $bf(v)_k in span thin {bf(v)_1, ..., bf(v)_(k - 1)}$.
]

This theorem can be restated to say that a set of vectors $S$ is linearly dependent 
iff there is a vector in $S$ that can be written as a linear combination 
of the other vectors in $S$.

#proof(card-prefix-ref(<characterization-of-linearly-dependent-sets>))[
  Let $S = {bf(v)_1, bf(v)_2, ..., bf(v)_n}$ be an indexed set of vectors with $bf(v)_1 != bf(0)$. 
  Let $p$ be the statement that $S$ is linearly dependent, and let $q$ be the statement that there exists 
  some $k > 1$ such that $bf(v)_k in span thin {bf(v)_1, ..., bf(v)_(k - 1)}$.

  *$bold(p => q).$* Assume $S$ is linearly dependent. 
  Then there exist nontrivial weights $a_1, a_2, ..., a_n$ such that:
  $
    sum_(i=1)^n a_i bf(v)_i = bf(0)_V.
  $
  Since $bf(v)_1 != bf(0)_V$, we can choose weights such that $a_k != 0_F$ and $a_i = 0_F$ for all $i > k$ 
  for some $1 < k <= n$. Then we can rearrange the equation as follows:
  $
    a_k bf(v)_k = - sum_(i=1)^(k - 1) a_i bf(v)_i.
  $
  Since $a_k != 0_F$, we can multiply both sides of the equation by $a_k^(-1)$ to get:
  $
    bf(v)_k = - sum_(i=1)^(k - 1) (a_k^(-1) a_i) bf(v)_i.
  $
  The right-hand side of this equation is a linear combination of the vectors $bf(v)_1, ..., bf(v)_(k - 1)$, so $bf(v)_k in span thin {bf(v)_1, ..., bf(v)_(k - 1)}$.

  *$bold(q => p).$* Assume that there exists some $k > 1$ such that $bf(v)_k in span thin {bf(v)_1, ..., bf(v)_(k - 1)}$. By the definition of span,
  there exist weights $a_1, a_2, ..., a_(k - 1)$ such that:
  $
    bf(v)_k = sum_(i=1)^(k - 1) a_i bf(v)_i.
  $
  We can rearrange this equation as follows:
  $
    sum_(i=1)^(k - 1) a_i bf(v)_i - bf(v)_k &= bf(0)_V \
    sum_(i=1)^(k - 1) a_i bf(v)_i + (-1_F) bf(v)_k &= bf(0)_V.
  $
  No matter what any of the $a_i$ are, a nontrivial weight $-1_F$ is used for
  $bf(v)_k$ to get a linear combination that equals $bf(0)_V$, so by
  #card-prefix-ref(<linear-independence-formalism>), $S$ is linearly dependent.

  Since $p => q$ and $q => p$, we have $p <=> q$. #proof-qed
]

#important(oneline: true)[
  #card-prefix-ref(<characterization-of-linearly-dependent-sets>) 
  does not guarantee that _every_ vector in a linearly dependent set is a linear combination of the preceding vectors; only that at least one vector is.
]

It follows, then, that adding vectors to a linearly dependent set results 
in another linearly dependent set, because if there is already a vector in the set that
can be written as a linear combination of the preceding vectors, then adding more vectors won't change that fact:

#corollary(oneline: true)[
  If $S_1$ is a linearly dependent set and $S_2 supset S_1$, then $S_2$ is also a linearly dependent set.
]

It also happens that, removing a vector from a linearly _independent_ set results 
in another linearly _independent_ set:

#proposition(oneline: true, ref: <subsets-are-linearly-independent>)[
  If $S_1$ is a linearly independent set and $S_2 subset S_1$, then $S_2$ is also a linearly independent set.
]

#proof(card-prefix-ref(<subsets-are-linearly-independent>))[
  TODO
]

Since the empty set $emptyset$ is a subset of every set, it follows that the empty set 
is linearly independent:

#corollary(ref: <emptyset-is-linearly-independent>, oneline: true)[
  The empty set $emptyset$ is a linearly independent set.
]

#card-prefix-ref(<emptyset-is-linearly-independent>) can also be vacuously deduced. 
Since any linear combination of the empty set must be the zero vector, and there is only one way to write
the zero vector as a linear combination of the empty set (with no weights at all).

Also, the negation of #card-prefix-ref(<characterization-of-linearly-dependent-sets>) 
gives us a characterization of linearly _independent_ sets:

#corollary(ref: <characterization-of-linearly-independent-sets>)[Characterization of Linearly Independent Sets][
  An indexed set $S = {bf(v)_1, bf(v)_2, ..., bf(v)_n}$ with $bf(v)_1 != bf(0)$
  is linearly independent iff for every $k > 1$, $bf(v)_k in.not span thin {bf(v)_1, ..., bf(v)_(k - 1)}$.
]

#theorem(ref: <linearly-independent-subsets>)[Existence of Linearly Independent Subsets][
  Let $S$ be a set of vectors, and let $H = span(S)$ be the subspace generated by $S$. 
  Then if $S$ is a linearly dependent set, then there exists a proper subset of $S$, $S' subset S$, 
  such that $S'$ is linearly independent and still spans $H$, i.e. $span(S') = span(S)$.
]

#proof(card-prefix-ref(<linearly-independent-subsets>))[
  Let $S$ be a set of vectors, and let $H = span(S)$ be the subspace generated by $S$. 
  Assume that $S$ is a linearly dependent set. Then by 
  #card-prefix-ref(<characterization-of-linearly-dependent-sets>), there exists some vector, say 
  $bf(v)_k in S$, that can be written as a linear combination of the other vectors in $S$. 
  By the #card-title-ref(<spanning-set-theorem>), removing that vector from $S$ does not change the span
  of the set. We can repeat this process until we are left with a linearly independent subset of $S$ 
  that still spans $H$. #proof-qed
]

#theorem(ref: <linear-dependence-of-fn>)[Linear Dependence of $F^n$][
  Let $F$ be a field, and define $F^n$ as in #card-prefix-ref(<the-set-fn>).
  The set $S = {bf(v)_1, bf(v)_2, ..., bf(v)_p} subset F^n$ is linearly dependent
  in $F^n$ if $S$ contains more than $n$ vectors, i.e. if $p > n$.
]

#proof(card-prefix-ref(<linear-dependence-of-fn>))[
  
]

== Span and Linear Independence of Infinite Sets <span-of-infinite-sets>

The previous definitions of span and linear independence build from
the idea of linear combinations, which only involve finite sets of vectors.

However, we can generalize the definitions of span and linear independence to 
infinite sets of vectors:

#definition(ref: <oo-span>)[Span of an Infinite Set][
  Let $S$ be an infinite subset of a vector space $V$. $S$ is a spanning set for $V$ 
  iff for every vector $bf(v) in V$, there exists a finite subset $K$ of $S$ such that 
  $bf(v) in span(K)$.
]

#definition(ref: <oo-linear-independence>)[Linear Independence of an Infinite Set][
  Let $S$ be an infinite subset of a vector space $V$. $S$ is linearly independent
  iff for every finite subset $K$ of $S$, $K$ is linearly independent.
]

#example(oneline: true)[
  The infinite set $S = {1, x, x^2, x^3, ...}$ is linearly independent in the vector space of 
  all polynomials $PP$, and $S$ spans $PP$. 
]

== Exercises

#exercise(oneline: true)[
  Let $bf(v)_1, bf(v)_2, ..., bf(v)_n$ be vectors in a vector space $V$, and $n >= 1$.
  Show that if $bf(v)_n in span thin {bf(v)_1, ..., bf(v)_(n - 1)}$, then
  $span thin {bf(v)_1, ..., bf(v)_(n - 1)} = span thin {bf(v)_1, ..., bf(v)_n}$.
]

#exercise(oneline: true)[
  Let $S$ and $T$ be subsets of a vector space $V$.
  Show that if $S subset.eq T$, then $span(S) subset.eq span(T)$.
]

#exercise(oneline: true)[
  Suppose $S = {bf(v)_1, bf(v)_2, ..., bf(v)_k}$ and $bf(w)_1, bf(w)_2, ..., bf(w)_l in span(S)$.
  Show that:
  $
    span thin {bf(w)_1, bf(w)_2, ..., bf(w)_l} subset.eq span(S).
  $
]

#exercise(oneline: true)[
  Let $bf(u), bf(v), bf(w)$ be vectors in a vector space $V$.
  Show that if $bf(w) in span thin {bf(u), bf(v)}$ but $bf(w) in.not span thin {bf(u)}$,
  then $bf(v) in span thin {bf(u), bf(w)}$.
]

#exercise(oneline: true)[
  Show that if $bf(u)$ and $bf(v)$ are linearly independent in a vector space $V$, 
  then $bf(u) + bf(v)$ and $bf(u) - bf(v)$ are also linearly independent in $V$. 
]

#exercise(oneline: true)[
  Show that $bf(u)$ and $bf(v)$ are linearly dependent
  iff either $bf(u)$ or $bf(v)$ is a scalar multiple of the other, i.e.
  $bf(u) = k bf(v)$ or $bf(v) = k bf(u)$ for some scalar $k$.
]

#exercise(oneline: true)[
  Show that if ${bf(v)_1, bf(v)_2, ..., bf(v)_n}$ is a linearly independent set in $V$
  but ${bf(v)_1, bf(v)_2, ..., bf(v)_n, bf(w)}$ is a linearly _dependent_ set in $V$,
  then $bf(w) in span thin {bf(v)_1, bf(v)_2, ..., bf(v)_n}$.
]

#exercise(oneline: true)[
  Let $a_1, a_2, ..., a_n$ be distinct scalars in $RR$. Show that the set of functions
  ${e^(a_1 x), e^(a_2 x), ..., e^(a_n x)}$ is linearly independent in $C(RR)$, the set
  of continuous real-valued functions.
]

#exercise(oneline: true)[
  $RR^oo$ is the set of all infinite sequences of real numbers. Show that $H$, a subset of $RR^oo$ defined as follows, is a linearly independent set in $RR^oo$:
  $
    H = {(1, b, b^2, b^3, ...) in RR^oo suchthat b in RR}.
  $
]

#exercise[Telescoping Linear Independence][
  Let $V$ be a vector space, and suppose ${bf(v)_1, bf(v)_2, ..., bf(v)_n}$ is a linearly
  independent set in $V$. Define a new set of vectors $W$ by:
  $
    W = {bf(w)_1, bf(w)_2, ..., bf(w)_n} "where" bf(w)_k = sum_(i=1)^k bf(v)_i "for" k = 1, 2, ..., n.
  $
  That is, $W = {bf(v)_1, bf(v)_1 + bf(v)_2, ..., bf(v)_1 + bf(v)_2 + dots.c + bf(v)_n}$.
  Show that $W$ is also a linearly independent set in $V$.
]

#exercise(oneline: true)[
  Let $S subset.eq V$. Show that $span(S)$ is the smallest subspace of $V$
  containing $S$. That is, $S subset.eq span(S)$, and if $H$ is any subspace of $V$ such that $S subset.eq H$, then $span(S) subset.eq H$.
]

#exercise(oneline: true)[Steinitz Exchange Lemma][
  Let $V$ be a vector space. Let $U = {bf(u)_1, bf(u)_2, ..., bf(u)_m}$ and
  $W = {bf(w)_1, bf(w)_2, ..., bf(w)_n}$ be subsets of $V$. Show that if $U$ is linearly independent and $W$ spans $V$, then $m <= n$ and we can replace $m$ vectors in $W$
  with the $m$ vectors from $U$ to get a new spanning set for $V$.
]