#import "../../../root.typ": *

#show: book-section.with(name: "Invariant Subspaces")

== Operators and Invariant Subspaces

#definition[Operator][
  A linear map $T: V -> V$ on a vector space $V$ is called an *operator* on $V$.
  The set of all operators on $V$ is denoted $cal(L)(V)$.
]

#definition[Invariant Subspace][
  Let $T in cal(L)(V)$ be an operator on a vector space $V$. A subspace $W subset.eq V$ is *invariant* under $T$ iff:
  $
    T(W) subset.eq W.
  $
  That is, for all $bf(w) in W$, we have $T(bf(w)) in W$.
]

== Eigenvalues and Eigenvectors

#definition[Eigenvalues and Eigenvectors of Linear Maps][
  Let $T: V -> V$ be a linear map on a vector space $V$ over a field $F$. A scalar $lambda in F$ 
  is called an *eigenvalue* of $T$ if there exists vector $bf(v) in V$ with $bf(v) != bf(0)$ such that:
  $
    T(bf(v)) = lambda bf(v),
  $
  in which case, the vector $bf(v)$ is called an *eigenvector* of $T$ corresponding to the eigenvalue $lambda$.
]

#example(oneline: true)[
  Let $T: RR^2 -> RR^2$ be the linear map defined by $T(x, y) = (2x + y, x + 2y)$.
  Then $lambda = 3$ is an eigenvalue of $T$ because the vector $bf(v) = (1, 1)$ satisfies:
  $
    T(bf(v)) = T(1, 1) = (2 dot 1 + 1, 1 + 2 dot 1) = (3, 3) = 3 (1, 1) = lambda bf(v).
  $
]

#definition[Eigenvalues and Eigenvectors of Matrices][
  Let $A in F^(n times n)$ be a square matrix. A scalar $lambda in F$ is called an
  *eigenvalue* of $A$ if there exists vector $bf(v) in F^n$ with $bf(v) != bf(0)$ 
  such that:
  $
    A bf(v) = lambda bf(v),
  $
  in which case, the vector $bf(v)$ is called an *eigenvector* of $A$ corresponding to the eigenvalue $lambda$.
]

#example(oneline: true)[
  Let $A = display(rmat(2, 1; 1, 2)) in RR^(2 times 2)$. Then $lambda = 3$ is an eigenvalue of $A$ because the vector $bf(v) = display(rmat(1; 1))$ satisfies:
  $
    A bf(v) = display(rmat(2, 1; 1, 2)) display(rmat(1; 1)) 
     = display(rmat(3; 3)) = 3 display(rmat(1; 1)) = lambda bf(v).
  $
]

#theorem[Alternative Characterization of Eigenvalues][
  Let $T: V -> V$ be a linear map on a vector space $V$ over a field $F$. 
  A scalar $lambda in F$ is an eigenvalue of $T$ iff the linear map $T - lambda id_V$ 
  is not invertible.
]

== Trace

#definition[Trace of a Square Matrix][
  Let $A in F^(n times n)$ be a square matrix. The *trace* of $A$, denoted $tr(A)$, 
  is the sum of the entries on the main diagonal of $A$:
  $
    tr mat(
      a_(1 1), a_(2 2), dots.c, a_(n n);
      a_(2 1), a_(2 2), dots.c, a_(2 n);
      dots.v, dots.v, dots.down, dots.v;
      a_(n 1), a_(n 2), dots.c, a_(n n)
    ) = a_(1 1) + a_(2 2) + dots.c + a_(n n) = sum_(i = 1)^n a_(i i).
  $
]

#theorem[Cyclic Property of the Trace][
  Let $A in F^(m times n)$ and $B in F^(n times m)$. Then:
  $
    tr(A B) = tr(B A).
  $
]

#definition[Trace of a Linear Map][
  Let $T: V -> V$ be a linear map on a finite-dimensional vector space $V$ over a field $F$,
  and suppose $cal(B)$ and $cal(C)$ are any bases for $V$. 
  The *trace* of $T$, denoted $tr(T)$, is the trace of the standard matrix $[T]_(cal(C) cal(B))$:
  $
    tr(T) = tr([T]_(cal(C) cal(B))).
  $
]

#proposition(ref: <trace-independence>)[Trace Independence][
  The trace of a linear map $T: V -> V$ is independent of the choice of bases for $V$.
]

#proof(card-prefix-ref(<trace-independence>))[
  Let $T: V -> V$ be a linear map on a finite-dimensional vector space $V$ over a field $F$,
  and let $cal(B)$ and $cal(C)$ be any bases for $V$. 
  Let $P = [id_V]_(cal(C) cal(B))$ be the change-of-basis matrix from the basis $cal(B)$ to the basis $cal(C)$.
  Then:
  $
    [T]_(cal(C) cal(B)) = P^(-1) [T]_(cal(B) cal(B)) P.
  $
  By the cyclic property of the trace, we have:
  $
    tr([T]_(cal(C) cal(B))) = tr(P^(-1) [T]_(cal(B) cal(B)) P) = tr([T]_(cal(B) cal(B)) P P^(-1)) = tr([T]_(cal(B) cal(B))).
  $
  Therefore, $tr(T)$ is independent of the choice of bases for $V$.
]

#theorem[Trace of a Linear Map is the Sum of its Eigenvalues][
  Let $T: V -> V$ be a linear map on a finite-dimensional vector space $V$ over a field $F$,
  and let $lambda_1, lambda_2, dots, lambda_n$ be the eigenvalues of $T$, counted with multiplicity. 
  Then:
  $
    tr(T) = sum_(i = 1)^n lambda_i.
  $
]

== Exercises

#exercise(oneline: true)[
  Suppose $A in F^(2 times 2)$. Show that if $tr(A) = 0$, then $A^2 = k I_2$ for some $k in F$.
]

#exercise(oneline: true)[
  #set enum(numbering: "a.", indent: 1.33em)
  Let $tr_n$ denote the trace function constrained to $F^(n times n)$. 
  + Show that $tr_n: F^(n times n) -> F$ is a linear map.
  + Find $ker(tr_n)$ and $nullity(tr_n)$.
  + #set par(hanging-indent: 0pt)
    Let $cal(B)_n$ be a basis for $F^(n times n)$ defined by $cal(B)_n = {E_(i j) in F^(n times n) suchthat 1 <= i, j <= n}$,
    where $E_(i j)$ is the matrix with $1$ in the $(i, j)$#th entry and $0$ elsewhere. For example, when $n = 2$:
    $
      cal(B)_2 = {E_(1 1), E_(1 2), E_(2 1), E_(2 2)} = {mat(1, 0; 0, 0), mat(0, 1; 0, 0), mat(0, 0; 1, 0), mat(0, 0; 0, 1)}.
    $
    Find $display([tr_n]_(cal(E)_1 cal(B)_n))$, the standard matrix of $tr_n$ with respect to the basis $cal(B)_n$ 
    and the standard basis $cal(E)_1 = {1}$ for $F$.
]
