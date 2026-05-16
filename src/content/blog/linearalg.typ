#import "../root.typ": *

#show: blog-post.with(title: "typst test 2", date: "2026-05-15")
#show: book-chapter.with(chapter: 1)

#title[Fundamental Structures]

= Fields

_Fields_ generalize the properties of familiar "continuous" number systems like the real numbers $RR$ and complex numbers $CC$ into
arbitrary sets which follow a set of *field axioms*.

In an abstract sense, we need three "things" to define a field: a set of objects called _scalars_
and two *binary operations* acting on those scalars.

#definition(ref: <binary-operations>)[Binary Operation][
  A function $f$ is a *binary operation* on a set $S$ iff:
  $
    f: S times S -> S.
  $
]

This implicitly requires that any binary operation $f$ on $S$ is *closed*, 
meaning that applying $f$ to any two elements of $S$ results in another element of $S$.

#definition(ref: <field>)[Field][
  A *field* $(F, +, dot)$ is a set $F$ together with two binary operations $+$ (called _addition_) and $dot$ (called _multiplication_) 
  such that the following properties hold:

  + *Associativity of addition.* $forall a, b, c in F, (a + b) + c = a + (b + c).$
  + *Associativity of multiplication.* $forall a, b, c in F, (a dot b) dot c = a dot (b dot c).$
  + *Commutativity of addition.* $forall a, b in F, a + b = b + a.$
  + *Commutativity of multiplication.* $forall a, b in F, a dot b = b dot a.$
  + *Existence of additive identity.* $exists 0 in F "s.t." forall a in F, a + 0 = a.$
  + *Existence of multiplicative identity.* $exists 1 in F "s.t." forall a in F, a dot 1 = a.$
  + *Existence of additive inverses.* $forall a in F, exists (-a) in F "s.t." a + (-a) = 0.$
  + *Existence of multiplicative inverses.* $forall a in F, a != 0 => exists a^(-1) in F "s.t." a dot a^(-1) = 1.$
  + *Distributivity over addition.* $forall a, b, c in F, a dot (b + c) = a dot b + a dot c.$

  Together, these are called the *field axioms*. The elements of $F$ are called *$bold(F)$-scalars*,
  and with relevant context, $F$-scalars may be referred to as simply *scalars*.

  For any $a in F$, the element $-a$ is called the *additive inverse* or the *negative* of $a$.
  For any $a in F backslash {0}$, the element $a^(-1)$ is called the *multiplicative inverse* of $a$.
]

#notation(oneline: true)[
  Often, the binary operations associated with a field are not explicitly listed. A field $(F, +, dot)$
  is usually denoted simply as $F$, where the operations of addition and multiplication are implied.
  The notation $+_F$ and $dot_F$ may be used to refer to the addition and multiplication operations of $F$ when there is ambiguity.
]

#notation(oneline: true)[
  The additive and multiplicative identities of a field $F$ may be denoted $0_F$ and $1_F$, respectively, when there is ambiguity.
]

#notation(oneline: true, ref: <field-juxtaposition>)[
  When unambiguous, field $$multiplication can be denoted by juxtaposition. 
  For example, $a dot b$ may be written as $a b$.
]

#property(ref: <zero-one-unique>)[Additive and Multiplicative Identities are Unique][
  Let $F$ be a field. Then there is exactly one additive identity in $F$, and exactly one multiplicative identity in $F$. That is, $exists! thin 0 in F$ and $exists! thin 1 in F$.
]

#proof(card-title-ref(<zero-one-unique>))[
  Let $F$ be a field, and suppose that $0_1$ and $0_2$ are both additive identities of $F$. 
  By the definition of additive identity, we have $0_1 + 0_2 = 0_1$ and $0_1 + 0_2 = 0_2$. Thus, $0_1 = 0_2$, so there is exactly one additive identity in $F$.
  
  Suppose that $1_1$ and $1_2$ are both multiplicative identities of $F$.
  By the definition of multiplicative identity, we have $1_1 dot 1_2 = 1_1$ and $1_1 dot 1_2 = 1_2$. Thus, $1_1 = 1_2$, so there is exactly one multiplicative identity in $F$. #proof-qed
]

#property(ref: <additive-inverses-unique>)[Additive and Multiplicative Inverses are Unique][
  Let $F$ be a field, and let $a in F$. Then there is exactly one additive inverse of $a$ in $F$.
  If $a != 0$, then there is exactly one multiplicative inverse of $a$ in $F$.

  That is, $exists! thin (-a) in F$ and $a != 0 => exists! thin a^(-1) in F$.
]

#definition[Field Subtraction <field-sub>][
  Let $F$ be a field. The binary operation of *subtraction* $-$ on $F$ is defined as follows:
  $
    forall a, b in F, a - b = a + (-b).
  $
  The quantity $a - b$ is called the *difference* of $a$ and $b$.
]
#definition[Field Division <field-division>][
  Let $F$ be a field. The binary operation of *division* $slash$ on $F$ is defined as follows:
  $
    forall a, b in F, a slash b = a dot b^(-1).
  $
  The quantity $a slash b$ is called the *quotient* of $a$ and $b$.
]

#notation(oneline: true)[
  Field division can be denoted by the fraction notation $div$. For example, $a slash b$ may be written as $display(a/b)$.
]

== Examples and Properties of Fields

#theorem(ref: <RR-is-a-field>, oneline: true)[The set of all real numbers $RR$ is a field.]

#proof(card-prefix-ref(<RR-is-a-field>))[
  Let $a, b, c$ be arbitrary elements of $RR$. 
  Choose $0 in RR$ to be the additive identity and $1 in RR$ to be the multiplicative identity. 

  Addition and multiplication of real numbers are associative and commutative, so the first four field axioms are satisfied. 

  The additive inverse of $a$ is $-a$, which is also a real number, so the axiom of existence of additive inverses is satisfied. 
  
  If $a != 0$, choose the multiplicative inverse of $a$ to be $1 slash a$, which is also a real number, so the axiom of existence of multiplicative inverses is satisfied. 
  
  We have $a (b + c) = a b + a c$, so the axiom of distributivity over addition is satisfied. Thus, all field axioms are satisfied, and $RR$ is a field. #proof-qed
]

#proposition(ref: <CC-is-a-field>, oneline: true)[The set of all complex numbers $CC$ is a field.]

#proposition(ref: <ZZ-is-not-a-field>, oneline: true)[The set of all integers $ZZ$ is _not_ a field.]

#proof(card-prefix-ref(<ZZ-is-not-a-field>))[
  Let $a = 2 in ZZ$. Then there is no multiplicative inverse of $a$ in $ZZ$, since there is no integer $a^(-1)$ such that $a dot a^(-1) = 2a^(-1) = 1$. Thus, $ZZ$ does not satisfy the field axiom of existence of multiplicative inverses, so $ZZ$ is not a field. #proof-qed
]

#proposition(ref: <additional-properties-of-fields>)[Additional Properties of Fields][
  #set enum(numbering: "a.")
  For the following, let $F$ be a field with additive identity $0_F$. 

  + *Distributivity over Multiplication.* $forall a, b, c in F, (a + b) c = a c + b c$.
  + *Multiplication by Zero.* $forall a in F, a dot 0_F = 0_F$.
  + *Double Negative Property.* $forall a in F, -(-a) = a$.
  + *Product of Negatives.* $forall a, b in F, (-a)(-b) = a b$.
  + *No Zero Divisors.* $forall a, b in F, "if" a b = 0_F "then" a = 0_F "or" b = 0_F$.
]

== Subfields

#definition[Subfield <subfield>][
  Let $F$ be a field, and let $H$ be a subset of $F$. Then $H$ is a *subfield* of $F$ iff $H$ is itself a field under the same operations of addition and multiplication as $F$.
]

#theorem(ref: <subfield-theorem>)[Subfield Criteria][
  Let $F$ be a field, and let $H$ be a subset of $F$. Let $0_F$ and $1_F$ denote the additive and multiplicative identities of $F$, respectively.
  Then $H$ is a subfield of $F$ if and only if the following criteria are met:
  
  + *Existence of identities.* $0_F in H$ and $1_F in H$.
  + *Closure under subtraction.* $forall a, b in H, a - b in H$.
  + *Closure under division.* $forall a, b in H, b != 0 => a slash b in H.$
]

#proof(card-title-ref(<subfield-theorem>))[
  Suppose $H$ is a subset of $F$. Let $p$ be the property that $H$ is a subfield of $F$, and let $q$ be the property that $H$ satisfies the three conditions listed in #card-prefix-ref(<subfield-theorem>).

  #set par(hanging-indent: 1.33em)
  
  *$bold(p => q)$.* Assume $H$ is a subfield of $F$. Then $H$ is a field under the same operations as $F$. 

  + *Existence of identities.* By the definition of a field, $H$ contains the additive and
    multiplicative identities of $F$, i.e. $0_F in H$ and $1_F in H$.
  + *Closure under subtraction.* By the definition of a field, $H$ must contain additive inverses,
    such that for any $b in H$, there must be a $-b in H$. Since $H$ is closed under addition, for any $a in H$, $a + (-b) = a - b in H$.
  + *Closure under division.* By the definition of a field, $H$ must contain multiplicative
    inverses, such that for any $b in H$ with $b != 0$, there must be a $b^(-1) in H$. Since $H$ is closed under multiplication, for any $a in H$, $a dot b^(-1) = a slash b in H$.

  *$bold(q => p)$.* Assume that $H$ satisfies the three conditions listed in #card-prefix-ref(<subfield-theorem>). Since $H$ is a subset of $F$, the operations of addition and multiplication on $H$ are inherited from $F$.

  + *Associativity of addition and multiplication.* Since $H$ is a subset of $F$ and the operations on $H$ are inherited from $F$, the associativity of addition and multiplication in $F$ implies the associativity of addition and multiplication in $H$.

  Since $p => q$ and $q => p$, we have $p <=> q$. #proof-qed
]

== Exercises

#exercise(oneline: true)[
  Show that the set of rational numbers $QQ$ is a subfield of $RR$.
]
#exercise(oneline: true)[
  Show that the Boolean algebra ${0, 1}$ is a field under Boolean addition (_XOR_)
  and Boolean multiplication (_AND_).
]
#exercise(oneline: true)[
  Prove _#card-prefix-ref(<CC-is-a-field>)_.
]
#exercise(oneline: true)[Prove that _#card-title-ref(<additive-inverses-unique>)_.]
#exercise(oneline: true)[Prove the _#card-title-ref(<additional-properties-of-fields>)_.]
#exercise(oneline: true)[
  Let $F$ be a field, and let $H_1, H_2, ..., H_n$ be a finite collection of subfields of $F$. Show that the intersection of $H_1 inter H_2 inter ... inter H_n$ is also a subfield of $F$.
]

= Vector Spaces

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

#property(ref: <negation-of-scalar-times-vector>)[Negation is Scalar Multiplication by $-1$][
  Let $V$ be a vector space over a field $F$. Then for any vector $bf(v) in V$, $(-1) bf(v) = -bf(v)$.
]

#context {
  proof(card-title-ref(<negation-of-scalar-times-vector>))[
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
]

#example(oneline: true)[An element of $F^3$ is a triple $(a, b, c)$ where $a, b, c in F$.]
#example(oneline: true)[
  Elements of $RR^2$, a vector space over $RR$, can represent points in the
  2D Cartesian plane.
]

#definition[Real and Complex Vector Spaces][
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
  
  *$bold(p => q)$.* Assume $H$ is a subspace of $V$. TODO

  *$bold(q => p)$.* Assume that $H$ is non-empty, closed under vector addition, 
    and closed under scalar multiplication. TODO

  Since $p => q$ and $q => p$, we have $p <=> q$. #proof-qed
]

#property(ref: <zero-is-a-subspace>)[${bf(0)}$ is a subspace of every vector space][
  If $bf(0)_V$ is the vector additive identity of a vector space $V$, then ${bf(0)_V}$ is a subspace of $V$.
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

== Exercises

#exercise(oneline: true)[
  Show that $RR$ is a vector space over $QQ$, the field of rational numbers.
]

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
