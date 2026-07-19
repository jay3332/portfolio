#import "../../../root.typ": *

#show: book-section.with(name: "Dual Spaces and Dual Maps")

== Dual Spaces

#definition[Linear Functionals and Dual Spaces][
  Let $V$ be a vector space over a field $F$. A *linear functional* on $V$ is a linear map from $V$ to $F$. 
  The set of all linear functionals on $V$ is called the *dual space* of $V$, denoted $V^*$:
  $
    V^* = cal(L)(V, F).
  $
]

#example(oneline: true)[
  Let $V = RR^2$. Then the dual space of $V$ is $V^* = cal(L)(RR^2, RR)$, which can be described as:
  $
    V^* = {f: RR^2 -> RR suchthat f "is linear"} = {f: RR^2 -> RR suchthat f(x, y) = a x + b y "for some" a, b in RR}.
  $
]

#theorem[Dual Basis][
  Suppose $V$ is a finite-dimensional vector space over a field $F$ and $cal(B) = {bf(v)_1, bf(v)_2, dots.c, bf(v)_n}$ is a basis for $V$. 
  Then there exists a _unique_ set of linear functionals $cal(B)^* = {phi_1, phi_2, dots.c, phi_n}$,
  called the *dual basis* of $cal(B)$, such that:
  $
    cases(
      phi_i (bf(v)_i) = 1 "for all" i,
      phi_i (bf(v)_j) = 0 "for all" i != j,
    )
  $
  where $cal(B)^*$ is a basis for the dual space $V^*$.
]

#corollary[Dimension of Dual Spaces][
  Let $V$ be a finite-dimensional vector space over a field $F$. Then $dim(V^*) = dim(V)$.
]

#corollary[Isomorphism between a Finite-Dimensional Vector Space and its Dual][
  Let $V$ be a finite-dimensional vector space over a field $F$. Then $V tilde.equiv V^*$.
]

#theorem[Dual Basis Theorem][
  Let $cal(B) = {bf(b)_1, dots, bf(b)_n}$ be an ordered basis for a finite-dimensional vector space $V$,
  and suppose $cal(B)^* = {phi_1, dots, phi_n}$ is the dual basis of $cal(B)$. 
  Then for any vector $bf(v) in V$, the $phi_i (bf(v))$ evaluates to the $i$#th coordinate of 
  $bf(v)$ with respect to the basis $cal(B)$. That is:
  $
    bf(v) = sum_(i=1)^n phi_i (bf(v)) bf(b)_i = phi_1 (bf(v)) bf(b)_1 + phi_2 (bf(v)) bf(b)_2 + dots + phi_n (bf(v)) bf(b)_n.
  $
]

#definition[Double Dual][
  Let $V$ be a vector space over a field $F$. The *double dual* of $V$, denoted $V^(**)$, is the dual 
  space of the dual space of $V$:
  $
    V^(**) = (V^*)^* = cal(L)(V^*, F) = cal(L)(cal(L)(V, F), F).
  $
]

/*  There is a natural linear map from $V$ to its double dual, called the *natural isomorphism* $eta_V: V -> V^(**)$, defined by:
  $
    eta_V (bf(v)) = (f |-> f(bf(v))) "for all" bf(v) in V.
  $
  If $V$ is finite-dimensional, then $eta_V$ is an isomorphism, so $V tilde.equiv V^(**)$.*/

#theorem[Natural Isomorphism][
  Let $V$ be a finite-dimensional vector space over a field $F$. Define the linear map
  $eta: V -> V^(**)$ by:
  $
    eta(bf(v)) = (phi |-> phi(bf(v))) "for all" bf(v) in V.
  $
  It holds that $eta$ is an isomorphism, so $V tilde.equiv V^(**)$.
]

== Dual Maps

#definition[Dual Map][
  Let $T: V -> W$ be a linear map. The *dual map* of $T$, denoted $T^*$, 
  is the map $T^*: W^* -> V^*$ defined for all $phi in W^*$ by:
  $
    T^*(phi) = phi compose T.
  $
]

#proposition[Dual Map is Linear][
  Let $T: V -> W$ be a linear map. Then its dual map $T^*: W^* -> V^*$ is also a linear map.
]
