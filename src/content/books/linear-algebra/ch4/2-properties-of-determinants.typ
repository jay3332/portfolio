#import "../../../root.typ": *

#show: book-section.with(name: "Properties of Determinants")

#property(oneline: true)[
  For any $A in F^(n times n)$, $det(A^transpose) = det(A)$.
]

#theorem(ref: <det-matrix-product>)[Determinant of a Matrix Product][
  For any $A, B in F^(n times n)$, $det(A B) = det(A) det(B)$.
]

#proof(card-prefix-ref(<det-matrix-product>))[
  
]

#theorem[Determinant of an Invertible Matrix][
  Let $A in F^(n times n)$. Then $A$ is invertible if and only if $det(A) != 0$,
  in which case: $ det(A^(-1)) = 1 / det(A). $
]