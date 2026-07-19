#import "../../../root.typ": *

#show: book-section.with(name: "Computation of Matrix Subspaces")

== Rank Factorization

#definition(ref: <rank-factorization>)[Rank Factorization of a Matrix][
  Let $A in F^(m times n)$. 
  A *rank factorization* or *column-row factorization* of $A$ is a factorization of the form:
  $
    A = C R,
  $
  where $C in F^(m times r)$ and $R in F^(r times n)$, with $r = rank(A)$.
]

#proposition(ref: <rank-factorization-basis>)[Basis for Column and Row Spaces from Rank Factorizations][
  In any rank factorization $A = C R$, the columns of $C$ form a basis for $col(A)$.
  Similarly, the rows of $R$ form a basis for $row(A)$.
]

#theorem(ref: <existence-of-rank-factorizations>)[Existence of Rank Factorizations][
  Let $A in F^(m times n)$ be a finite matrix of rank $r$. 
  Then there must exist matrices $C in F^(m times r)$ and $R in F^(r times n)$ such that $A = C R$.
]

#proof(card-prefix-ref(<existence-of-rank-factorizations>))[
  Suppose $A in F^(m times n)$ has rank $r$. Then $A$ has exactly $r$ linearly independent columns $bf(c)_1, bf(c)_2, dots.c, bf(c)_r in F^m$,
  so choose $C = display(mat(bf(c)_1, bf(c)_2, dots.c, bf(c)_r)) in F^(m times r)$. 
  Since $A$ has rank $r$, the $r$ columns of $C$ must be a basis for $col(A)$, which implies
  that any column, say the $j$#th column $bf(a)_j$, of $A$ can be expressed as a linear combination of the columns of $C$:
  $
    bf(a)_j = sum_(i=1)^r beta_(i j) bf(c)_i,
  $
  where $beta_(i j) in F$ is the coefficient of $bf(c)_i$ in the linear combination used to express $bf(a)_j$.
  Define a matrix $R$ such that its $(i, j)$#th entry is $beta_(i j)$. Since $1 <= i <= r$ in the summation,
  $R$ has $r$ rows. Since there are $n$ columns in $A$ and $j$ is the index of each column of $A$,
  $R$ has $n$ columns. Therefore, $R in F^(r times n)$. #proof-qed
]

#corollary[Alternative Rank Factorizations][
  Let $A in F^(m times n)$ be a finite matrix of rank $r$. 
  If $A = C_1 R_1$ is a rank factorization of $A$ (which follows that $C_1 in F^(m times r)$ and $R_1 in F^(r times n)$), 
  then for any invertible matrix $P in F^(r times r)$, the matrices $C_2 = C_1 P$ and $R_2 = P^(-1) R_1$ also form 
  a rank factorization of $A$, i.e., $A = C_2 R_2$.
]

#let rref = $op("rref")$
#algorithm[Finding the Rank Factorization of a Matrix][
  Let $A in F^(m times n)$ be a finite matrix of rank $r$. 

  + Find the row-reduced echelon form of $A$, say $A' = rref(A)$.
  + For every pivot column in $A'$, identify the corresponding column in $A$ and include it in the matrix $C$.
  + Form $R$ by removing any all-zero rows from $A'$.

  Now, $A = C R$ is a rank factorization of $A$.
]