#import "../root.typ": *

#show: blog-post.with(title: "typst test 1", date: "2026-05-10")

#title[Examples]

#ldouble

1. Prove using rules of inference that:
  $
    (P => not Q) and (Q => not P) equiv not P or not Q. 
  $

#solution[
  $
    & (P => not Q) and (Q => not P) \
    & #h(2em) equiv (not P or not Q) and (not Q or not P) & #h(1em) "by Material Implication" \
    & #h(2em) equiv (not P or not Q) and (not P or not Q) & #h(1em) "by Commutativity of" or \
    & #h(2em) equiv not P or not Q. & #h(1em) "by Idempotent Law" & qed 
  $
]

#lthin

2. Prove that the following argument is invalid:
  
#align(center)[
  If this number is larger than $9$, then its square is larger than $81$. \
  The number is not larger than $9$. \  
  Therefore, its square is not larger than $81$.
]

#solution[
  Let $p$ be the proposition "This number is larger than $9$" and let $q$ be the proposition "Its square is larger than $81$". The argument can be rewritten as follows:
    #align(center)[
      If $p$, then $q$. \
      Not $p$. \
      Therefore, not $q$.
    ]

  The statement $p => q$ is not equivalent to $not p => not q$. The argument is invalid by inverse error.
]

#lthin

#proof(oneline: true)[#lorem(100)]

#proof[Solution of ][hi]

#set heading(numbering: "1.")

= Fields

#definition[Well Ordering Principle][
  Let $x$ be a nonempty set of nonnegative integers. Then $x$ has a least element.
]

#definition[Field][
  A *field* is a set $F$ together with two binary operations _addition_ $+$ and _multiplication_ $dot$ such that the following properties hold:

  + *Closure under addition.* $forall a, b in F, a + b in F.$
  + *Closure under multiplication.* $forall a, b in F, a dot b in F.$
  + *Commutativity of addition.* $forall a, b in F, a + b = b + a.$
  + *Commutativity of multiplication.* $forall a, b in F, a dot b = b dot a.$
  + *Associativity of addition.* $forall a, b, c in F, (a + b) + c = a + (b + c).$
  + *Associativity of multiplication.* $forall a, b, c in F, (a dot b) dot c = a dot (b dot c).$
  + *Additive identity.* $exists 0 in F "s.t." forall a in F, a + 0 = a.$
  + *Multiplicative identity.* $exists 1 in F "s.t." forall a in F, a dot 1 = a.$
  + *Additive inverses.* $forall a in F, exists (-a) in F "s.t." a + (-a) = 0.$
  + *Multiplicative inverses.* $forall a in F, a != 0 => exists a^(-1) in F "s.t." a dot a^(-1) = 1.$
  + *Distributivity over addition.* $forall a, b, c in F, a dot (b + c) = (a dot b) + (a dot c).$
  + *Distributivity over multiplication.* $forall a, b, c in F, (a + b) dot c = (a dot c) + (b dot c).$

  Together, these are called the *field axioms*.

  The elements of $F$ are called *$bold(F)$-scalars*. The additive identity is denoted $0_F$ and the multiplicative identity is denoted $1_F$.
]

#definition[Field Subtraction and Field Division][
  Let $F$ be a field. The binary operation of *subtraction* $-$ on $F$ is defined as follows:
  $
    forall a, b in F, a - b = a + (-b).
  $
  The binary operation of *division* $slash$ on $F$ is defined as follows:
  $
    forall a, b in F, a / b = a dot b^(-1).
  $
]

#definition[Subfield][
  Let $F$ be a field, and let $H$ be a subset of $F$. Then $H$ is a *subfield* of $F$ iff $H$ is itself a field under the same operations of addition and multiplication as $F$.
]

#theorem[Subfield Theorem <theorem-1>][
  Let $F$ be a field, and let $H$ be a subset of $F$. Then $H$ is a subfield of $F$ if and only if:
  
  + *Non-emptiness.* $H$ is non-empty, i.e. $H != emptyset$.
  + *Closure under subtraction.* $forall a, b in H, a - b in H$.
  + *Closure under division.* $forall a, b in H, b != 0 => a slash b in H.$
]

#proof[Subfield Theorem][
  Suppose $H$ is a subset of $F$. 
  
  ($=>$) Assume $H$ is a subfield of $F$. Then $H$ is a field under the same operations as $F$, so $H$ must satisfy all the field axioms. In particular, $H$ must be non-empty since it contains at least the additive identity. $H$ must also be closed under subtraction and division since these operations are defined in terms of addition and multiplication, which are closed in $H$.

  ($arrow.double.l$) Assume that $H$ is non-empty, closed under subtraction, and closed under division. We will show that $H$ satisfies all the field axioms under the same operations as $F$. Since $H$ is a subset of $F$, the operations of addition and multiplication on $H$ are inherited from $F$.
]

#proposition[The set of all real numbers $RR$ is a field.]

#theorem[Cramer's Rule][
  Let $A$ be an invertible $n times n$ matrix, and let $b$ be a column vector of size $n$. Then the unique solution to the system of equations $A x = b$ is given by:
  $
    x_i = det(A_i)/det(A)
  $
  where $A_i$ is the matrix obtained by replacing the $i$-th column of $A$ with the column vector $b$.
]

#proposition[dih]

#lemma(inline: true, method: "global")[hi]

#corollary[hi]

#remark[hi]

#important[hi]

#warning[hi]

#caution[hi]

#note[hi]

#example[hi]