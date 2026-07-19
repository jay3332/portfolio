#import "../../../root.typ": *

#show: book-section.with(name: "Cofactor Expansion and Cramer's Rule")

== Cofactor Expansion

#definition[Cofactor Matrix][
  Let $A in F^(n times n)$ be a square matrix. For any $i, j in [n]$, the *minor* of $A$ corresponding to the entry $a_(i j)$, denoted $m_(i j)$, is the determinant of the $(n-1) times (n-1)$ 
  matrix $A_(i j)$ obtained by deleting the $i$#th row and $j$#th column of $A$:
  $
    m_(i j) = det(A_(i j)).
  $
  The *cofactor matrix* $C$ of $A$ is the $n times n$ matrix whose $(i, j)$#th entry is the 
  *cofactor* $c_(i j)$, defined by:
  $
    c_(i j) = (-1)^(i+j) m_(i j) = (-1)^(i+j) det(A_(i j)).
  $
]

#theorem[Cofactor Expansion Theorem][
  Fix the determinant of a $1 times 1$ matrix $display(det(mat(a_11))) = a$.
  Let $A in F^(n times n)$ be a square matrix for $n >= 2$, and let $C = (c_(i j))$ be its cofactor matrix. 
  Then the determinant of $A$ can be computed by either recursive formula:

  - *Expansion Along the $bold(i)$#th Row.* $
      det(A) = sum_(j=1)^n a_(i j) c_(i j) = sum_(j=1)^n a_(i j) (-1)^(i+j) det(A_(i j)) 
      "for any fixed" i in [n].
    $
  - *Expansion Along the $bold(j)$#th Column.* $
      det(A) = sum_(i=1)^n a_(i j) c_(i j) = sum_(i=1)^n a_(i j) (-1)^(i+j) det(A_(i j)) 
      "for any fixed" j in [n].
    $
]