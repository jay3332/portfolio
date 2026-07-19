#import "../../../root.typ": *

#show: book-section.with(name: "Echelon Forms and Row Reduction")

== Elementary Row Operations

#definition[Elementary Row Operation][
  An *elementary row operation* on a matrix $A in F^(m times n)$ is one of the following operations:

  - *Row swap ($R_i <-> R_j$).* Interchange the $i$#th and $j$#th rows of $A$ with $i != j$.
  - *Row scaling ($R_i <- c R_i$).* Scale the $i$#th row of $A$ by $c$.
  - *Row replacement ($R_i <- R_i + c R_j$).* Add $c$ times the $j$#th row to the $i$#th row.

  Where $1 <= i != j <= m$ and $c in F$ is a scalar such that $c != 0$.
]

#definition[Elementary Matrix][
  An *elementary matrix* $E in F^(n times n)$ is a square matrix obtained by applying a single 
  elementary row operation to the identity matrix $I_n$.
]

#corollary[Elementary Row Operations as Matrix Multiplication][
  Let $A in F^(m times n)$ be a matrix and $E in F^(m times m)$ be an elementary matrix obtained by applying 
  an elementary row operation $R$ to $I_m$. 
  Then the matrix product $E A$ is the matrix obtained by applying the row operation $R$ to $A$.
]

#notation[Specifying Elementary Matrices][
  Let $I$ be the identity matrix.
  - $E[R_i <-> R_j]$ denotes the elementary matrix after applying $R_i <-> R_j$ to $I$ with $i != j$.
  - $E[R_i <- c R_i]$ denotes the elementary matrix after applying $R_i <- c R_i$ to $I$.
  - $E[R_i <- R_i + c R_j]$ denotes the elementary matrix after applying $R_i <- R_i + c R_j$ to $I$.
]

This allows us to describe an arbitrary matrix $A in F^(n times p)$ after applying an 
elementary row operation $R$ to $A$ by writing $E[R] A$.

#definition[Row Equivalence][
  Let $A, B in F^(m times n)$ be matrices. We say that $A$ and $B$ are *row equivalent*, denoted $A ~ B$, 
  if there exists a finite sequence of elementary row operations that transforms $A$ into $B$.
  That is, there exists a finite sequence of elementary matrices $E_1, E_2, dots, E_k$
  such that $B = E_k E_(k-1) dots.c E_1 A$.
]

#proposition[Row Equivalence is an Equivalence Relation][
  Let $A, B, C in F^(m times n)$ be matrices, and let $~$ denote row equivalence. Then the following hold:

  - *Reflexivity.* $A ~ A$.
  - *Symmetry.* If $A ~ B$, then $B ~ A$.
  - *Transitivity.* If $A ~ B$ and $B ~ C$, then $A ~ C$.
]

#proposition[Invertibility of Elementary Matrices][
  Every elementary matrix is invertible, and its inverse is also an elementary matrix.
]

#theorem(ref: <alternative-characterization-of-invertibility>)[Alternative Characterization of Invertibility][
  Let $A in F^(n times n)$. Then $A$ is invertible if and only if $A$ is row equivalent 
  to the identity matrix $I_n$.
]

#proof(card-title-ref(<alternative-characterization-of-invertibility>))[
  Let $A in F^(n times n)$. 
]

== Echelon Forms

#definition[Row Echelon Form][
  A matrix $A in F^(m times n)$ is in *row echelon form (ref)* if it satisfies the following conditions:

  + *Separated.* All nonzero rows are above any rows of all zeros.
  + *Triangular.* The leading entry of each nonzero row (called a *pivot*) is in a column to the right of the leading entry of the previous row.
  + *Zeroed Below.* All entries in a column below a pivot are zeros.
]

#theorem[Existence of Row Echelon Form][
  Every matrix is row equivalent to at least one matrix in row echelon form.
]

#definition[Reduced Row Echelon Form][
  A matrix is in *reduced row echelon form (rref)* if it is in row echelon form and additionally satisfies:

  + *Leading Ones.* The leading entry in each nonzero row is $1$.
  + *Unique Pivots.* Each leading $1$ is the only nonzero entry in its column.
]

#theorem[Existence and Uniqueness of Reduced Row Echelon Form][
  Every matrix is row equivalent to exactly one reduced row echelon form.
]

#terminology(oneline: true)[
  Let $A in F^(m times n)$ be a matrix in row echelon form. 
  A *pivot* is a leading nonzero entry of a nonzero row. 
  A *pivot column* of $A$ is a column that contains a pivot. 
  A *pivot row* of $A$ is a row that contains a pivot.
]

== Row Reduction Algorithms

#algorithm[Gaussian Elimination][
  
]

#definition[LU Factorization][
  An *LU factorization* of a matrix $A$ is a factorization of $A$ into the product of a lower triangular matrix $L$ and an upper triangular matrix $U$, i.e. $A = L U$.
]