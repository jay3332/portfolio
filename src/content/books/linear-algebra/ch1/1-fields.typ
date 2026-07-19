#import "../../../root.typ": *

#show: book-section.with(name: "Fields and Subfields")

== Fields <fields>

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
  For any $a in F without {0}$, the element $a^(-1)$ is called the *multiplicative inverse* of $a$.
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

#property(ref: <field-product-is-zero>)[Products of Fields which are Zero][
  Let $F$ be a field, and let $a, b in F$. If $a b = 0$, then $a = 0$ or $b = 0$.
]

#proof(card-title-ref(<field-product-is-zero>))[
  Let $F$ be a field, and let $a, b in F$ such that $a b = 0$. 
  If $a = 0$, then we are done. Otherwise, if $a != 0$, then by the existence of multiplicative inverses, there exists $a^(-1) in F$ such that $a a^(-1) = 1$. 
  We can deduce:
  $
    a^(-1) (a b) &= a^(-1) dot 0 #h(2em) && "by assumption" \
    (a^(-1) a) b &= 0 #h(2em) && "by associativity of multiplication" \
    1 b &= 0 #h(2em) && "by definition of multiplicative inverse" \
    b &= 0 #h(2em) && "by definition of multiplicative identity"
  $
  Thus, if $a b = 0$ and $a != 0$, then $b = 0$. #proof-qed
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

=== Examples of Fields <examples-of-fields>

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

== Subfields <subfields>

A _subfield_ is a subset of a field that is itself a field under the same operations.

#definition[Subfield <subfield>][
  Let $F$ be a field, and let $H$ be a subset of $F$. Then $H$ is a *subfield* of $F$ iff $H$ is itself a field under the same operations of addition and multiplication as $F$.
]

If we already know that some set $H$ is a subset of a field $F$, then only three criteria need to be checked (rather than rechecking all axioms):

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

#proposition(ref: <finite-field>)[A Finite Field][
  For any prime number $p$, the set of integers between $0$ and $p-1$, inclusive, is a field under addition and multiplication modulo $p$.
]

#proof(card-prefix-ref(<finite-field>))[
  Let $p$ be a prime, and let $F = {0, 1, 2, ..., p-1}$. Define addition and multiplication on $F$ as follows:
  $
    forall a, b in F, a + b &= (a + b) mod p \
    a dot b &= (a dot b) mod p.
  $

  It is trivial to see that $F subset.eq RR$, so we can check the three conditions
  of #card-prefix-ref(<subfield-theorem>):
  
  + *Existence of identities.* Since $p$ is prime, $p >= 2$, so $p - 1 >= 1$.
    By the definition of $F$, $0 in F$ and $1 in F$.
  + *Closure under subtraction.* Let $a, b in F$.
    - If $a >= b$, then $a - b >= 0$ and since $b$ is nonnegative, $a - b < a< p$, so $a - b in F$.
    - If $a < b$, then $a - b < 0$, but $a - b + p >= 0$ and $a - b + p < p$, so $a - b + p in F$.
      Since $a - b + p equiv a - b thin (mod p)$, $a - b in F$.
  + *Closure under division.* Let $a, b in F$ with $b != 0$. Since $p$ is prime, 
    $b$ and $p$ are coprime, so there exist integers $x, y$ such that $b x + p y = 1$. 
    Taking this equation modulo $p$, we have $b x equiv 1 thin (mod p)$, so $b x mod p = 1$. 
    
    Thus, the multiplicative inverse of $b$ is $x mod p$, which is an element of $F$. Since $F$ is closed under multiplication, for any $a in F$, $a dot (x mod p) = a slash b in F$.
    #proof-qed
]

== Exercises <exercises>

#exercise(oneline: true, ref: <ex-Q-subfield-of-R>)[
  Show that the set of rational numbers $QQ$ is a subfield of $RR$.
]
#exercise(oneline: true, ref: <ex-boolean-field>)[
  Show that the Boolean algebra ${0, 1}$ is a field under Boolean addition (_XOR_)
  and Boolean multiplication (_AND_).
]
#exercise(oneline: true, ref: <ex-CC-is-a-field>)[
  Prove _#card-prefix-ref(<CC-is-a-field>)_.
]
#exercise(oneline: true, ref: <ex-additive-inverses-unique>)[
  Prove that _#card-title-ref(<additive-inverses-unique>)_.
]
#exercise(oneline: true, ref: <ex-additional-properties-of-fields>)[
  Prove the _#card-title-ref(<additional-properties-of-fields>)_.
]
#exercise(oneline: true, ref: <ex-intersection-of-subfields>)[
  Let $F$ be a field, and let $H_1, H_2, dots, H_n$ be a finite collection of subfields of $F$. Show that the intersection of $H_1 inter H_2 inter dots.c inter H_n$ is also a subfield of $F$.
]

// #align(right)[
//   #v(1fr)
//   Solutions: #ref(<solutions-1.1>, form: "page")
// ]