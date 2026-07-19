#import "../../../root.typ": *

#show: book-section.with(name: "Orthogonality and Projections")

== Orthogonality

#definition[Orthogonality of Two Vectors][
  Let $V$ be an inner product space over $FF$. Two vectors $bf(u), bf(v) in V$ are *orthogonal* 
  iff: $ ang(bf(u), bf(v)) = 0, $
  in which case we say that $bf(u)$ is _orthogonal_ to $bf(v)$, denoted $bf(u) perp bf(v)$.
]

#notation(oneline: true)[If $bf(u)$ is _not_ orthogonal to $bf(v)$, we write $bf(u) cancel(perp) bf(v)$.]

#example(oneline: true)[
  Let $RR^2$ be an inner product space with dot product as the inner product. 
  Then the vectors $bf(u) = (1, 2)$ and $bf(v) = (2, -1)$ are orthogonal because:
  $
    ang(bf(u), bf(v)) = bf(u) dot bf(v) = (1, 2) dot (2, -1) = 1 dot 2 + 2 dot (-1) = 0.
  $
]

#property[Orthogonality is Symmetric][
  Let $V$ be an inner product space. Then for all vectors $bf(u), bf(v) in V$, 
  $bf(u) perp bf(v)$ if and only if $bf(v) perp bf(u)$.
]

#theorem(ref: <pythagorean-theorem>)[Pythagorean Theorem][
  Let $V$ be an inner product space. Then for all vectors $bf(u), bf(v) in V$, 
  if $bf(u) perp bf(v)$, then:
  $
    ang(bf(u) + bf(v), bf(u) + bf(v)) = ang(bf(u), bf(u)) + ang(bf(v), bf(v)).
  $
  In terms of the induced norm $norm(dot)$, this can be expressed as:
  $
    norm(bf(u) + bf(v))^2 = norm(bf(u))^2 + norm(bf(v))^2.
  $
]

#proof(card-title-ref(<pythagorean-theorem>))[
  Suppose $V$ is an inner product space over $FF$, and let $bf(u), bf(v) in V$ such that $bf(u) perp bf(v)$.
  Then:
  $
    ang(bf(u) + bf(v), bf(u) + bf(v)) &= ang(bf(u), bf(u) + bf(v)) + ang(bf(v), bf(u) + bf(v)) && "by linearity in the first argument" \
    &= ang(bf(u), bf(u)) + ang(bf(u), bf(v)) + ang(bf(v), bf(u)) + ang(bf(v), bf(v)) && "by sesquilinearity" \
    &= ang(bf(u), bf(u)) + 0 + 0 + ang(bf(v), bf(v)) && "because" bf(u) perp bf(v) \
    &= ang(bf(u), bf(u)) + ang(bf(v), bf(v)). &&& #proof-qed
  $
]

#definition[Orthogonal Set of Vectors][
  Let $V$ be an inner product space over $FF$. A set of vectors $S subset.eq V$ is *orthogonal* 
  iff every pair of distinct vectors in $S$ is orthogonal, i.e., for all $bf(u), bf(v) in S$, 
  if $bf(u) != bf(v)$, then $bf(u) perp bf(v)$:
  $
    {bf(v)_1, bf(v)_2, dots, bf(v)_p} "orthogonal" <=> 
    ang(bf(v)_i, bf(v)_j) = 0 "for all" i, j in {1, dots, p} "with" i != j.
  $
]

#theorem[Orthogonal Vectors are Linearly Independent][
  Let $V$ be an inner product space over $FF$. 
  Then any set of _nonzero_ orthogonal vectors in $V$ is linearly independent.
]

#definition[Orthonormal Set of Vectors][
  Let $V$ be an inner product space over $FF$. A set of vectors $S subset.eq V$ is *orthonormal* 
  iff $S$ is orthogonal and every vector in $S$ has norm $1$, or equivalently: 
  $
    {bf(v)_1, bf(v)_2, dots, bf(v)_p} "orthonormal" <=> 
    ang(bf(v)_i, bf(v)_j) = cases(
      1 "if" i = j, 0 "if" i != j
    ) quad "for all" i, j in {1, dots, p}.
  $
]

== Orthogonal Complements

#definition(ref: <orthogonal-complement>)[Orthogonal Complement][
  Let $V$ be an inner product space, and let $W$ be a subspace of $V$.
  The *orthogonal complement* of $W$ in the _ambient space_ $V$, denoted $W^perp$,
  is the set of vectors in $V$ that are orthogonal to every vector in $W$:
  $
    W^perp = {bf(v) in V suchthat bf(v) perp bf(w) "for all" bf(w) in W}.
  $
]

#notation[Orthogonality of Vectors to Subspaces][
  Let $V$ be an inner product space, and let $W$ be a subspace of $V$.
  A vector $bf(v) in V$ is _orthogonal to $W$_, denoted $bf(v) perp W$, 
  iff $bf(v) perp bf(w)$ for all $bf(w) in W$.
]

The above notation allows us to express #card-prefix-ref(<orthogonal-complement>) more succinctly as:
$
  W^perp = {bf(v) in V suchthat bf(v) perp W}.
$

#notation[Orthogonality of Subspaces to Subspaces][
  Let $V$ be an inner product space, and let $X, Y$ be subspaces of $V$.
  We say that $X$ is _orthogonal to $Y$_, denoted $X perp Y$, iff every vector in $X$ is orthogonal to every vector in $Y$:
  $
    X perp Y <=> bf(x) perp bf(y) "for all" bf(x) in X "and" bf(y) in Y.
  $
]

#proposition(ref: <orthogonal-complement-subspace>)[Orthogonal Complements are Subspaces][
  Let $V$ be an inner product space and $W$ be a subspace of $V$. Then $W^perp$ is a subspace of $V$.
]

#proof(card-title-ref(<orthogonal-complement-subspace>))[
  Suppose $V$ is an inner product space over $F$, and let $W$ be a subspace of $V$.

  Let $bf(u), bf(v) in W^perp$ and $alpha, beta in F$. Then for all $bf(w) in W$:
  $
    ang(alpha bf(u) + beta bf(v), bf(w)) &= alpha ang(bf(u), bf(w)) + beta ang(bf(v), bf(w)) && "by linearity in the first argument" \
    &= alpha dot 0 + beta dot 0 && "because" bf(u) perp W "and" bf(v) perp W \
    &= 0.
  $
  Thus, $alpha bf(u) + beta bf(v) perp W$, which implies that $alpha bf(u) + beta bf(v) in W^perp$.
  Therefore, $W^perp$ is closed under linear combinations, 
  so by #card-prefix-ref(<alt-subspace-criteria>), $W^perp$ is a subspace of $V$. #proof-qed
]

#theorem[Orthogonal Complements are Complements][
  Let $V$ be a finite-dimensional inner product space, and let $W$ be a subspace of $V$. Then:
  $
    V = W plus.o W^perp.
  $
]

#corollary(oneline: true)[By #card-prefix-ref(<dimension-of-direct-sum>), $dim(V) = dim(W) + dim(W^perp)$.]

This can be arranged to give a formula for the dimension of the orthogonal complement:

#corollary[Dimension of Orthogonal Complements][
  Let $V$ be a finite-dimensional inner product space, and let $W$ be a subspace of $V$. Then:
  $
    dim(W^perp) = dim(V) - dim(W).
  $
]

#theorem[Involutivity of Orthogonal Complements][
  Let $W$ be a finite-dimensional subspace of an inner product space $V$. Then:
  $ (W^perp)^perp = W. $
]

#theorem[Characterizing Orthogonal Complements using Spanning Sets][
  Let $V$ be an inner product space, and let $W$ be a subspace of $V$.
  Suppose $S subset.eq W$ is a spanning set for $W$. Then
  $bf(v) perp bf(s)$ for all $bf(s) in S$ is a sufficient condition for $bf(v) in W^perp$.
]

== Orthogonal Projections

#definition[Orthogonal Projection][
  Let $V$ be an inner product space, and let $W$ be a subspace of $V$. 
  The *orthogonal projection* of a vector $bf(v) in V$ onto the subspace $W$, denoted 
  $proj_W (bf(v))$ or $hat(bf(v))$, is the unique vector in $W$ such that:
  $
    bf(v) - hat(bf(v)) in W^perp.
  $
]

== Exercises

#exercise(oneline: true)[
  Show that for any inner product space $V$ and subspace $W$ of $V$, $W inter W^perp = {bf(0)}$.
]

#exercise(oneline: true)[
  Show that for any inner product space $V$, $V^perp = {bf(0)}$ and ${bf(0)}^perp = V$.
]

#exercise(oneline: true)[
  Show that if $W$ is a finite-dimensional subspace of an inner product space $V$, then 
  $U^perp = {bf(0)}$ if and only if $U = V$.
]

#exercise(oneline: true)[
  Let $X, Y$ be subspaces of an inner product space $V$. Show that 
    $ "if" X subset.eq Y, "then" Y^perp subset.eq X^perp. $
  ]

#exercise(oneline: true)[
  Let $X, Y$ be subspaces of an inner product space $V$. Show that: $ (X + Y)^perp = X^perp inter Y^perp. $
]

#exercise(oneline: true)[
  Let $X, Y$ be subspaces of an inner product space $V$. Show that: $ (X inter Y)^perp = X^perp + Y^perp. $
]

#exercise(oneline: true)[
  Prove or disprove that if $V = X plus.o Y$, then $V = X^perp plus.o Y^perp$.
]

#exercise(ref: <ex-pythagorean-theorem-converse>)[Converse of the Pythagorean Theorem][
  Let $V$ be an inner product space, and let some $bf(u), bf(v) in V$ satisfy:
  $
    norm(bf(u) + bf(v))^2 = norm(bf(u))^2 + norm(bf(v))^2.
  $
  Show that if $V$ is a vector space over $RR$, then $bf(u) perp bf(v)$,
  but that this is not necessarily true if $V$ is a vector space over $CC$.
]

#exercise(ref: <ex-parallelogram-law>)[Parallelogram Law][
  Let $V$ be an inner product space, and let $bf(u), bf(v) in V$. Show that:
  $
    norm(bf(u) + bf(v))^2 + norm(bf(u) - bf(v))^2 = 2 norm(bf(u))^2 + 2 norm(bf(v))^2.
  $
]

#exercise(oneline: true)[
  Let $V$ be an inner product space, and let $bf(u), bf(v) in V$. Show that:
  $
    lr(abs(norm(bf(u)) - norm(bf(v))), size: #150%) <= norm(bf(u) - bf(v)).
  $
]

#exercise(ref: <ex-translating-orthonormal-set>, oneline: true)[
  Suppose $V$ is an inner product space.
  Let ${bf(q)_1, bf(q)_2, dots, bf(q)_k} subset.eq V$ be an orthonormal set with
  $k >= 2$, and let $bf(v) in (span thin {bf(q)_1, bf(q)_2, dots, bf(q)_k})^perp$.
  Show that if $bf(v) != bf(0)$, then no two distinct vectors in the set 
  ${bf(v) + bf(q)_1, bf(v) + bf(q)_2, dots, bf(v) + bf(q)_k}$ are orthogonal.
]

#exercise(oneline: true)[
  /*Let $V$ be an inner product space and suppose $P \in \mathcal{L}(V)$ is a linear operator such that $P^2 = P$ (an idempotent operator). Prove that $P$ is an orthogonal projection (meaning $\text{range}(P) \perp \text{null}(P)$) if and only if $\Vert{}Pv\Vert{} \le \Vert{}v\Vert{}$ for every $v \in V$.*/
  Suppose $V$ is an inner product space and let $P: V -> V$ be a linear map such that $P^2 = P$ (idempotent).
  Show that $im(P) perp ker(P)$ if and only if $norm(P(bf(v))) <= norm(bf(v))$ for every $bf(v) in V$.
]