#import "../../../root.typ": *

#show: book-section.with(name: "Vector Spaces and Subspaces")

== Vector Spaces

A *vector* is an element of a *vector space*, which is a fundamental structure in linear algebra.
In fact, the study of vector spaces is what we call *linear algebra*.


#definition(ref: <vector-space>)[Vector Space][
  A *vector space* $(V, +, dot)$ over a field $F$, sometimes called an *$bold(F)$-vector space*, 
  is a set $V$ together with a binary operation $+$ (called _vector addition_) and a function $dot: F times V -> V$ (called _scalar multiplication_) such that the following properties hold:

  For all $a, b in F$ and $bf(u), bf(v), bf(w) in V$:
  + *Associativity of vector addition.* $(bf(u) + bf(v)) + bf(w) = bf(u) + (bf(v) + bf(w)).$
  + *Commutativity of vector addition.* $bf(u) + bf(v) = bf(v) + bf(u).$
  + *Existence of vector additive identity.* $exists bf(0) in V "s.t." bf(v) + bf(0) = bf(v).$
  + *Existence of vector additive inverses.* $exists (-bf(v)) in V "s.t." bf(v) + (-bf(v)) = bf(0).$
  + *Compatibility of field multiplicative identity.* $1_F thin bf(v) = bf(v).$
  + *Distributivity of scalar multiplication over vector addition.* $a (bf(u) + bf(v)) = a bf(u) + a bf(v).$
  + *Distributivity of scalar multiplication over scalar addition.* $(a + b) bf(v) = a bf(v) + b bf(v).$
  + *Compatibility of scalar and field multiplication.* $(a b) bf(v) = a (b bf(v)).$

  Together, these are called the *vector space axioms*. The elements of $V$ are called *vectors*.
  For any $bf(v) in V$, the element $-bf(v)$ is called the *additive inverse* of $bf(v)$.
]

#notation(oneline: true)[
  Vectors are often denoted in boldface ($bf(v)$) or with an arrow on top ($arrow(v)$) to distinguish them from scalars.
]

#notation(oneline: true)[
  A vector space $(V, +, dot)$ over a field $F$ is usually denoted simply as $V$, where the operations of vector addition and scalar multiplication are implied. 
  When there is ambiguity, the notation $+_V$ and $dot_V$ may be used to refer to the vector addition and scalar multiplication operations of $V$, respectively.
]

#important(oneline: true)[
  The definition of scalar multiplication implies that scalar multiplication is _closed_ over $V$, 
  meaning that for any scalar $a in F$ and any vector $bf(v) in V$, the result of scalar multiplication $a bf(v)$ is also an element of $V$.
]

#notation(oneline: true)[
  The vector additive identity of a vector space $V$ may be denoted $bf(0)_V$ when there is ambiguity.
]

#theorem(ref: <zero-scalar-times-vector>)[Multiplication of a vector by the zero scalar][
  Let $V$ be a vector space over a field $F$. Then for any vector $bf(v) in V$, $0_F bf(v) = bf(0)_V$.
]

#proof(card-prefix-ref(<zero-scalar-times-vector>))[
  Let $V$ be a vector space over a field $F$, and let $bf(v) in V$ be an arbitrary vector.
  Call the field additive identity $0_F in F$. Then:
  $
    0_F bf(v) &= (0_F + 0_F) bf(v) #h(2em) && "by the definition of additive identity" \
    0_F bf(v) &= 0_F bf(v) + 0_F bf(v) #h(2em) && "by distributivity of scalar multiplication over" +_F \
    0_F bf(v) + (-0_F bf(v)) &= 0_F bf(v) + 0_F bf(v) + (-0_F bf(v)) #h(2em) && "by left-adding" negative 0_F bf(v) "to both sides" \
    bf(0)_V &= 0_F bf(v) + 0_F bf(v) + (-0_F bf(v)) #h(2em) && "by the definition of vector additive inverse" \
    bf(0)_V &= 0_F bf(v) + (0_F bf(v) + (-0_F bf(v))) #h(2em) && "by associativity of vector addition" \
    bf(0)_V &= 0_F bf(v) + bf(0)_V #h(2em) && "by the definition of vector additive inverse" \
    bf(0)_V &= 0_F bf(v) #h(2em) && "by the definition of vector additive identity" && #proof-qed
  $
]

#theorem(ref: <zero-vector-times-scalar>)[Multiplication of the zero vector by a scalar][
  Let $V$ be a vector space over a field $F$. Then for any scalar $a in F$, $a bf(0)_V = bf(0)_V$.
]

#proof(card-prefix-ref(<zero-vector-times-scalar>))[
  Let $V$ be a vector space over a field $F$, and let $a in F$ be an arbitrary scalar.
  Call the vector additive identity $bf(0)_V in V$. Then:
  $
    a bf(0)_V &= a (bf(0)_V + bf(0)_V) #h(2em) && "by the definition of vector additive identity" \
    a bf(0)_V &= a bf(0)_V + a bf(0)_V #h(2em) && "by distributivity of scalar multiplication over" +_V \
    a bf(0)_V + (-a bf(0)_V) &= a bf(0)_V + a bf(0)_V + (-a bf(0)_V) #h(2em) && "by left-adding" negative a bf(0)_V "to both sides" \
    bf(0)_V &= a bf(0)_V + a bf(0)_V + (-a bf(0)_V) #h(2em) && "by the definition of vector additive inverse" \
    bf(0)_V &= a bf(0)_V + (a bf(0)_V + (-a bf(0)_V)) #h(2em) && "by associativity of vector addition" \
    bf(0)_V &= a bf(0)_V + bf(0)_V #h(2em) && "by the definition of vector additive inverse" \
    bf(0)_V &= a bf(0)_V #h(2em) && "by the definition of vector additive identity" && #proof-qed
  $
]

#theorem(ref: <negation-of-scalar-times-vector>)[Negation is Scalar Multiplication by $-1$][
  Let $V$ be a vector space over a field $F$. Then for any vector $bf(v) in V$, $(-1) bf(v) = -bf(v)$.
]

#context {
  proof(card-prefix-ref(<negation-of-scalar-times-vector>))[
    Let $V$ be a vector space over a field $F$, and let $bf(v) in V$ be an arbitrary vector.
    Call the field additive identity $0_F in F$ and the field multiplicative identity $1 in F$.
    By the definition of the additive inverse, there exists a scalar $-1 in F$ such that $1 + (-1) = 0_F$. Then:
    $
      (1 + (-1)) bf(v) &= 0_F bf(v) #h(2em) && "by right-multiplying both sides by" bf(v) \
      1 bf(v) + (-1) bf(v) &= 0_F bf(v) #h(2em) && "by distributivity of scalar multiplication over" +_F \
      bf(v) + (-1) bf(v) &= 0_F bf(v) #h(2em) && "by the definition of multiplicative identity" \
      bf(v) + (-1) bf(v) &= bf(0)_V #h(2em) && "by" #card-prefix-ref(<zero-scalar-times-vector>, ctx: false) \
      (-bf(v)) + bf(v) + (-1) bf(v) &= bf(0)_V + (-bf(v)) #h(2em) && "by adding" negative bf(v) "to both sides" \
      (-bf(v)) + bf(v) + (-1) bf(v) &= -bf(v) #h(2em) && "by the definition of vector additive identity" \
      bf(v) + (-bf(v)) + (-1) bf(v) &= -bf(v) #h(2em) && "by commutativity of vector addition" \
      bf(0)_V + (-1) bf(v) &= -bf(v) #h(2em) && "by the definition of vector additive inverse" \
      (-1) bf(v) &= -bf(v) #h(2em) && "by the definition of vector additive identity" && #proof-qed
    $
  ]
}

The cartesian product of a field $F$ with itself $n$ times, denoted $F^n$, 
is the set of all $n$-tuples of elements of $F$. 

It turns out that for _any_ field $F$ and positive integer $n$,
$F^n$ is a vector space over $F$ under _componentwise addition_ and _scalar multiplication_.

#notation(oneline: true)[
  In the context of introducing $F^n$, assume $n$ is a positive integer.
]

#definition(ref: <the-set-fn>)[The set $F^n$][
  Let $F$ be a field. The set $F^n$ is the set of all $n$-tuples of elements of $F$:
  $
    F^n = {(a_1, a_2, ..., a_n) suchthat a_1, a_2, ..., a_n in F}.
  $
]

#definition(ref: <operations-on-fn>)[Operations on $F^n$][
  Define *componentwise addition* and *scalar multiplication* on $F^n$ as follows:

  + *Componentwise addition.* For any $bf(u) = (u_1, u_2, ..., u_n), bf(v) = (v_1, v_2, ..., v_n) in F^n$, 
    $
      bf(u) + bf(v) = (u_1 + v_1, u_2 + v_2, ..., u_n + v_n).
    $
  + *Scalar multiplication.* For any scalar $a in F$ and any vector $bf(v) = (v_1, v_2, ..., v_n) in F^n$, 
    $
      a bf(v) = (a v_1, a v_2, ..., a v_n).
    $
]

#theorem(ref: <the-fn-vector-space>)[The set $F^n$ is a vector space over $F$][
  Let $F$ be a field. Then $F^n$ is a vector space over $F$ under the operations defined in 
  #card-prefix-ref(<operations-on-fn>).
]

#proof(card-prefix-ref(<the-fn-vector-space>))[
  Let $F$ be a field, and let $F^n$ be the set as defined in #card-prefix-ref(<the-set-fn>).
  Define vector addition and scalar multiplication on $F^n$ as in #card-prefix-ref(<operations-on-fn>).
  We will verify that $F^n$ satisfies all vector space axioms under these operations.

  Let $a, b in F$ be arbitrary scalars, and let 
  $bf(u) = (u_1, u_2, ..., u_n), bf(v) = (v_1, v_2, ..., v_n), bf(w) = (w_1, w_2, ..., w_n) in F^n$ 
  be arbitrary vectors. Then:

  + *Associativity of vector addition.* 
    $
      (bf(u) + bf(v)) + bf(w) &= ((u_1, u_2, ..., u_n) + (v_1, v_2, ..., v_n)) + (w_1, w_2, ..., w_n) \
      &= ((u_1 + v_1) + w_1, (u_2 + v_2) + w_2, ..., (u_n + v_n) + w_n) \
      &= (u_1 + (v_1 + w_1), u_2 + (v_2 + w_2), ..., u_n + (v_n + w_n)) \
      &= (u_1, u_2, ..., u_n) + (v_1 + w_1, v_2 + w_2, ..., v_n + w_n) \
      &= bf(u) + (bf(v) + bf(w)).
    $
  + *Commutativity of vector addition.*
    $
      bf(u) + bf(v) &= (u_1, u_2, ..., u_n) + (v_1, v_2, ..., v_n) \
      &= (u_1 + v_1, u_2 + v_2, ..., u_n + v_n) \
      &= (v_1 + u_1, v_2 + u_2, ..., v_n + u_n) \
      &= (v_1, v_2, ..., v_n) + (u_1, u_2, ..., u_n) \
      &= bf(v) + bf(u).
    $
  + *Existence of vector additive identity.* Choose $bf(0)_V = (0_F, 0_F, ..., 0_F)$, where 
    $0_F$ is the additive identity of $F$. For any vector $bf(v) = (v_1, v_2, ..., v_n) in F^n$, we have:
    $
      bf(v) + bf(0)_V &= (v_1 + 0_F, v_2 + 0_F, ..., v_n + 0_F) 
      = (v_1, v_2, ..., v_n) 
      = bf(v).
    $
  + *Existence of vector additive inverses.* For any vector $bf(v) = (v_1, v_2, ..., v_n) in F^n$, 
    choose $-bf(v) = (-v_1, -v_2, ..., -v_n)$, where $-v_i$ is the additive inverse of $v_i$ in $F$. Then:
    $
      bf(v) + (-bf(v)) = (v_1 + (-v_1), v_2 + (-v_2), ..., v_n + (-v_n))
      = (0_F, 0_F, ..., 0_F)
      = bf(0)_V.
    $
  + *Compatibility of field multiplicative identity.* For any vector $bf(v) = (v_1, v_2, ..., v_n) in F^n$:
    $
      1_F bf(v) &= (1_F v_1, 1_F v_2, ..., 1_F v_n)
      = (v_1, v_2, ..., v_n)
      = bf(v).
    $
  + *Distributivity of scalar multiplication over vector addition.* For any scalar $a in F$ and any vectors 
    $bf(u) = (u_1, u_2, ..., u_n), bf(v) = (v_1, v_2, ..., v_n) in F^n$:
    $
      a (bf(u) + bf(v)) &= a ((u_1, u_2, ..., u_n) + (v_1, v_2, ..., v_n)) \
      &= a (u_1 + v_1, u_2 + v_2, ..., u_n + v_n) \ 
      &= (a (u_1 + v_1), a (u_2 + v_2), ..., a (u_n + v_n)) \
      &= (a u_1 + a v_1, a u_2 + a v_2, ..., a u_n + a v_n) \ 
      &= (a u_1, a u_2, ..., a u_n) + (a v_1, a v_2, ..., a v_n) \
      &= a (u_1, u_2, ..., u_n) + a (v_1, v_2, ..., v_n) \
      &= a bf(u) + a bf(v).
    $
  + *Distributivity of scalar multiplication over scalar addition.* For any scalars $a, b in F$ and any vector $bf(v) = (v_1, v_2, ..., v_n) in F^n$:
    $
      (a + b) bf(v) &= (a + b) (v_1, v_2, ..., v_n) \
      &= ((a + b) v_1, (a + b) v_2, ..., (a + b) v_n) \
      &= (a v_1 + b v_1, a v_2 + b v_2, ..., a v_n + b v_n) \
      &= (a v_1, a v_2, ..., a v_n) + (b v_1, b v_2, ..., b v_n) \
      &= a (v_1, v_2, ..., v_n) + b (v_1, v_2, ..., v_n) \
      &= a bf(v) + b bf(v).
    $
  + *Compatibility of scalar and field multiplication.* For any scalars $a, b in F$ and any vector $bf(v) = (v_1, v_2, ..., v_n) in F^n$:
    $
      (a b) bf(v) &= (a b)(v_1, v_2, ..., v_n) \
      &= ((a b) v_1, (a b) v_2, ..., (a b) v_n) \
      &= (a (b v_1), a (b v_2), ..., a (b v_n)) \
      &= a (b v_1, b v_2, ..., b v_n) \
      &= a (b (v_1, v_2, ..., v_n)) \
      &= a (b bf(v)).
    $
]

#example(oneline: true)[An element of $F^3$ is a triple $(a, b, c)$ where $a, b, c in F$.]
#example(oneline: true)[
  Elements of $RR^2$, a vector space over $RR$, can represent points in the
  2D Cartesian plane.
]

#terminology[Real and Complex Vector Spaces][
  A vector space over $RR$ is called a *real vector space*, and a vector space over $CC$ is called a *complex vector space*.
]
#corollary(ref: <real-cn-vector-spaces>, oneline: true)[
  $RR^n$ is a real vector space, and $CC^n$ is a complex vector space.
]

== Subspaces

A *subspace* of an $F$-vector space $V$ is a subset of $V$ which is itself a vector space under the same vector addition and scalar multiplication as $V$.

#definition[Subspace][
  Let $V$ be a vector space over a field $F$, and let $H$ be a subset of $V$.
  Let $+_V$ denote the vector addition operation on $V$, and let
  $dot_V$ denote the scalar multiplication function on $V$ using scalars from $F$.

  Then $H$ is a *subspace* of $V$ iff $H$ is itself a vector space under the vector
  addition $+_V$ and scalar multiplication $dot_V$.
]

Similar to subfields, if we already know that some set $H$ is a subset of a 
vector space $V$, then only three criteria need to be checked 
(rather than rechecking all axioms):

#theorem(ref: <subspace-criteria>)[Subspace Criteria][
  Let $V$ be a vector space over a field $F$, and let $H$ be a subset of $V$. 
  Let $bf(0)_V$ denote the vector additive identity of $V$.
  Then $H$ is a subspace of $V$ if and only if the following criteria are met:
  
  + *Existence of additive identity.* $bf(0)_V in H$.
  + *Closure under vector addition.* $forall bf(u), bf(v) in H, bf(u) + bf(v) in H.$
  + *Closure under scalar multiplication.* $forall a in F, forall bf(v) in H, a bf(v) in H.$
]

#proof(card-title-ref(<subspace-criteria>))[
  Suppose $H$ is a subset of $V$. Let $p$ be the property that $H$ is a subspace of $V$, 
  and let $q$ be the property that $H$ satisfies the three conditions listed in 
  #card-prefix-ref(<subspace-criteria>).

  #set par(hanging-indent: 1.33em)
  
  *$bold(p => q)$.* Assume $H$ is a subspace of $V$. The vector additive identity
  of $V$ is unique. Since $H$ is a subspace of $V$, its vector additive identity 
  must be the same as that of $V$, so $bf(0)_V in H$. $H$ is a vector space under
  the same operations as $V$, so $H$ is closed under vector addition and scalar multiplication. Therefore, $q$ is true.

  *$bold(q => p)$.* Assume that $bf(0)_V in H$, $H$ is closed under vector addition, 
  and $H$ is closed under scalar multiplication. Then, axiom (3) is satisfied,
  as well as the requirement that $+_V: H times H -> H$ and $dot_V: F times H -> H$.
  Since $H subset.eq V$, the axioms of vector spaces that involve only elements of $H$ 
  and the operations $+_V$ and $dot_V$ (namely axioms 1, 2, 5, 6, 7, and 8) must also 
  hold for $H$ since they hold for all elements of $V$. Finally, axiom (4) is satisfied
  since for any $bf(v) in H$, we know that $(-1_F) bf(v) in H$ by closure of $H$
  under scalar multiplication, and $(-1_F) bf(v) = -bf(v)$, so $-bf(v) in H$
  by #card-prefix-ref(<negation-of-scalar-times-vector>). 
  Thus, $H$ satisfies all vector space axioms under the same operations as $V$, 
  and $H$ is a subset of $V$, so $H$ is a subspace of $V$. Therefore, $p$ is true. 

  Since $p => q$ and $q => p$, we have $p <=> q$. #proof-qed
]

#property(ref: <zero-is-a-subspace>)[${bf(0)}$ is a subspace of every vector space][
  If $bf(0)_V$ is the vector additive identity of a vector space $V$, then ${bf(0)_V}$ is a subspace of $V$.
  (This is called the *trivial subspace* of $V$.)
]

#proof(card-title-ref(<zero-is-a-subspace>))[
  Suppose $V$ is a vector space over $F$, and $bf(0)_V$ is the vector additive identity of $V$.
  Since $bf(0)_V in V$, it follows that ${bf(0)_V} subset.eq V$. 

  + *Existence of additive identity.* $bf(0)_V in {bf(0)_V}.$
  + *Closure under vector addition.* 
    For any $bf(u), bf(v) in {bf(0)_V}$, we have $bf(u) = bf(v) = bf(0)_V$, 
    so $bf(u) + bf(v) = bf(0)_V + bf(0)_V = bf(0)_V in {bf(0)_V}$.
  + *Closure under scalar multiplication.* 
    For any scalar $a in F$ and any vector $bf(v) in {bf(0)_V}$, we have 
    $bf(v) = bf(0)_V$, so $a bf(v) = a bf(0)_V = bf(0)_V in {bf(0)_V}$.

  By #card-prefix-ref(<subspace-criteria>), ${bf(0)_V}$ is a subspace of $V$. #proof-qed
]

#property(ref: <V-is-a-subspace-of-V>)[Every vector space is a subspace of itself][
  If $V$ is a vector space, then $V$ is a subspace of itself, $V$.
]

== Sums of Vector Spaces

#definition[Sum of Vector Spaces][
  Let $H_1, H_2, ... H_n$ be vector spaces. The *sum* $H_1 + H_2 + ... + H_n$ is the set of all 
  vectors that can be written as the sum of vectors from each of the vector spaces:
  $
    sum_(i=1)^n H_i = H_1 + H_2 + dots.c + H_n = {
      bf(v)_1 + bf(v)_2 + dots.c + bf(v)_n suchthat bf(v)_1 in H_1, bf(v)_2 in H_2, ..., bf(v)_n in H_n
    }.
  $
]

#corollary(oneline: true)[
  If $H_1, H_2, ..., H_n$ are subspaces of a vector space $V$, then $H_1 + H_2 + ... + H_n$ is a subspace of $V$.
]

#example(oneline: true)[
  Let $X = {(x, 0, 0) suchthat x in RR}$ and $Y = {(0, y, 0) suchthat y in RR}$ be subspaces of $RR^3$. Then:
  $
    X + Y = {(x, y, 0) suchthat x, y in RR}.
  $
]

#theorem(ref: <sum-of-subspaces-is-the-smallest>)[Sum of Subspaces is the Smallest Containing Subspace][
  Let $V$ be a vector space, and suppose $H_1, H_2, ..., H_n$ be subspaces of $V$. 
  Then $H_1 + H_2 + dots.c + H_n$ is the smallest subspace of $V$ containing 
  $H_1, H_2, ..., H_n$, meaning that if $H$ is any subspace of $V$ such that $H_i subset.eq H$ for all $i$, then $H_1 + H_2 + dots.c + H_n subset.eq H$.
]

#definition[Direct Sum of Subspaces][
  Let $H_1, H_2, ..., H_n$ be subspaces of a vector space $V$. 
  
  - The sum $H_1 + H_2 + dots.c + H_n$ is a *direct sum* iff each vector in $H_1 + H_2 + dots.c + H_n$ 
    can be written as a _unique_ sum of vectors from each subspace.
  - If $H_1 + H_2 + dots.c + H_n$ is a direct sum, we denote it as $H_1 plus.o H_2 plus.o ... plus.o H_n$ or $plus.o.big_(i=1)^n H_i$.
]

#example(oneline: true)[
  Let $X = {(x, 0, 0) suchthat x in RR}$ and $Y = {(0, y, 0) suchthat y in RR}$ be subspaces of $RR^3$. Then:
  $
    X plus.o Y = {(x, y, 0) suchthat x, y in RR}.
  $
]

#nonexample[
  Let $X = {(x, 0, 0) suchthat x in RR}$ and $Z = {(z, z, 0) suchthat z in RR}$ be subspaces of $RR^3$. Then:
  $
    X + Z = {(x + z, z, 0) suchthat x, z in RR}.
  $
  However, $X + Z$ is not a direct sum because the vector $(1, 1, 0)$ can be written as both $(1, 0, 0) + (0, 1, 0)$ and $(0, 0, 0) + (1, 1, 0)$.
]

#corollary[Direct Sum of Two Subspaces][
  Let $V$ be a vector space, and let $H_1, H_2$ be subspaces of $V$.
  Then $H_1 + H_2$ is a direct sum if and only if for some
  $bf(u)_1, bf(u)_2 in H_1$, $bf(v)_1, bf(v)_2 in H_2$:
  $
    bf(u)_1 + bf(v)_1 = bf(u)_2 + bf(v)_2
    => (bf(u)_1 = bf(u)_2 "and" bf(v)_1 = bf(v)_2).
  $
]

#theorem(ref: <direct-sum-formalism>)[Formalism for Direct Sum][
  Let $V$ be a vector space, and let $H_1, H_2, ..., H_n$ be subspaces of $V$. 
  Then $H_1 + H_2 + ... + H_n$ is a direct sum if and only if the only way to
  write $bf(0)_V$ as a sum of vectors from each subspace is the trivial combination
  $bf(0)_V = bf(0)_(H_1) + bf(0)_(H_2) + ... + bf(0)_(H_n)$.
]

#theorem(ref: <direct-sum-intersection>)[Direct Sum of Two Subspaces][
  Let $V$ be a vector space, and let $H_1, H_2$ be subspaces of $V$. 
  $H_1 + H_2$ is a direct sum if and only if $H_1 inter H_2 = {bf(0)_V}$.
]

#definition[Complement of a Subspace][
  Let $V$ be a vector space, and let $H$ be a subspace of $V$. 
  A *complement* of $H$ in the *ambient space* $V$ is a subspace $K$ of $V$ such that $H plus.o K = V$.
]

== Exercises <exercises>

#exercise(oneline: true)[
  Prove the property that _#card-title-ref(<V-is-a-subspace-of-V>)_.
]

#exercise(oneline: true)[
  Let $F$ be a field. $F^oo$ is the set of all infinite sequences of elements of $F$,
  that is, $F^oo = {(a_1, a_2, a_3, ...) suchthat a_1, a_2, a_3, ... in F}.$ Show that $F^oo$ is a vector space over $F$ under componentwise addition and scalar multiplication.
]

#exercise(oneline: true)[
  Show that the set of all polynomials with real coefficients, $PP(RR)$, is a vector space over $RR$ under polynomial addition and scalar multiplication.
]

#exercise(ref: <ex-cont-01>, oneline: true)[
  Let $C_[0, 1](RR)$ be the set of all real-valued functions that are continuous on the closed interval $[0, 1]$. Show that $C_[0, 1](RR)$ is a vector space over $RR$.
]

#exercise[
  Let $V = RR^+$ be the set of all positive real numbers. Define $V$ to be a vector
  space over the field $RR$ under the following operations:
  $
    x +_V y &= x y "for all" x, y in V, \
    a dot_V x &= x^a "for all" a in RR, x in V.
  $
  Show that $(V, +_V, dot_V)$ is in fact a vector space.
]

#exercise(ref: <RR-vector-space-over-QQ>, oneline: true)[
  Show that $RR$ is a vector space over $QQ$, the field of rational numbers.
]

#exercise[
  Let $S$ be a nonempty set and let $V = cal(P)(S)$ be the power set of $S$, i.e. 
  the set of all subsets of $S$. Let $V$ be a vector space over the 
  finite field ${0, 1}$ under the operations $+_V$ and $dot_V$ defined as follows:
  $
    A +_V B &= (A without B) inter (B without A) "for all" A, B in cal(P)(S), \
    0 dot_V A &= emptyset "for all" A in cal(P)(S), \
    1 dot_V A &= A "for all" A in cal(P)(S).
  $
  Show that $(V, +_V, dot_V)$ is in fact a vector space.
]

#exercise[
  Recall $C_[0, 1](RR)$ from #exercise-ref(<ex-cont-01>). Let $H$ be a subset of $C_[0, 1](RR)$ defined by:
  $
    H = {f in C_[0, 1](RR) suchthat integral_0^1 f(x) dd(x) = 0}.
  $ 
  Show that $H$ is a subspace of $C_[0, 1](RR)$.
]

#exercise(oneline: true)[
  Let $V$ be a vector space, and let $H_1, H_2, ..., H_p$ be subspaces of $V$.
  Show that the intersection $H_1 inter H_2 inter ... inter H_p$ is also a subspace of $V$.
]

#exercise(oneline: true)[
  Let $H_1, H_2$ be subspaces of a vector space $V$. Show that $H_1 union H_2$ is a subspace if and only if $H_1 subset.eq H_2$ or $H_2 subset.eq H_1$.
]

#exercise(oneline: true)[
  Let $V$ be a vector space, and let $X, Y, Z$ be subspaces of $V$ such that 
  $X subset.eq Z$. Show that $X + (Y inter Z) = (X + Y) inter Z$.
]

#exercise(oneline: true)[
  Show that if $H_1, H_2, ..., H_n$ are subspaces of a vector space $V$, then $H_1 + H_2 + ... + H_n subset.eq H_1 union H_2 union ... union H_n$.
]

#exercise(oneline: true)[
  Let $X = {(x, 0, 0) suchthat x in RR}$ and $Y = {(0, y, 0) suchthat y in RR}$ be subspaces of $RR^3$. Show that $X + Y$ is a direct sum.
]

#exercise(oneline: true)[
  Show that for any vector space $V$, $V plus.o {bf(0)} = V$.
]

#exercise(oneline: true)[
  Let $X = {(x, 0, 0) suchthat x in RR}$ and $Y = {(y, y, 0) suchthat y in RR}$ be subspaces of $RR^3$. Show that $X plus.o Y = RR^3$.
]

#exercise[
  Let $F$ be the set of all real-valued functions from $RR -> RR$. 
  Let $U$ be the subset of $F$ consisting of all even functions, 
  and let $V$ be the subset of $F$ consisting of all odd functions:
  $
    U &= {f in F suchthat forall x in RR, f(-x) = f(x)}, \
    V &= {f in F suchthat forall x in RR, f(-x) = -f(x)}.
  $
  Show that $U$ and $V$ are subspaces of $F$, and that $U plus.o V = F$.
]