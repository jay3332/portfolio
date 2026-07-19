#import "../../../root.typ": *

#show: book-section.with(name: "Introduction to Matrices")

== Matrix Representations of Linear Maps

A *matrix* is a rectangular array of scalars arranged in rows and columns. 
Matrices can be used to represent linear maps between finite-dimensional vector spaces.

A matrix with $m$ rows and $n$ columns with elements from a field $F$ is called an 
$m times n$ matrix over $F$. 

#notation[Sets of Matrices][
  There are various ways to denote the set of all $m times n$ matrices over $F$,
  most commonly:
  $ cal(M)_(m times n)(F), #h(3em) F^(m times n). $
]

If $A$ is a matrix, then $a_(i j)$ denotes the element in the $i$#th row and $j$#th column of $A$:
$
  A = mat(a_(1 1), a_(1 2), dots.c, a_(1 n); 
          a_(2 1), a_(2 2), dots.c, a_(2 n); 
          dots.v, dots.v, dots.down, dots.v; 
          a_(m 1), a_(m 2), dots.c, a_(m n)).
$

#notation[Column and Row Vectors][
  A *column vector* represents a vector in $F^m$ as an $m times 1$ matrix, 
  and a *row vector* represents a vector in $F^n$ as a $1 times n$ matrix.
]

#example(oneline: true)[
  The vector $bf(v) = (1, 2, 3) in RR^3$ can be represented as the column vector $display(mat(1; 2; 3))$ 
  or the row vector $display(mat(1, 2, 3))$.
]

Despite the abstract notion of linear maps, by choosing bases for the domain and codomain vector spaces,
we can represent linear maps concretely as matrices in familiar fields like $RR$ and $CC$.

#definition(ref: <standard-matrix>)[Standard Matrix of a Linear Map][
  Let $V$ and $W$ be finite-dimensional vector spaces over the same field $F$, 
  and let $T: V -> W$ be a linear map. Let $cal(B) = {bf(b)_1, bf(b)_2, dots.c, bf(b)_n}$ be an ordered basis for $V$, 
  and let $cal(C) = {bf(c)_1, bf(c)_2, dots.c, bf(c)_m}$ be an ordered basis for $W$. 

  The *standard matrix* of $T$ with respect to the bases $cal(B)$ and $cal(C)$, denoted $[T]_(cal(C) cal(B))$, 
  is the $m times n$ matrix whose $i$#th column is the coordinate vector of $T(bf(b)_i)$ with 
  respect to the basis $cal(C)$, where $bf(b)_i$ is the $i$#th basis vector in $cal(B)$:
  $
    [T]_(cal(C) cal(B)) = mat(
      |, |, , |; 
      [T(bf(b)_1)]_cal(C),
      [T(bf(b)_2)]_cal(C),
      dots.c,
      [T(bf(b)_n)]_cal(C);
      |, |, , |
    ).
  $
]

#corollary[Dimension of a Standard Matrix][
  Let $T: V -> W$ be a linear map between finite-dimensional vector spaces.
  If $dim(V) = n$ and $dim(W) = m$, then any standard matrix for $T$ 
  is an $m times n$ matrix.
]

#example[
  Let $PP_3(RR)$ be the real vector space of all polynomials of degree at most 3 over the indeterminate $x$
  with real coefficients. 
  Also, consider the *standard polynomial basis* $cal(B) = {1, x, x^2, x^3}$ for $PP_3(RR)$.

  Recall that differentiation is a linear map, so define $D: PP_3(RR) -> PP_3(RR)$ by $D(f) = inlinedv(f, x)$.
  The standard matrix of $D$ with respect to the standard polynomial basis $cal(B)$ is the $4 times 4$ matrix:
  $
    [D]_(cal(B) cal(B)) &= mat(
      |, |, |, |; 
      [D(1)]_cal(B), 
      [D(x)]_cal(B), 
      [D(x^2)]_cal(B), 
      [D(x^3)]_cal(B);
      |, |, |, |
    ) \
    &= mat(|, |, |, |; [0]_cal(B), [1]_cal(B), [2x]_cal(B), [3x^2]_cal(B); |, |, |, |)
    = rmat(0, 1, 0, 0; 0, 0, 2, 0; 0, 0, 0, 3; 0, 0, 0, 0).
  $
]

#example[
  Let $T: RR^2 -> RR^3$ be a linear map defined by $T(x, y) = (x, 3x + y, x - 2y)$. 
  The standard matrix of $T$ with respect to the standard bases for $RR^2$ and $RR^3$
  ($cal(E)_2$ and $cal(E)_3$ respectively) is the $3 times 2$ matrix:
  $
    [T]_(cal(E)_3 cal(E)_2) &= mat(
      |, |; 
      [T(bf(e)_1)]_(cal(E)_3), 
      [T(bf(e)_2)]_(cal(E)_3);
      |, |
    ) \
    &= mat(|, |; T(bf(e)_1), T(bf(e)_2); |, |) "because" [bf(v)]_cal(E) = bf(v) \
    &= mat(|, |; T(1, 0), T(0, 1); |, |) = rmat(1, 0; 3, 1; 1, -2).
  $
]

In general, if $T: V -> F^m$ is a linear map, we can use the standard basis $cal(E)_m$ for $F^m$
to construct a standard matrix for $T$ without needing to compute coordinate vectors.
Since $[bf(v)]_cal(E)_m = bf(v)$ for all $bf(v) in F^m$:
$
  [T]_(cal(E)_m cal(B)) = mat(
    |, |, , |; 
    T(bf(b)_1),
    T(bf(b)_2),
    dots.c,
    T(bf(b)_n);
    |, |, , |
  ) "where" cal(B) = {bf(b)_1, bf(b)_2, dots.c, bf(b)_n} "is a basis for" V.
$

Furthermore, if $V = F^n$, we can use the standard basis $cal(E)_n$ for $F^n$ to construct a standard matrix for $T$
based on only the standard basis vectors $bf(e)_1, bf(e)_2, dots, bf(e)_n$:
$
  [T]_(cal(E)_m cal(E)_n) = mat(
    |, |, , |; 
    T(bf(e)_1),
    T(bf(e)_2),
    dots.c,
    T(bf(e)_n);
    |, |, , |
  ) "where" cal(E)_n = {bf(e)_1, bf(e)_2, dots.c, bf(e)_n}.
$

This specific standard matrix of $T$ is often simply called the *standard matrix* or *coordinate matrix* of $T$, denoted $[T]$.

#corollary[Standard Matrix of a Linear Map from $F^n$ to $F^m$][
  Let $T: F^n -> F^m$ be a linear map. Then the standard matrix of $T$, denoted $[T]$, with respect to the 
  standard bases for $F^n$ and $F^m$ ($cal(E)_n$ and $cal(E)_m$ respectively) is the $m times n$ matrix whose $i$#th column is the image of 
  $bf(e)_i in F^n$ under $T$. That is,
  $
    [T] = [T]_(cal(E)_m cal(E)_n) = mat(
      |, |, , |; 
      T(bf(e)_1),
      T(bf(e)_2),
      dots.c,
      T(bf(e)_n);
      |, |, , |
    ).
  $
]

Now suppose $bf(v) in V$ and $T: V -> W$ is a linear map. Also let $cal(B)$ and $cal(C)$ be 
bases for $V$ and $W$ respectively. 

#definition(ref: <matrix-vector-product>)[Matrix-Vector Product][
  Suppose $A in F^(m times n)$ has columns $bf(a)_1, bf(a)_2, dots, bf(a)_n in F^m$,
  and let $bf(x) = (x_1, x_2, dots, x_n) in F^n$ be a column vector. That is:
  $
    A = mat(|, |, , |; bf(a)_1, bf(a)_2, dots.c, bf(a)_n; |, |, , |), #h(2em) 
    bf(x) = mat(x_1; dots.v; x_n).
  $
  The *matrix-vector product* of $A$ and $bf(x)$, denoted $A bf(x)$, is the vector in $F^m$ defined by:
  $
    A bf(x) = x_1 bf(a)_1 + x_2 bf(a)_2 + dots.c + x_n bf(a)_n.
  $
  In other words, $A bf(x)$ is the linear combination of the columns of $A$ whose weights 
  are given by the entries of $bf(x)$.
]

#example(oneline: true)[
  Let $A = display(rmat(1, 2; 3, 4))$ and $bf(x) = display(mat(5; 6))$. Then the matrix-vector product of $A$ and $bf(x)$ is:
  $
    A bf(x) = 5 mat(1; 3) + 6 mat(2; 4) = mat(17; 39).
  $
]

#theorem(ref: <fundamental-property-matrix-vector-product>)[Fundamental Property of the Matrix-Vector Product][
  The matrix-vector product of the standard matrix $[T]_(cal(C) cal(B))$ of $T$ with respect to the 
  bases $cal(B)$ and $cal(C)$ and the coordinate vector $[bf(v)]_cal(B)$ of $bf(v)$ with respect to the 
  basis $cal(B)$ is:
  $
    [T]_(cal(C) cal(B)) [bf(v)]_cal(B) = [T(bf(v))]_cal(C).
  $
]

#context proof(card-prefix-ref(<fundamental-property-matrix-vector-product>))[
  Suppose $T: V -> W$ is a linear map.
  Let $cal(B) = {bf(b)_1, bf(b)_2, dots.c, bf(b)_n}$ be an ordered basis for $V$, 
  and let $cal(C) = {bf(c)_1, bf(c)_2, dots.c, bf(c)_m}$ be an ordered basis for $W$. 
  Let $bf(v) in V$ be a vector with $cal(B)$-coordinates $[bf(v)]_cal(B) = (x_1, x_2, dots, x_n)$,
  such that $bf(v) = x_1 bf(b)_1 + x_2 bf(b)_2 + dots.c + x_n bf(b)_n$.
  Then:
  $
    [T]_(cal(C) cal(B)) [bf(v)]_cal(B) 
    &= mat(|, , |; [T(bf(b)_1)]_cal(C), dots.c, [T(bf(b)_n)]_cal(C); |, , |) mat(x_1; dots.v; x_n) \
    &= x_1 [T(bf(b)_1)]_cal(C) + x_2 [T(bf(b)_2)]_cal(C) + dots.c + x_n [T(bf(b)_n)]_cal(C) && 
    "by" #card-prefix-ref(<matrix-vector-product>, ctx: false) \
    &= [x_1 T(bf(b)_1) + x_2 T(bf(b)_2) + dots.c + x_n T(bf(b)_n)]_cal(C) && 
    "by" #card-prefix-ref(<linearity-of-basis-transformation>, ctx: false) \
    &= [T(x_1 bf(b)_1 + x_2 bf(b)_2 + dots.c + x_n bf(b)_n)]_cal(C) && "because" T "is linear" \
    &= [T(bf(v))]_cal(C) && "by substitution of" bf(v),
  $
  as desired. #proof-qed
]

#definition[Identity Matrix][
  The *$bold(n times n)$ identity matrix*, written $I_n$, is the $n times n$ standard matrix
  of the identity map $id_(F^n)$ with respect to the standard basis 
  $cal(E)_n = {bf(e)_1, bf(e)_2, dots, bf(e)_n}$:
  $
    I_n = [id_(F^n)]_(cal(E)_n cal(E)_n) 
    = mat(|, |, , |; bf(e)_1, bf(e)_2, dots.c, bf(e)_n; |, |, , |) 
    = mat(1, 0, dots.c, 0; 
      0, 1, dots.c, 0; 
      dots.v, dots.v, dots.down, dots.v; 
      0, 0, dots.c, 1).
  $
]

#corollary(oneline: true)[
  Let $A in F^(m times n)$. Then $I_m A = A I_n = A$.
]

#corollary(oneline: true)[
  Let $bf(v) in F^n$. Then $I_n bf(v) = bf(v)$.
]

#definition[Standard Transformation of a Matrix][
  The *standard transformation* of a matrix $A in F^(m times n)$ is the linear map $T_A: F^n -> F^m$ defined by:
  $
    T_A (bf(x)) = A bf(x) "for all" bf(x) in F^n.
  $
]

#proposition(oneline: true)[
  Let $A in F^(m times n)$ be a matrix and let $T_A: F^n -> F^m$ be the standard transformation of $A$. 
  Then the standard matrix of $T_A$ with respect to the standard bases for $F^n$ and $F^m$ is $A$, i.e. $[T_A] = A$.
]

== Operations on Matrices

#definition(ref: <matmul>)[Matrix Multiplication][
  Let $A in F^(m times p)$ and $B in F^(p times n)$ be matrices. 
  The *matrix product* of $A$ and $B$, denoted $A B$, is the $m times n$ matrix
  whose $i$#th column is the matrix-vector product of $A$ and the $i$#th column of $B$:
  $
    A B = A mat(bf(b)_1, bf(b)_2, dots.c, bf(b)_n) = mat(A bf(b)_1, A bf(b)_2, dots.c, A bf(b)_n).
  $
]

#theorem(ref: <matmul-is-composition>)[Fundamental Property of Matrix Multiplication][
  Let $U, V, W$ be finite-dimensional vector spaces over a field $F$, and let 
  $S: V -> W$ and $T: U -> V$ be linear maps. Let $cal(B)$, $cal(C)$, and $cal(D)$ 
  be ordered bases for $U$, $V$, and $W$ respectively. Then:
  $
    [S]_(cal(D) cal(C)) [T]_(cal(C) cal(B)) = [S compose T]_(cal(D) cal(B)).
  $
]

#context proof(card-prefix-ref(<matmul-is-composition>))[
  Let $S: V -> W$ and $T: U -> V$ be linear maps between finite-dimensional vector spaces, 
  and let $cal(B) = {bf(b)_1, dots, bf(b)_n}$, $cal(C)$, and $cal(D)$ be 
  ordered bases for $U$, $V$, and $W$ respectively. Then:
  $
    [S]_(cal(D) cal(C)) [T]_(cal(C) cal(B)) 
    &= [S]_(cal(D) cal(C)) mat(|, , |; [T(bf(b)_1)]_cal(C), dots.c, [T(bf(b)_n)]_cal(C); |, , |) 
    && "by" #card-prefix-ref(<standard-matrix>, ctx: false) \
    &= mat(|, , |; [S]_(cal(D) cal(C)) [T(bf(b)_1)]_cal(C), dots.c, [S]_(cal(D) cal(C)) [T(bf(b)_n)]_cal(C); |, , |)
    && "by" #card-prefix-ref(<matmul>, ctx: false) \
    &= mat(|, , |; [S(T(bf(b)_1))]_cal(D), dots.c, [S(T(bf(b)_n))]_cal(D); |, , |)
    && "by" #card-prefix-ref(<fundamental-property-matrix-vector-product>, ctx: false) \
    &= mat(|, , |; [(S compose T)(bf(b)_1)]_cal(D), dots.c, [(S compose T)(bf(b)_n)]_cal(D); |, , |) && "by definition of function composition" \
    &= [S compose T]_(cal(D) cal(B)) && "by" #card-prefix-ref(<standard-matrix>, ctx: false),
  $
  as desired. #proof-qed
]

#theorem[Alternative Formula for Matrix Multiplication][
  Let $A in F^(m times p)$ and $B in F^(p times n)$ be matrices. 
  Denote $bf(a)_i in F^p$ as the $i$#th _row_ of $A$ and $bf(b)_j in F^p$ as the $j$#th _column_ of $B$.

  Define a function#footnote[This is the dot product, which is redefined later] 
  $f: F^p times F^p -> F$ by $f((x_1, dots, x_p), (y_1, dots, y_p)) = sum_(k=1)^p x_k y_k$.
  Then the $(i, j)$#th entry of the matrix product $A B$ is $f(bf(a)_i, bf(b)_j)$:

  $
    mat(bar.h, bf(a)_1, bar.h; 
        bar.h, bf(a)_2, bar.h; 
        , dots.v, ; 
        bar.h, bf(a)_m, bar.h) 
    mat(
      |, |, , |;
      bf(b)_1, bf(b)_2, dots.c, bf(b)_n;
      |, |, , |
    ) = mat(
      f(bf(a)_1, bf(b)_1), f(bf(a)_1, bf(b)_2), dots.c, f(bf(a)_1, bf(b)_n);
      f(bf(a)_2, bf(b)_1), f(bf(a)_2, bf(b)_2), dots.c, f(bf(a)_2, bf(b)_n);
      dots.v, dots.v, dots.down, dots.v;
      f(bf(a)_m, bf(b)_1), f(bf(a)_m, bf(b)_2), dots.c, f(bf(a)_m, bf(b)_n)
    ).
  $
]

#definition(ref: <matrix-transpose>)[Transpose of a Matrix][
  Let $A in F^(m times n)$ be a matrix. The *transpose* of $A$, denoted $A^transpose$, 
  is the $n times m$ matrix obtained by interchanging the rows and columns of $A$:
  $
    A^transpose = mat(a_(1 1), a_(2 1), dots.c, a_(m 1); 
      a_(1 2), a_(2 2), dots.c, a_(m 2); 
      dots.v, dots.v, dots.down, dots.v; 
      a_(1 n), a_(2 n), dots.c, a_(m n)).
  $
]

#example(oneline: true)[
  The transpose of a $2 times 3$ matrix is a $3 times 2$ matrix:
  $
    rmat(1, 2, 3; 4, 5, 6)^transpose = rmat(1, 4; 2, 5; 3, 6).
  $
]

#definition(ref: <matrix-ops-1>)[Matrix Addition and Scalar Multiplication][
  Let $A, B in F^(m times n)$ be matrices. 
  The *matrix addition* of $A$ and $B$, denoted $A + B$, is the $m times n$ matrix obtained by adding 
  corresponding entries of $A$ and $B$:
  $
    A + B = mat(a_(1 1) + b_(1 1), a_(1 2) + b_(1 2), dots.c, a_(1 n) + b_(1 n); 
                a_(2 1) + b_(2 1), a_(2 2) + b_(2 2), dots.c, a_(2 n) + b_(2 n); 
                dots.v, dots.v, dots.down, dots.v; 
                a_(m 1) + b_(m 1), a_(m 2) + b_(m 2), dots.c, a_(m n) + b_(m n)).
  $
  
  Let $c in F$ be a scalar. 
  The *scalar multiplication* of $A$ by $c$, denoted $c A$, is the matrix obtained by multiplying each 
  entry of $A$ by the scalar $c$:
  $
    c A = mat(c dot a_(1 1), c dot a_(1 2), dots.c, c dot a_(1 n); 
              c dot a_(2 1), c dot a_(2 2), dots.c, c dot a_(2 n); 
              dots.v, dots.v, dots.down, dots.v; 
              c dot a_(m 1), c dot a_(m 2), dots.c, c dot a_(m n)).
  $
]

#theorem(ref: <F-mn-is-a-vector-space>)[$F^(m times n)$ is a Vector Space][
  $F^(m times n)$, the set of all $m times n$ matrices over the field $F$, 
  is an $m n$-dimensional vector space over $F$ under the matrix addition 
  and scalar multiplication as defined in #card-prefix-ref(<matrix-ops-1>).
]

#proof(card-prefix-ref(<F-mn-is-a-vector-space>))[
  Suppose $F$ is an arbitrary field, and $m, n in ZZ^+$.

  #proof-lemma(1)[$F^(m times n)$ is a vector space over $F$][
    
  ]
  #proof-lemma(2)[$dim(F^(m times n)) = m n$][

  ]
  Thus, $F^(m times n)$ is an $m n$-dimensional vector space over $F$.
]

== Subspaces Defined by Matrices

#definition(ref: <column-space>)[Column Space of a Matrix][
  Let $A$ be an $m times n$ matrix over a field $F$. The *column space* of $A$, 
  denoted $col(A)$, is the subspace of $F^m$ spanned by the columns of $A$:
  $
    col mat(|, |, , |; bf(a)_1, bf(a)_2, dots.c, bf(a)_n; |, |, , |) 
    = span thin {bf(a)_1, bf(a)_2, dots, bf(a)_n}.
  $
]

#definition(ref: <row-space>)[Row Space of a Matrix][
  Let $A$ be an $m times n$ matrix over a field $F$. The *row space* of $A$, 
  denoted $row(A)$, is the subspace of $F^n$ spanned by the rows of $A$:
  $
    row mat(bar.h, bf(a)_1, bar.h; 
            bar.h, bf(a)_2, bar.h; 
            , dots.v, ; 
            bar.h, bf(a)_m, bar.h) 
    = span thin {bf(a)_1, bf(a)_2, dots, bf(a)_m}.
  $
]

#important(oneline: true)[
  Suppose $A in F^(m times n)$. Then $col(A)$ is a subspace of $F^m$ and $row(A)$ is a subspace of $F^n$.
]

#corollary(oneline: true)[
  $col(A) = row(A^transpose)$, and $row(A) = col(A^transpose)$.
]

#corollary(oneline: true)[
  $col(A) = im(T_A)$, where $T_A: F^n -> F^m$ is defined by $bf(x) |-> A bf(x)$.
]

#definition(ref: <null-space>)[Null Space of a Matrix][
  Let $A$ be an $m times n$ matrix over a field $F$. The *null space* of $A$, 
  denoted $nul(A)$, is the subspace of $F^n$ defined by:
  $
    nul(A) = {bf(x) in F^n suchthat A bf(x) = bf(0)}.
  $
]

#important(oneline: true)[
  Suppose $A in F^(m times n)$. Then $nul(A)$ is a subspace of $F^n$.
]

#corollary(oneline: true)[
  $nul(A) = ker(T_A)$, where $T_A: F^n -> F^m$ is defined by $bf(x) |-> A bf(x)$.
]

#definition[Rank and Nullity of a Matrix][
  Let $A$ be an $m times n$ matrix over a field $F$. The *rank* of $A$, denoted $rank(A)$, 
  is the dimension of the column space of $A$:
  $
    rank(A) = dim(col(A)).
  $
  The *nullity* of $A$, denoted $nullity(A)$, is the dimension of the null space of $A$:
  $
    nullity(A) = dim(nul(A)).
  $
]

#corollary(oneline: true)[$dim(col(A)) = dim(row(A)) = rank(A)$.]

#theorem(ref: <rank-nullity-theorem-for-matrices>)[Rank-Nullity Theorem for Matrices][
  Let $A$ be an $m times n$ matrix over a field $F$. Then:
  $
    rank(A) + nullity(A) = n.
  $
]

== Exercises

#exercise(oneline: true)[
  Let $A in F^(m times k)$ and $B in F^(k times n)$. Show that:
  $
    rank(A B) <= min(rank(A), rank(B)).
  $
]

#exercise(oneline: true)[
  Suppose $A, B in F^(n times n)$ with $A^2 = B^2$ and $A^3 = B^3$.
  Prove or disprove that necessarily $A = B$.
]

#exercise(oneline: true)[
  Suppose $V$ and $W$ are finite-dimensional nontrivial vector spaces, and $T: V -> W$ is a linear map. 
  Show that $rank(T) = 1$ if and only if there exists a basis $cal(B)$ for $V$ and a basis
  $cal(C)$ for $W$ such that all entries of $[T]_(cal(C) cal(B))$ equal $1$.
]

#exercise[
  Let $PP_n (RR)$ denote the vector space of all polynomials of degree at most $n$ over the indeterminate $x$ 
  with real coefficients. Let $cal(B)_n = {1, x, x^2, ..., x^n}$ be the standard polynomial basis for $PP_n (RR)$.

  Define the _integration_ map $J: PP_3 (RR) -> PP_4 (RR)$ on polynomials of at most degree 3 by: $
    J(f) = display(integral_0^x f(t) dd(t)).
  $
  Show that $J$ is a linear map and find $display([J]_(cal(B)_4 cal(B)_3))$, the $5 times 4$ standard matrix of $J$
  with respect to the standard polynomial bases for $PP_3 (RR)$ and $PP_4 (RR)$.
]

