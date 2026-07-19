#import "../../../root.typ": *

#show: book-section.with(name: "Polynomials")

== Introduction to Complex Numbers

#notation(oneline: true)[
  The set $FF$ refers to either the field $RR$ or the field $CC$.
]

#definition[Complex Conjugate][
  Let $z = a + b i in CC$ be a complex number, where $a, b in RR$. 
  The *complex conjugate* of $z$, denoted $overline(z)$, is defined as:
  $
    overline(z) = a - b i.
  $
]

#let Re = $op("Re")$
#property[Properties of Complex Numbers][
  - *Double Conjugation.* $overline(overline(z)) = z$.
  - *Distributivity of Conjugation.* 
    $overline(z + w) = overline(z) + overline(w)$ and $overline(z w) = overline(z) thin overline(w)$.
  - *Conjugate of a Quotient.* If $w != 0$, then $overline(z slash w) = overline(z) slash overline(w)$.
  - *Conjugate of a Power.* $overline(z^n) = overline(z)^n$ for all $n in ZZ^+$.
  - *Conjugate of a Real Number.* If $z in RR$, then $overline(z) = z$.
  - *Sum of Conjugates.* $z + overline(z) = 2 Re(z)$.
  - *Product of Conjugates.* $z overline(z) = |z|^2$.
]

#definition[Absolute Value of a Complex Number][
  Let $z = a + b i in CC$ be a complex number, where $a, b in RR$. 
  The *absolute value* or the *modulus* of $z$, denoted $abs(z)$, is defined as:
  $
    abs(z) = sqrt(a^2 + b^2).
  $
]

#property(oneline: true)[
  For all $z = a + b i in CC$, $abs(z)^2 = z overline(z) = a^2 + b^2$.
]

== Introduction to Polynomials

#definition[Polynomial][
  A *polynomial* over a field $F$ with respect to the *indeterminate* $x$ is an expression of the form:
  $
    p(x) = a_n x^n + a_(n-1) x^(n-1) + dots.c + a_1 x + a_0,
  $
  where $n in ZZ^+$ and $a_0, a_1, dots, a_n in F$ are called the *coefficients* of the polynomial.
  The *degree* of the polynomial $p(x)$ is the largest integer $n$ such that $a_n != 0$, 
  denoted $deg(p(x)) = n$.
]

That is, an $n$#th degree polynomial over $F$ with respect to $x$ is a linear combination of
${1, x, x^2, dots, x^n}$ with weights in $F$, constraining the weight of $x^n$ to be nonzero.

#notation(oneline: true)[
  The set of all polynomials over a field $F$ with respect to the indeterminate $x$ is denoted $PP (F; x)$ or $F[x]$.
  The set of all polynomials over a field $F$ with respect to the indeterminate $x$ of degree at most $n$ is 
  denoted $PP_n (F; x)$ or $F_n [x]$. The indeterminate $x$ is often omitted when the context is clear, 
  so we may often write just $PP(F)$ or $PP_n (F)$.
]

#corollary(oneline: true)[
  $PP_n (F)$ is an $(n + 1)$-dimensional vector space over $F$.
]

#definition[Zero of a Polynomial][
  A scalar $alpha in F$ is a *zero* of the polynomial $p in PP(F)$ iff $p(alpha) = 0$.
]

#notation(oneline: true)[
  The set of all polynomials of degree _exactly_ $n$ over a field $F$ is denoted $PP_n^= (F)$.
]

#theorem[Factorization of Polynomials][
  Suppose $p in PP_n^= (F)$ is a polynomial of degree exactly $n$ and $alpha in F$. 
  Then $alpha$ is a zero of $p$ if and only if there exists a polynomial $q in PP_(n-1)^= (F)$ such that:
  $
    p(x) = (x - alpha) q(x).
  $
]

== Characteristic Polynomials

#definition[Characteristic Polynomial][
  Let $T: V -> V$ be a linear map on an $n$-dimensional vector space $V$ over a field $F$. 
  The *characteristic polynomial* $chi$ of $T$ is defined as:
  $
    chi(lambda) = det(lambda id_V trueminus T) = det(lambda I_n - [T]_(cal(B) cal(B))),
  $
  where $I_n$ is the $n times n$ identity matrix and $cal(B)$ is any basis for $V$.
]

== Polynomials Applied to Operators

#theorem[Cayley-Hamilton Theorem][
  Let $T: V -> V$ be a linear operator on a finite-dimensional vector space $V$. 
  Then the characteristic polynomial $chi$ of $T$ annihilates $T$, i.e.:
  $
    chi(T) = 0.
  $
]

== Minimal Polynomials