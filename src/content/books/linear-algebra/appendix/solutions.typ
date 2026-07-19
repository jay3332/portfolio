#import "../../../root.typ": *

#show: book-section.with(name: "Solutions")

== 1.1 Fields and Subfields <solutions-1.1>

#solution-to(<ex-Q-subfield-of-R>)[
  It is known that $QQ subset RR$. We can show that $QQ$ is a subfield of $RR$ by verifying that $QQ$ 
  satisfies the three conditions in #card-prefix-ref(<subfield-theorem>).

  + *Existence of identities.* The rational numbers $QQ$ contain the additive identity $0_RR$ and the multiplicative identity $1_RR$.
  + *Closure under subtraction.* Suppose $a, b in QQ$. Then there exist integers $m, n, p, q$ with $n != 0$ and $q != 0$ such that $a = m slash n$ and $b = p slash q$. We have:
    $
      a - b = m/n - p/q = (m q - n p) / (n q),
    $
    which is a rational number since $m q - n p$ is an integer and $n q != 0$. 
  + *Closure under division.* Suppose $a, b in QQ$ with $b != 0$. Then there exist integers $m, n, p, q$ with $n != 0$ and $q != 0$ such that $a = m slash n$ and $b = p slash q$. We have:
    $
      a slash b = m/n dot (p/q)^(-1) = m/n dot q/p = (m q) / (n p),
    $
    which is a rational number since $m q$ is an integer and $n p != 0$. 
  Thus, by #card-prefix-ref(<subfield-theorem>), $QQ$ is a subfield of $RR$. #proof-qed
]

#solution-to(<ex-boolean-field>)[
  Let $B = {0, 1}$ be the Boolean algebra defined by:
  $
    0 plus.o 0 = 0, #h(1em) 0 plus.o 1 = 1, #h(1em) 1 plus.o 0 = 1, #h(1em) 1 plus.o 1 = 0, & #h(3em) ("XOR") \
    0 dot 0 = 0, #h(1em) 0 dot 1 = 0, #h(1em) 1 dot 0 = 0, #h(1em) 1 dot 1 = 1. & #h(3em) ("AND")
  $
  To show that $(B, plus.o, dot)$ is a field, we need to verify that it satisfies the field axioms:

  
]

== 1.2 Vector Spaces and Subspaces <solutions-1.2>

== 1.3 Span and Linear Independence <solutions-1.3>

== 1.4 Basis and Dimension <solutions-1.4>

== 2.1 Introduction to Linear Maps <solutions-2.1>

#solution-to(<ex-linear-map-2>)[
  Suppose $T: V -> W$ is a linear map as defined in #card-prefix-ref(<linear-map>). 
]

#solution-to(<ex-idempotent-map>)[
  Suppose $V$ is a finite-dimensional vector space, and
  let $T: V -> V$ be a linear map such that $T^2 = T$, i.e. $T compose T = T$.

  #proof-lemma(1, ref: <sol-idempotent-map-lemma-1>)[$ker(T) inter im(T) = {bf(0)}$][
    Suppose $bf(v) in ker(T) inter im(T)$. Then $bf(v) in ker(T)$ and $bf(v) in im(T)$:
    - By the definition of kernel, $T(bf(v)) = bf(0)$.
    - By the definition of image, $exists bf(x) in V$ such that $bf(v) = T(bf(x))$.

    We can deduce:
    $
      T(bf(v)) &= bf(0) #h(2em) && "by definition of kernel" \
      T(T(bf(x))) &= bf(0) #h(2em) && "by substitution of" bf(v) \
      T(bf(x)) &= bf(0) #h(2em) && "because" T compose T = T \
      bf(v) &= bf(0) #h(2em) && "by substitution"
    $

    Since assuming $bf(v) in ker(T) inter im(T)$ leads to $bf(v) = bf(0)$, we have $ker(T) inter im(T) subset.eq {bf(0)}$.

    Also, suppose $bf(v) in {bf(0)}$, i.e. $bf(v) = bf(0)$. Then:
    - $T(bf(v)) = T(bf(0)) = bf(0)$, so $bf(v) in ker(T)$.
    - $bf(0) in im(T)$ because $bf(0)$ is in every vector space.

    Thus, $bf(v) in ker(T) inter im(T)$, so ${bf(0)} subset.eq ker(T) inter im(T)$.
    
    By double containment, $ker(T) inter im(T) = {bf(0)}$.
  ]

  #proof-lemma(2, ref: <sol-idempotent-map-lemma-2>)[$ker(T) + im(T) = V$][
    Let $bf(w)$ be an arbitrary vector in $V$.
    Choose $bf(u) = T(bf(w)) in im(T)$ and $bf(v) = bf(w) - bf(u)$,
    such that $bf(w) = bf(u) + bf(v)$. It follows that:
    $
      T(bf(v)) &= T(bf(w) - bf(u)) #h(2em) && "by definition of" bf(v) \
      T(bf(v)) &= T(bf(w)) - T(bf(u)) #h(2em) && "by linearity of" T \
      T(bf(v)) &= T(bf(w)) - T(T(bf(w))) #h(2em) && "by substitution of" bf(u) \
      T(bf(v)) &= T(bf(w)) - T(bf(w)) #h(2em) && "because" T compose T = T \
      T(bf(v)) &= bf(0) #h(2em) && "by definition of additive inverse" 
    $
    Thus, $bf(v) in ker(T)$. Since $bf(w) = bf(u) + bf(v)$, we have $bf(w) in ker(T) + im(T)$,
    so $V subset.eq ker(T) + im(T)$. 

    Now, suppose $bf(w) in ker(T) + im(T)$. Then there exist $bf(u) in im(T)$ and $bf(v) in ker(T)$ 
    such that $bf(w) = bf(u) + bf(v)$. Since $im(T)$ and $ker(T)$ are subspaces of $V$,
    it follows that $bf(u) in V$ and $bf(v) in V$. $V$ is closed under vector addition, so $bf(w) = bf(u) + bf(v) in V$, which implies $ker(T) + im(T) subset.eq V$.

    By double containment, $ker(T) + im(T) = V$.
  ]

  By #card-prefix-ref(<direct-sum-intersection>), $ker(T) plus.o im(T) = V$. #proof-qed
]

== 2.2 Introduction to Matrices <solutions-2.2>

== 6.2 Orthogonality and Projections <solutions-6.2>

#solution-to(<ex-translating-orthonormal-set>)[
  Let $V$ be an inner product space, and let ${bf(q)_1, bf(q)_2, dots, bf(q)_k} subset.eq V$ be 
  an orthonormal set with $k >= 2$. 
  Let $bf(v) in (span thin {bf(q)_1, bf(q)_2, dots, bf(q)_k})^perp$ such that $bf(v) != bf(0)$.

  Choose any two distinct vectors $bf(v) + bf(q)_i$ and $bf(v) + bf(q)_j$ in the set 
  ${bf(v) + bf(q)_1, bf(v) + bf(q)_2, dots, bf(v) + bf(q)_k}$ with $i != j$. Notice that $bf(v) perp bf(q)_i$ and $bf(v) perp bf(q)_j$ because $bf(v) in (span thin {bf(q)_1, bf(q)_2, dots, bf(q)_k})^perp$ and
  $bf(q)_i, bf(q)_j in span thin {bf(q)_1, bf(q)_2, dots, bf(q)_k}$. We have:
  $
    ang(bf(v) + bf(q)_i, bf(v) + bf(q)_j) &= ang(bf(v), bf(v) + bf(q)_j) + ang(bf(q)_i, bf(v) + bf(q)_j) && "by linearity in the first argument" \
    &= ang(bf(v), bf(v)) + ang(bf(v), bf(q)_j) + ang(bf(q)_i, bf(v)) + ang(bf(q)_i, bf(q)_j) && "by sesquilinearity" \
    &= ang(bf(v), bf(v)) + ang(bf(v), bf(q)_j) + ang(bf(q)_i, bf(v)) + 0 && "because" bf(q)_i perp bf(q)_j \
    &= ang(bf(v), bf(v)) + 0 + 0 + 0 && "because" bf(v) perp bf(q)_i "and" bf(v) perp bf(q)_j \
    &= ang(bf(v), bf(v)) != 0 && "because" bf(v) != bf(0) "(positive-definiteness)."
  $
  Thus, $ang(bf(v) + bf(q)_i, bf(v) + bf(q)_j) != 0$, which implies that 
  $bf(v) + bf(q)_i cancel(perp) bf(v) + bf(q)_j$.
  Therefore, no two distinct vectors in the set ${bf(v) + bf(q)_1, dots, bf(v) + bf(q)_k}$ are orthogonal.
  #proof-qed
]