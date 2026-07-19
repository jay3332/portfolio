#import "../../../root.typ": *

#show: book-section.with(name: "Determinants and Permutations")

== Multilinear and Alternating Maps

#definition[Multilinear Map][
  Let $V$ be a vector space over a field $F$. A function $f: V^n -> F$ is *$bold(n)$-linear* on $V$ 
  if it is linear in each argument when the other arguments are held fixed.

  That is, if $f$ is $n$-linear, then for each $i in {1, dots, n}$, if we fix the vectors 
  $bf(v)_1, dots, bf(v)_(i-1), bf(v)_(i+1), dots, bf(v)_n in V$, the function defined by
  $bf(v)_i |-> f(bf(v)_1, dots, bf(v)_i, dots, bf(v)_n)$ is a linear map, such that for all 
  $bf(v)_j, bf(v)_k in V$ and all scalars $alpha, beta in F$, we have:
  $
    f(bf(v)_1, dots, alpha bf(v)_j + beta bf(v)_k, dots, bf(v)_n)
    = alpha f(bf(v)_1, dots, bf(v)_j, dots, bf(v)_n) + beta f(bf(v)_1, dots, bf(v)_k, dots, bf(v)_n).
  $
]

#terminology(oneline: true)[
  A function $f: V^n -> F$ is a *multilinear map* if it is $n$-linear for some $n in ZZ^+$.
]

#notation(oneline: true)[
  The set of all $n$-linear maps on $V$ is denoted $V^((n))$, and $V^((n)) subset.eq cal(L)(V^n, F)$.
]

#proposition(oneline: true)[
  $V^((n))$ is a subspace of $cal(L)(V^n, F)$.
]

#let alt = $op("alt")$
#definition[Alternating Map][
  Let $V$ be a vector space over a field $F$. A function $f: V^n -> F$ is *alternating* if 
  $f(bf(v)_1, dots, bf(v)_n) = 0$ if $bf(v)_i = bf(v)_j$ for some $i != j$.
]

That is, in an alternating map, if any two arguments are equal, the output is zero.

#notation(oneline: true)[
  The set of all alternating $n$-linear maps on $V$ is denoted $V^((n))_alt$, and $V^((n))_alt subset.eq V^((n))$.
]

#theorem(ref: <alternating-maps-linear-dependence>)[Alternating Multilinear Maps and Linear Dependence][
  Let $V$ be a vector space, and let $f in V^((n))_alt$. 
  Then for all linearly dependent sets ${bf(v)_1, dots, bf(v)_n}$, 
  it holds that $f(bf(v)_1, dots, bf(v)_n) = 0$.
]

#proof(card-prefix-ref(<alternating-maps-linear-dependence>))[
  Let $V$ be a vector space, and let $f in V^((n))_alt$.
]

#theorem(ref: <alternating-n-linear-maps>)[Alternating $n$-Linear Maps where $n > dim(V)$][
  Let $V$ be a vector space over a field $F$, and let $f in V^((n))_alt$. 
  If $n > dim(V)$, then $f(bf(v)_1, dots, bf(v)_n) = 0$ for all vectors $bf(v)_1, dots, bf(v)_n in V$.
]

#theorem(ref: <alternating-maps-characterization>)[Antisymmetry in Alternating Multilinear Maps][
  Suppose $f in V^((n))_alt$ is an alternating multilinear map. Then:
  $
    f(dots, bf(v)_i, dots, bf(v)_j, dots,) = -f(dots, bf(v)_j, dots, bf(v)_i, dots)
  $
  for all $i != j$ and all vectors $bf(v)_1, dots, bf(v)_n in V$. That is, swapping any two arguments of $f$ negates the output of $f$.
]

#proof(card-prefix-ref(<alternating-maps-characterization>))[
  Suppose $f in V^((n))_alt$ is an alternating multilinear map, and choose some 
  arbitrary $bf(v)_i, bf(v)_j in V$. Then:
  $
    f(dots, bf(v)_i + bf(v)_j, dots, bf(v)_i + bf(v)_j, dots) &= 0 #h(1em) && "by alternation" \
    f(dots, bf(v)_i, dots, bf(v)_i + bf(v)_j, dots) + f(dots, bf(v)_j, dots, bf(v)_i + bf(v)_j, dots) &= 0 #h(1em) && "by multilinearity" \
    f(dots, bf(v)_i, dots, bf(v)_i, dots) + f(dots, bf(v)_i, dots, bf(v)_j, dots) + f(dots, bf(v)_j, dots, bf(v)_i, dots) + f(dots, bf(v)_j, dots, bf(v)_j, dots) &= 0 #h(1em) && "by multilinearity" \
    0 + f(dots, bf(v)_i, dots, bf(v)_j, dots) + f(dots, bf(v)_j, dots, bf(v)_i, dots) + 0 &= 0 #h(1em) && "by alternation."
  $
  Finally, we can rearrange the equation to get:
  $
    f(dots, bf(v)_i, dots, bf(v)_j, dots) = -f(dots, bf(v)_j, dots, bf(v)_i, dots),
  $
  as desired. #proof-qed
]

== Axioms of Determinants

#definition[Determinant Function][
  Let $V$ be a vector space over a field $F$, and fix an ordered basis $cal(B) = {bf(b)_1, dots, bf(b)_n}$ 
  for $V$.

  A function $D: V^n -> F$ is a *determinant function* on $V$ with respect 
  to the basis $cal(B)$ if the following properties hold:

  + *Multilinearity.* $D$ is an $n$-linear map. That is,
    $
      D(bf(v)_1, dots, alpha bf(v)_i + beta bf(v)_j, ..., bf(v)_n)
      = alpha D(bf(v)_1, dots, bf(v)_i, ..., bf(v)_n) + beta D(bf(v)_1, dots, bf(v)_j, ..., bf(v)_n).
    $
  + *Alternation.* $D$ is alternating. That is, if $bf(v)_i = bf(v)_j$ for some $i != j$, 
    then $D(bf(v)_1, dots, bf(v)_n) = 0$.
  + *Normalization.* $D(bf(b)_1, dots, bf(b)_n) = 1$.
]

That is, a alternating multilinear map $D$ is a _determinant function_ if it evaluates to 
the multiplicative identity $1$ on the basis vectors of $V$.

#theorem(ref: <existence-uniqueness-determinant>)[Existence and Uniqueness of the Determinant Function][
  Let $V$ be a vector space over a field $F$, and fix an ordered basis $cal(B) = {bf(b)_1, dots, bf(b)_n}$ 
  for $V$. Then there is exactly one determinant function on $V$ with respect to the basis $cal(B)$.
]

#partial-proof[#card-prefix-ref(<existence-uniqueness-determinant>) (Uniqueness)][
  Let $V$ be a vector space over a field $F$, and fix an ordered basis 
  $cal(B) = {bf(b)_1, dots, bf(b)_n}$ for $V$.
  Assume that there exist two determinant functions $D_1, D_2: V^n -> F$ on $V$ with 
  respect to the basis $cal(B)$.

  #proof-lemma(none)[
    On any ordering of the basis vectors $bf(b)_(j_1), dots, bf(b)_(j_n)$, 
    $D_1 (bf(b)_(j_1), dots, bf(b)_(j_n)) = D_2 (bf(b)_(j_1), dots, bf(b)_(j_n))$
  ][
    Let $(j_1, dots, j_n)$ be an ordering (permutation) of the indices $(1, dots, n)$.
    Then $(j_1, dots, j_n)$ can be achieved by finite $k$ number of swaps of adjacent indices
    (see #card-prefix-ref(<permutation-decomposition>)). 

    By the antisymmetry of alternating maps (#card-prefix-ref(<alternating-maps-characterization>)), 
    each swap of adjacent indices negates the output of $D_1$ and $D_2$. Therefore, after $k$ swaps, 
    we have:
    $
      D_1 (bf(b)_(j_1), dots, bf(b)_(j_n)) = (-1)^k D_1 (bf(b)_1, dots, bf(b)_n) = (-1)^k D_2 (bf(b)_1, dots, bf(b)_n) = D_2 (bf(b)_(j_1), dots, bf(b)_(j_n)),
    $
    as desired. #proof-qed
  ]

  For arbitrary vectors $bf(v)_1, dots, bf(v)_n in V$, we can express 
  each vector as a linear combination of the basis vectors:
  $
    bf(v)_i = sum_(j=1)^n alpha_(i j) bf(b)_j,
  $
  where $alpha_(i j) in F$ are the coefficients of the linear combination. 
  
  We have:
  $
    D_1 (bf(v)_1, dots, bf(v)_n) &= D_1(sum_(j=1)^n alpha_(1 j) bf(b)_j, dots, sum_(j=1)^n alpha_(n j) bf(b)_j) && "since" bf(v)_i = sum_(j=1)^n alpha_(i j) bf(b)_j \
    &= sum_(j_1=1)^n dots.c sum_(j_n=1)^n alpha_(1 j_1) dots.c alpha_(n j_n) D_1(bf(b)_(j_1), dots, bf(b)_(j_n)) && "by multilinearity" \
    &= sum_(j_1=1)^n dots.c sum_(j_n=1)^n alpha_(1 j_1) dots.c alpha_(n j_n) D_2(bf(b)_(j_1), dots, bf(b)_(j_n)) && "because" D_1 (bf(b)_(j_1), dots, bf(b)_(j_n)) = D_2 (bf(b)_(j_1), dots, bf(b)_(j_n)) \
    &= D_2(sum_(j=1)^n alpha_(1 j) bf(b)_j, dots, sum_(j=1)^n alpha_(n j) bf(b)_j) && "by multilinearity" \
    &= D_2(bf(v)_1, dots, bf(v)_n) && "by substitution of linear combinations",
  $
  which implies that $D_1 = D_2$. Therefore, the determinant function is unique. #proof-qed
]

#remark(oneline: true)[
  Although there can be many alternating multilinear maps on $V$, by fixing an ordered basis
  $cal(B)$ and enforcing normalization over $cal(B)$, we can guarantee that there is exactly 
  one determinant function on $V$ with respect to $cal(B)$.
]

#definition(ref: <matrix-determinant>)[Determinant of a Matrix][
  Let $A in F^(n times n)$ be a square matrix over a field $F$. The *determinant* of $A$, 
  denoted $det(A)$ or $abs(A)$, is the determinant function $D$ on $F^n$ evaluated on the columns of $A$
  with respect to the standard basis $cal(E)_n = {bf(e)_1, dots, bf(e)_n}$ for $F^n$. That is, $det: F^(n times n) -> F$ such that:
  $ 
    det(A) = D(bf(a)_1, bf(a)_2, dots, bf(a)_n) ,
  $
  where $bf(a)_i$ is the $i$#th column of $A$.
]

#corollary(oneline: true)[
  $det(I_n) = D(bf(e)_1, bf(e)_2, dots, bf(e)_n) = 1$ by normalization.
]

#corollary(oneline: true)[
  If $A in F^(n times n)$ has two identical columns, then $det(A) = 0$ by alternation.
]

#notation(oneline: true)[
  We will use $det$ instead of $D$ for any determinant function from now on.
  For example, $det(A) = det(bf(a)_1, bf(a)_2, dots, bf(a)_n)$.
]

#theorem(ref: <det-2-by-2-matrix>)[Determinant of a $2 times 2$ Matrix][
  Let $A = display(rmat(a, b; c, d)) in F^(2 times 2)$. Then the determinant of $A$ is given by:
  $
    det(A) = a d - b c.
  $
]

#proof(card-title-ref(<det-2-by-2-matrix>))[
  Let $A = display(rmat(a, b; c, d)) in F^(2 times 2)$. Then the determinant of $A$ is given by:
  $
    det(A) &= det(bf(a)_1, bf(a)_2) && "by definition of determinant of a matrix" \
    &= det(display(rmat(a; c)), display(rmat(b; d))) && "by substitution of columns" \
    &= det(display(rmat(a; 0)), display(rmat(0; d))) + det(display(rmat(0; c)), display(rmat(b; 0))) && "by multilinearity" \
    &= a d det(display(rmat(1; 0)), display(rmat(0; 1))) + b c det(display(rmat(0; 1)), display(rmat(1; 0))) && "by multilinearity" \
    &= a d det(bf(e)_1, bf(e)_2) + b c det(bf(e)_2, bf(e)_1) && "by substitution of standard basis vectors" \
    &= a d det(bf(e)_1, bf(e)_2) - b c det(bf(e)_1, bf(e)_2) && "by antisymmetry of alternating maps" \
    &= a d - b c && "by normalization",
  $
  as desired. #proof-qed
]

#property(oneline: true)[
  If the columns of $A$ are linearly dependent, then $det(A) = 0$.
]

#proposition[Determinant of Elementary Row Operations][
  Suppose $A in F^(n times n)$. Then:
  + *Row swap.* If $A'$ is obtained by applying $R_i <-> R_j$ to $A$, then $det(A') = -det(A)$.
  + *Row scaling.* If $A'$ is obtained by applying $R_i <- c R_i$ to $A$, then $det(A') = c det(A)$.
  + *Row replacement.* If $A'$ is obtained by applying $R_i <- R_i + c R_j$ to $A$, then $det(A') = det(A)$.
]

#lemma(oneline: true)[
  If $A in F^(n times n)$ and $E$ is an elementary matrix, then $det(E A) = det(E) det(A)$.
]

#corollary[Determinant of Elementary Matrices][
  $det(E[R_i <-> R_j]) = -1$, $det(E[R_i <- c R_i]) = c$, and $det(E[R_i <- R_i + c R_j]) = 1$.
]

#definition[Determinant of a Linear Map][
  Let $T: V -> V$ be a linear map on a finite-dimensional vector space $V$ over a field $F$. 
  The *determinant* of $T$, denoted $det(T)$, is the determinant of the standard matrix of
  $T$ with respect to any basis $cal(B)$ for $V$:
  $
    det(T) = det([T]_(cal(B) cal(B))).
  $
]

#theorem[Basis Independence of Determinants of Linear Maps][
  Let $T: V -> V$ be a linear map on a finite-dimensional vector space $V$ over a field $F$. 
  Then the determinant of $T$ is independent of the choice of basis for $V$.
]

== Permutations

#let perm = $op("perm")$
#definition[Permutation][
  Suppose $m$ is a positive integer. A *permutation* of the set ${1, 2, dots, m}$ (shortened to $[m]$) is
  a bijective mapping $sigma: [m] -> [m]$. The set of all permutations of $[m]$ is denoted $perm m$.
]

#example(oneline: true)[
  Define a permutation $sigma: [3] -> [3]$ by $sigma(1) = 2$, $sigma(2) = 3$, and $sigma(3) = 1$. 
  Then $sigma in perm 3$.
]

#nonexample(oneline: true)[
  Define a function $tau: [3] -> [3]$ by $tau(1) = 2$, $tau(2) = 2$, and $tau(3) = 1$. 
  Then $tau in.not perm 3$ since it is not bijective.
]

#property(oneline: true)[For any $m in ZZ^+$, $abs(perm m) = m!$.]

#definition[Standard Sequence of a Permutation][
  The sequence $bf(sigma) = (sigma(1), sigma(2), dots, sigma(m)) in [m]^m$
  is called the *standard sequence* of $sigma$.
]

#example(oneline: true)[
  The permutation $sigma in perm 3$ defined by $sigma(1) = 2$, $sigma(2) = 3$, and $sigma(3) = 1$ has
  standard sequence $bf(sigma) = (1, 2, 3)$.
]

#corollary[Standard Sequence of the Identity Permutation][
  The identity permutation $id_[m] in perm m$ defined by $k |-> k$ has standard sequence $(1, 2, dots, m)$.
]

#let sgn = $op("sgn")$

#definition[Transposition][
  A *transposition* is a permutation $tau in perm m$ such that $tau(i) = j$ and $tau(j) = i$
  for some $i != j$, and $tau(k) = k$ for all $k in [m] without {i, j}$. That is,
  it is the permutation whose standard sequence is the result of swapping exactly one pair 
  of elements in the identity sequence $(1, 2, dots, m)$.
]

#example(oneline: true)[
  The permutation $tau in perm 3$ defined by $tau(1) = 2$, $tau(2) = 1$, and $tau(3) = 3$ is a transposition.
]

#example(oneline: true)[
  The permutation whose standard sequence is $bf(tau) = (1, 4, 3, 2, 5)$ is a transposition.
]

#nonexample(oneline: true)[
  The permutation whose standard sequence is $bf(sigma) = (1, 4, 3, 2)$ is not a transposition.
]

#theorem(ref: <permutation-decomposition>)[Permutation Decomposition][
  Every permutation $sigma in perm m$ can be expressed as a finite composition of transpositions. 
  That is, there exists a finite sequence of transpositions
  $tau_1, dots, tau_k in perm m$ such that $sigma = tau_1 compose dots.c compose tau_k$.
]

#lemma[Parity of a Permutation][
  Let $sigma in perm m$ be a permutation. The number of transpositions in any decomposition of 
  $sigma$ is either always even or always odd.
]

#definition[Sign of a Permutation][
  Let $sigma in perm m$ be a permutation. The *sign* of $sigma$, denoted $sgn(sigma)$, is defined as:
  $
    sgn(sigma) = (-1)^k,
  $
  where $k$ is the number of transpositions in any decomposition of $sigma$.
]

That is, the sign of a permutation is $1$ if it can be expressed as an even number of transpositions, 
and $-1$ if it can be expressed as an odd number of transpositions.

#terminology(oneline: true)[
  A permutation $sigma$ is *even* if $sgn(sigma) = 1$, and *odd* if $sgn(sigma) = -1$.
]

#corollary(oneline: true)[
  For any $sigma in perm m$ and transposition $tau$, $sgn(tau compose sigma) = -sgn(sigma)$.
]

#theorem(ref: <leibniz-formula>)[Leibniz Formula for Determinants][
  For any matrix $A in F^(n times n)$, the unique determinant of $A$ is given by:
  $
    det(A) = sum_(sigma in perm n) sgn(sigma) product_(i=1)^n a_(i, sigma(i)).
  $
]

#proof(card-title-ref(<leibniz-formula>))[
  From the uniqueness part of #card-prefix-ref(<existence-uniqueness-determinant>), the
  determinant of a matrix is unique. We will now show that the Leibniz formula satisfies
  the properties of a determinant function.

  For some $A = display(mat(bf(a)_1, bf(a)_2, dots.c, bf(a)_n)) in F^(n times n)$, 
  let $det(A) = det(bf(a)_1, bf(a)_2, dots, bf(a)_n)$ as in #card-prefix-ref(<matrix-determinant>).

  + *Multilinearity.* 
  + *Alternation.*
  + *Normalization.*
]

#example[
  Let $M = display(mat(a, b, c; d, e, f; g, h, i)) in F^(3 times 3)$. Realize that 
  in terms of their standard sequences:
  $
    perm 3 = {(1, 2, 3), (1, 3, 2), (2, 1, 3), (2, 3, 1), (3, 1, 2), (3, 2, 1)}.
  $
  The permutations $(1, 2, 3)$, $(2, 3, 1)$, and $(3, 1, 2)$ have even parity (require either $0$ or $2$
  transpositions), so they have a positive sign. The permutations $(1, 3, 2)$, $(2, 1, 3)$, 
  and $(3, 2, 1)$ have odd parity (require $1$ transposition), so they have a negative sign.

  Thus, by the Leibniz formula, we can compute the determinant of $M$ as follows:
  $
    det(M) &= sum_(sigma in perm 3) sgn(sigma) product_(i=1)^3 m_(i, sigma(i)) \
    &= m_11 m_22 m_33 + m_12 m_23 m_31 + m_13 m_21 m_32 
      - m_13 m_22 m_31 - m_12 m_21 m_33 - m_11 m_23 m_32 \
    &= a e i + b f g + c d h - c e g - b d i - a f h.
  $
]

#remark(oneline: true)[
  The Leibniz formula requires $n dot n!$ matrix accesses to compute the determinant 
  of an $n times n$ matrix, which is not efficient for large $n$.
]

#proof([#card-prefix-ref(<existence-uniqueness-determinant>) (Existence)])[
  We will now complete the proof of #card-prefix-ref(<existence-uniqueness-determinant>)
  by showing that the Leibniz formula can be extended to determinant functions on
  arbitrary vector spaces.
  
  Define a determinant function $D: V^n -> F$ on an arbitrary $n$-dimensional vector field $V$ 
  with respect to a fixed ordered basis $cal(B) = {bf(b)_1, dots, bf(b)_n}$ as follows:
  
  $
    D(bf(v)_1, dots, bf(v)_n) = det(A),
  $
  where $A in F^(n times n)$ is the matrix whose $i$#th column is the coordinate vector of
  $bf(v)_i$ with respect to the basis $cal(B)$. That is,
  $
    A = mat([bf(v)_1]_(cal(B)), [bf(v)_2]_(cal(B)), dots.c, [bf(v)_n]_(cal(B))).
  $
  By #card-prefix-ref(<leibniz-formula>), $det(A)$ is well-defined, and thus
  $D(bf(v)_1, dots, bf(v)_n)$ must also be well-defined. #proof-qed
]

== Exercises

#exercise(oneline: true)[
  Let $n in ZZ^+$. Show that $dim(V^((n))) = (dim V)^n$.
]
