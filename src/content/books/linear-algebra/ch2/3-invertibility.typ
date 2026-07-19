#import "../../../root.typ": *

#show: book-section.with(name: "Invertibility and Isomorphisms")

== Inverses of Linear Maps and Matrices

#definition[Inverse of a Linear Map][
  Let $V$ and $W$ be vector spaces over a field $F$. 
  A linear map $T: V -> W$ is *invertible* iff there exists a linear map $T^(-1): W -> V$, called the *inverse* of $T$, 
  such that $T^(-1) compose T = id_V$ and $T compose T^(-1) = id_W$, where $id_V$ and $id_W$ are the identity maps on $V$ and $W$, respectively.
]

#theorem[Bijections are Invertible][
  A linear map $T: V -> W$ is invertible if and only if $T$ is bijective (injective and surjective).
]

#theorem[Dimension of Invertible Linear Maps][
  Let $V$ and $W$ be finite-dimensional vector spaces over a field $F$. 
  Then if any linear map $T: V -> W$ is invertible, $dim(V) = dim(W)$.
]

#theorem[Equivalence of Injectivity, Surjectivity, and Invertibility][
  Suppose $V$ and $W$ are finite-dimensional vector spaces with $dim(V) = dim(W)$.
  For all linear maps $T: V -> W$, $T$ is invertible iff $T$ is injective iff $T$ is surjective.
]

#definition[Inverse of a Matrix][
  Let $A in F^(n times n)$ be a square matrix. $A$ is *invertible* iff
  there exists a square matrix $A^(-1) in F^(n times n)$, called the *inverse* of $A$, 
  such that $A^(-1) A = I_n$ and $A A^(-1) = I_n$.
]

#theorem[Inverse of a $2 times 2$ Matrix][
  Let $A = display(rmat(a, b; c, d)) in F^(2 times 2)$. 
  Then $A$ is invertible if and only if $a d - b c != 0$, in which case the inverse of $A$ is given by:
  $
    A^(-1) = 1 / (a d - b c) display(rmat(d, -b; -c, a)).
  $
]

#definition[Left and Right Inverses of Linear Maps][
  Let $T: V -> W$ be a linear map. 
  - A linear map $S: W -> V$ is a *left inverse* of $T$ iff $S compose T = id_V$. 
  - A linear map $R: W -> V$ is a *right inverse* of $T$ iff $T compose R = id_W$.
]

#definition[Left and Right Inverses of Matrices][
  Let $A in F^(m times n)$ be a matrix. 
  - A matrix $B in F^(n times m)$ is a *left inverse* of $A$ iff $B A = I_n$. 
  - A matrix $C in F^(n times m)$ is a *right inverse* of $A$ iff $A C = I_m$.
]

#corollary(oneline: true)[
  A linear map or matrix is invertible if and only if it has both a left and right inverse.
]

#proposition[Uniqueness of Inverses][
  Let $T: V -> W$ be an invertible linear map. Then the inverse of $T$ is unique.
  Similarly, let $A in F^(n times n)$ be an invertible matrix. Then the inverse of $A$ is unique.
]

#theorem[Matrix of Inverse Equals Inverse of Matrix][
  Let $T: V -> W$ be an invertible linear map, and let $cal(B)$ and $cal(C)$ be bases for $V$ and $W$, respectively. 
  Then the standard matrix of the inverse of $T$ is the inverse of the standard matrix of $T$:
  $
    [T^(-1)]_(cal(B) cal(C)) = ([T]_(cal(C) cal(B)))^(-1).
  $
]

== Isomorphisms

#definition[Isomorphism][
  Let $T: V -> W$ be a linear map. $T$ is an *isomorphism* iff $T$ is invertible.
  If there exists an isomorphism between $V$ and $W$, we say that $V$ and $W$ are *isomorphic*, denoted $V tilde.equiv W$.
]

#proposition(ref: <isomorphisms-are-equivalence>)[Isomorphisms are an Equivalence Relation][
  Let $X$, $Y$, and $Z$ be vector spaces over a field $F$. Then the following hold:

  - *Reflexivity.* $X tilde.equiv X$.
  - *Symmetry.* If $X tilde.equiv Y$, then $Y tilde.equiv X$.
  - *Transitivity.* If $X tilde.equiv Y$ and $Y tilde.equiv Z$, then $X tilde.equiv Z$.
]

#proof(card-prefix-ref(<isomorphisms-are-equivalence>))[
  Let $X$, $Y$, and $Z$ be vector spaces over a field $F$.

  - *Reflexivity.* The identity map $id_X: X -> X$ is an isomorphism, so $X tilde.equiv X$.
  - *Symmetry.* If $T: X -> Y$ is an isomorphism, then the inverse map $T^(-1): Y -> X$ is also an isomorphism, so $Y tilde.equiv X$.
  - *Transitivity.* If $T: X -> Y$ and $S: Y -> Z$ are isomorphisms, then the composition $S compose T: X -> Z$ is also an isomorphism ($(S compose T)^(-1) = T^(-1) compose S^(-1)$), so $X tilde.equiv Z$.
]

#theorem[Classification of Finite-Dimensional Vector Spaces][
  Let $V$ and $W$ be finite-dimensional vector spaces over a field $F$. 
  Then $V tilde.equiv W$ if and only if $dim(V) = dim(W)$.
]

#corollary[Isomorphisms to Coordinate Spaces][
  Let $V$ be a finite $n$-dimensional vector space over a field $F$. Then $V tilde.equiv F^n$.
  
  Specifically, we can choose any basis $cal(B)$ for $V$ and use the coordinate map $bf(v) |-> [bf(v)]_cal(B)$
  to construct an isomorphism from $V$ to $F^n$.
]

#corollary(oneline: true)[Matrices are Isomorphic to Coordinate Vectors][
  $F^(m times n) tilde.equiv F^(m n).$
]

#example(oneline: true)[
  Let $A = display(rmat(1, 2, 3; 4, 5, 6)) in RR^(2 times 3)$. Then $A$ is isomorphic to the coordinate vector $display((1, 2, 3, 4, 5, 6)) in RR^6$ under the isomorphism $A |-> [A]_cal(B)$, where:
  $
    cal(B) = {display(rmat(1, 0, 0; 0, 0, 0)), display(rmat(0, 1, 0; 0, 0, 0)), 
              display(rmat(0, 0, 1; 0, 0, 0)), display(rmat(0, 0, 0; 1, 0, 0)), 
              display(rmat(0, 0, 0; 0, 1, 0)), display(rmat(0, 0, 0; 0, 0, 1))}. 
  $
]

== Change of Basis and Similarity

Recall from #card-prefix-ref(<fundamental-property-matrix-vector-product>) that for any linear map
$T: V -> W$ and any bases $cal(B)$ and $cal(C)$ for $V$ and $W$, respectively, we have:
$
  [T]_(cal(C) cal(B)) [bf(v)]_cal(B) = [T(bf(v))]_cal(C).
$

Taking $T$ to be the identity map $id_V: V -> V$, and choosing two, potentially different bases
$cal(B)$ and $cal(C)$ for $V$, we have:
$
  [id_V]_(cal(C) cal(B)) [bf(v)]_cal(B) = [id_V (bf(v))]_cal(C) = [bf(v)]_cal(C).
$

#corollary(oneline: true)[
  Let $V$ be a vector space and choose bases $cal(B)$ and $cal(C)$ for $V$.
  Then for any vector $bf(v) in V$:
  $
    [bf(v)]_cal(C) = [id_V]_(cal(C) cal(B)) [bf(v)]_cal(B).
  $
]

Suppose $V$ is an $n$-dimensional vector space. Then $[id_V]_(cal(C) cal(B))$ is an $n times n$ matrix, which 
when applied to the coordinate vector $[bf(v)]_cal(B) in F^n$, produces the coordinate vector $[bf(v)]_cal(C) in F^n$.

#definition[Change of Basis Matrix][
  Let $V$ be an $n$-dimensional vector space over a field $F$, and let $cal(B)$ and $cal(C)$ be bases for $V$. 
  The *change of basis matrix* from the basis $cal(B)$ to the basis $cal(C)$, denoted $P_(cal(C) cal(B))$, is given by:
  $
    P_(cal(C) cal(B)) = [id_V]_(cal(C) cal(B)) = mat(|, , |; [bf(b)_1]_cal(C), dots.c, [bf(b)_n]_cal(C); |, , |),
  $
  where $bf(b)_1, bf(b)_2, dots, bf(b)_n$ are the vectors in the basis $cal(B)$. 
  It holds that $P_(cal(C) cal(B)) in F^(n times n)$.
]



#theorem[Invertibility of Change of Basis Matrix][
  Let $V$ be an $n$-dimensional vector space over a field $F$, and let $cal(B)$ and $cal(C)$ be bases for $V$. 
  Then the change of basis matrix $P_(cal(C) cal(B)) in F^(n times n)$ is invertible, with:
  $
    P_(cal(C) cal(B))^(-1) = P_(cal(B) cal(C)).
  $
]

#definition[Change of Basis Transformation][
  Let $V$ be an $n$-dimensional vector space over a field $F$, and let $cal(B)$ and $cal(C)$ be bases for $V$. 
  The *change of basis transformation* from the basis $cal(B)$ to the basis $cal(C)$, denoted $T_(cal(C) cal(B))$,
  is the linear map $T_(cal(C) cal(B)): F^n -> F^n$ defined such that:
  $
    T_(cal(C) cal(B))([bf(v)]_cal(B)) = [bf(v)]_cal(C).
  $
]

#corollary(oneline: true)[
  The change of basis transformation $T_(cal(C) cal(B))$ is concretely defined by:
  $
    T_(cal(C) cal(B))([bf(v)]_cal(B)) = P_(cal(C) cal(B)) [bf(v)]_cal(B).
  $
]

#theorem[Change of Basis for Matrices][
  Let $T: V -> V$ be a linear map on an $n$-dimensional vector space $V$ over a field $F$, 
  and let $cal(B)$ and $cal(C)$ be bases for $V$. 
  Then the standard matrices of $T$ with respect to the bases $cal(B)$ and $cal(C)$ are related by:
  $
    [T]_(cal(C) cal(C)) = P_(cal(C) cal(B)) [T]_(cal(B) cal(B)) P_(cal(B) cal(C)).
  $
]

#definition[Similarity of Matrices][
  Let $A, B in F^(n times n)$ be square matrices. $A$ and $B$ are *similar* iff there exists an invertible 
  matrix $P in F^(n times n)$ such that:
  $
    B = P^(-1) A P.
  $
]

#corollary(oneline: true)[
  Two matrices $A$ and $B$ are similar if and only if there exists a linear map $T: V -> V$ and
  bases $cal(B)$ and $cal(C)$ for $V$ such that $A = [T]_(cal(B) cal(B))$ and $B = [T]_(cal(C) cal(C))$.
]

That is, two matrices are similar if and only if they represent the same linear map,
but with respect to potentially different bases.

== Exercises

#exercise(oneline: true)[
  Suppose $T: V -> W$ is an isomorphism between $n$-dimensional vector spaces.
  Show that if ${bf(b)_1, bf(b)_2, dots, bf(b)_n}$ is a basis for $V$, then
  ${T(bf(b)_1), T(bf(b)_2), dots, T(bf(b)_n)}$ is a basis for $W$.
]

#exercise(oneline: true)[
  Let the entries of a $2 times 2$ real-valued matrix $A$ be chosen uniformly at random
  from the set ${-2, 1, 0, 1, 2}$. Find the probability that $A$ is invertible.
]

#exercise(oneline: true)[
  Let $A in F^(n times n)$. Show that if $A^2 = 0$, then $A$ is not invertible.
]

#exercise(oneline: true)[
  Suppose $A, B in F^(n times n)$ with $B != 0$. Prove or
  disprove that if $A B = 0$, then $A$ is not invertible.
]

#exercise(oneline: true)[
  Let $PP_2 (RR)$ be the vector space of all polynomials of degree at most $2$ over the field $RR$.
  Let $cal(B) = {1, x, x^2}$ and $cal(C) = {1, x - 1, (x - 1)^2}$ be bases for $PP_2 (RR)$. 
  Find the change of basis matrix $P_(cal(C) cal(B))$.  
]