#import "../../../root.typ": *

#show: book-section.with(name: "Inner Products and Norms")

== Properties of Inner Products and Norms

#definition(ref: <inner-product-space>)[Inner Product Space][
  An *inner product space* is a vector space $V$ over $FF$ equipped with a function
  $ang(dot, dot): V times V -> FF$ called the *inner product* that satisfies the following
  properties for all vectors $bf(u), bf(v), bf(w) in V$ and scalars $alpha, beta in FF$:
  
  + *Non-Negativity.* $ang(bf(v), bf(v)) >= 0$.
  + *Positive-Definiteness.* $ang(bf(v), bf(v)) = 0$ iff $bf(v) = bf(0)$.
  + *Conjugate Symmetry.* $ang(bf(u), bf(v)) = overline(ang(bf(v), bf(u)))$.
  + *Linearity in the First Argument.*
    $ang(alpha bf(u) + beta bf(v), bf(w)) = alpha ang(bf(u), bf(w)) + beta ang(bf(v), bf(w))$.
]

#note(oneline: true)[
  For an inner product space over $RR$, since $overline(alpha) = alpha$ for all scalars $alpha$,
  conjugate symmetry implies actual *symmetry*, i.e. $ang(bf(u), bf(v)) = ang(bf(v), bf(u))$.
]

#theorem(ref: <sesquilinearity>)[Sesquilinearity of Inner Products][
  Let $V$ be an inner product space over $FF$. Then for all vectors $bf(u), bf(v), bf(w) in V$ and scalars $alpha, beta in FF$, the inner product $ang(dot, dot)$ is *sesquilinear*, i.e., it is 
  linear in the first argument and _conjugate-linear_ in the second argument:
  $
    ang(bf(u), alpha bf(v) + beta bf(w)) = overline(alpha) ang(bf(u), bf(v)) + overline(beta) ang(bf(u), bf(w)).
  $
]

#proof(card-prefix-ref(<sesquilinearity>))[
  Let $V$ be an inner product space over $FF$, and let $bf(u), bf(v), bf(w) in V$ and $alpha, beta in FF$. Then:
  $
    ang(bf(u), alpha bf(v) + beta bf(w)) &= overline(ang(alpha bf(v) + beta bf(w), bf(u)))
    && "by conjugate symmetry" \
    &= overline(alpha ang(bf(v), bf(u)) + beta ang(bf(w), bf(u))) && "by linearity in the first argument" \
    &= overline(alpha) thin overline(ang(bf(v), bf(u))) + overline(beta) thin overline(ang(bf(w), bf(u)))
    && "by distributivity of conjugation" \
    &= overline(alpha) ang(bf(u), bf(v)) + overline(beta) ang(bf(u), bf(w)) && "by conjugate symmetry,"
  $
  as desired. #proof-qed
]

#note(oneline: true)[
  For an inner product space over $RR$, since $alpha = overline(alpha)$ for all scalars $alpha$, 
  sesquilinearity implies *bilinearity*, i.e. linearity in both arguments:
  $
    ang(bf(u), alpha bf(v) + beta bf(w)) = alpha ang(bf(u), bf(v)) + beta ang(bf(u), bf(w))
    "for" alpha, beta in RR.
  $
]

#property[Inner Products with Zero Vectors][
  Let $V$ be an inner product space over $FF$. Then for all vectors $bf(v) in V$:
  $
    ang(bf(0), bf(v)) = ang(bf(v), bf(0)) = 0.
  $
]

#theorem(ref: <cauchy-schwarz>)[Cauchy-Schwarz Inequality][
  Let $V$ be an inner product space over $FF$. Then for all vectors $bf(u), bf(v) in V$:
  $
    abs(ang(bf(u), bf(v)))^2 <= ang(bf(u), bf(u)) thin ang(bf(v), bf(v)).
  $
  See also: _#card-title-ref(<cauchy-schwarz-restatement>)_.
]

#proof(card-title-ref(<cauchy-schwarz>))[
  Let $V$ be an inner product space over $FF$, and let $bf(u), bf(v) in V$. 
  If $bf(v) = bf(0)$, then $ang(bf(u), bf(v)) = ang(bf(u), bf(0)) = 0$ , 
  so the inequality holds trivially. Now suppose $bf(v) != bf(0)$. Then:
  
]

#theorem[Cauchy-Schwarz Equality][
  Let $V$ be an inner product space over $FF$. Then for all vectors $bf(u), bf(v) in V$, 
  equality holds in the Cauchy-Schwarz inequality if and only if $bf(u)$ is a scalar multiple of $bf(v)$:
  $
    abs(ang(bf(u), bf(v)))^2 = ang(bf(u), bf(u)) thin ang(bf(v), bf(v))
    "if and only if" bf(u) = alpha bf(v) "for some" alpha in FF.
  $
]

#definition(ref: <normed-vector-space>)[Normed Vector Space][
  A *normed vector space* is a vector space $V$ over $FF$ equipped with a function \
  $norm(dot): V -> RR$ called the *norm* that satisfies the following properties for all vectors $bf(v), bf(w) in V$ and scalars $alpha in F$:
  
  + *Non-Negativity.* $norm(bf(v)) >= 0$.
  + *Positive-Definiteness.* $norm(bf(v)) = 0$ iff $bf(v) = bf(0)$.
  + *Absolute Homogeneity.* $norm(alpha bf(v)) = abs(alpha) norm(bf(v))$.
  + *Triangle Inequality.* $norm(bf(v) + bf(w)) <= norm(bf(v)) + norm(bf(w))$.
]

== Norms Induced by Inner Products

#definition(ref: <induced-norm>)[Induced Norm][
  Given an inner product space $V$ over $FF$ with inner product $ang(dot, dot)$, 
  the norm *induced* by the inner product $ang(dot, dot)$, called the *induced norm* or *canonical norm*, 
  is the function $norm(dot): V -> RR$ defined by: 
  $
    norm(bf(v)) = sqrt(ang(bf(v), bf(v))).
  $
]

#corollary(oneline: true)[
  All inner product spaces over $FF$ are normed vector spaces, whose
  norms are induced by #card-prefix-ref(<induced-norm>).
]

Using the induced norm, we can restate #card-prefix-ref(<cauchy-schwarz>) in terms of norms as follows:

#note(ref: <cauchy-schwarz-restatement>)[Restatement of the Cauchy-Schwarz Inequality][
  Let $V$ be an inner product space with induced norm $norm(dot)$. Then $forall bf(u), bf(v) in V$:
  $
    abs(ang(bf(u), bf(v))) <= norm(bf(u)) norm(bf(v)).
  $
]

#theorem(ref: <induced-norm-validity>)[Validity of the Induced Norm][
  Let $V$ be an inner product space over $FF$ with inner product $ang(dot, dot)$. 
  Then the induced norm $norm(dot)$ is a valid norm on $V$, i.e., it satisfies all four properties of a norm.
]

#context proof(card-title-ref(<induced-norm-validity>))[
  Let $V$ be an inner product space over $FF$ with inner product $ang(dot, dot)$, and 
  let $norm(dot) = sqrt(ang(dot, dot))$ be the induced norm on $V$. Then for all vectors 
  $bf(v), bf(w) in V$ and scalars $alpha in FF$:

  + *Non-Negativity.* $ang(bf(v), bf(v)) >= 0$, so $norm(bf(v)) = sqrt(ang(bf(v), bf(v))) >= 0$.
  + *Positive-Definiteness.* $ang(bf(v), bf(v)) = 0$ 
    iff $bf(v) = bf(0)$, so $norm(bf(v)) = sqrt(ang(bf(v), bf(v))) = sqrt(0) = 0$ iff $bf(v) = bf(0)$.
  + *Absolute Homogeneity.*
    $
      norm(alpha bf(v)) &= sqrt(ang(alpha bf(v), alpha bf(v))) && "by definition of the induced norm" \
      &= sqrt(alpha overline(alpha) ang(bf(v), bf(v))) && "by sesquilinearity" \
      &= sqrt(abs(alpha)^2 ang(bf(v), bf(v))) && "by properties of complex numbers" \
      &= abs(alpha) sqrt(ang(bf(v), bf(v))) && "by properties of square roots" \
      &= abs(alpha) norm(bf(v)) && "by definition of the induced norm".
    $
  + *Triangle Inequality.*
    $
      norm(bf(v) + bf(w))^2 &= ang(bf(v) + bf(w), bf(v) + bf(w)) && "by definition of the induced norm" \
      &= ang(bf(v), bf(v)) + ang(bf(v), bf(w)) + ang(bf(w), bf(v)) + ang(bf(w), bf(w)) && "by sesquilinearity" \
      &= ang(bf(v), bf(v)) + ang(bf(v), bf(w)) + overline(ang(bf(v), bf(w))) + ang(bf(w), bf(w)) && "by conjugate symmetry" \
      &= ang(bf(v), bf(v)) + 2 Re(ang(bf(v), bf(w))) + ang(bf(w), bf(w)) && "by properties of complex conjugates" \
      &<= ang(bf(v), bf(v)) + 2 abs(ang(bf(v), bf(w))) + ang(bf(w), bf(w)) && "by properties of complex numbers" \
      &<= ang(bf(v), bf(v)) + 2 norm(bf(v)) norm(bf(w)) + ang(bf(w), bf(w)) && "by the" #card-title-ref(<cauchy-schwarz>, ctx: false) \
      &= norm(bf(v))^2 + 2 norm(bf(v)) norm(bf(w)) + norm(bf(w))^2 && "by definition of the induced norm" \
      &= (norm(bf(v)) + norm(bf(w)))^2 && "by factorization".
    $
    Taking the square root of both sides, we have:
    $
      norm(bf(v) + bf(w)) <= norm(bf(v)) + norm(bf(w)) quad "as desired".
    $

  Thus, the induced norm $norm(dot)$ satisfies the four axiomatic properties of a norm. #proof-qed
]

== Distance and Metric Spaces

#definition(ref: <metric-space>)[Metric Space][
  A *metric space* is a set $X$ equipped with a function $d: X times X -> RR$ called the *metric* or
  *distance function* that satisfies the following properties for all points $x, y, z in X$:
  
  + *Non-Negativity.* $d(x, y) >= 0$.
  + *Positive-Definiteness.* $d(x, y) = 0$ iff $x = y$.
  + *Symmetry.* $d(x, y) = d(y, x)$.
  + *Triangle Inequality.* $d(x, z) <= d(x, y) + d(y, z)$.
]

#definition(ref: <induced-metric>)[Induced Metric][
  Given a normed vector space $V$ over $FF$ with norm $norm(dot)$, 
  the metric *induced* by the norm $norm(dot)$, called the *induced metric*, is the function 
  $d: V times V -> RR$ defined by:
  $
    d(bf(u), bf(v)) = norm(bf(u) - bf(v)).
  $
  We call $d(bf(u), bf(v))$ the *distance* between the vectors $bf(u)$ and $bf(v)$.
]

#corollary(oneline: true)[
  All normed vector spaces are metric spaces, whose metric is induced 
  by #card-prefix-ref(<induced-metric>). Thus, all inner product spaces are metric spaces, 
  whose metric is induced by the norm induced by the inner product.
]

#important(oneline: true)[
  All inner product spaces are normed vector spaces, which are all metric spaces.
]

#theorem(ref: <induced-metric-validity>)[Validity of the Induced Metric][
  Let $V$ be a normed vector space over $FF$ with norm $norm(dot)$. 
  Then the induced metric $d$ is a valid metric on $V$, i.e., it satisfies all four properties of a metric.
]

== Special Inner Products and Norms

#definition(ref: <dot-product>)[Dot Product][
  Let $V = FF^n$ be the vector space of $n$-tuples over a field $FF$. 
  The *dot product* is the function $ang(dot, dot): V times V -> FF$ defined by:
  $
    ang(bf(u), bf(v)) = sum_(i=1)^n u_i overline(v_i),
  $
  where $bf(u) = (u_1, u_2, dots, u_n)$ and $bf(v) = (v_1, v_2, dots, v_n)$.
]

#terminology(oneline: true)[
  For $V = CC^n$, the dot product is also called the *Hermitian inner product*.
]

#notation(oneline: true)[
  The notation $bf(u) dot bf(v)$ can be used to emphasize that the dot product 
  is being used as the inner product.
]

#proposition(oneline: true)[
  The dot product is an inner product on $FF^n$.
]

#definition(ref: <p-norm>)[$p$-Norm][
  Let $V = FF^n$ be the vector space of $n$-tuples over $FF$. 
  For any $p in RR_(>= 1)$, the *$bold(p)$-norm* (or $L^p$-norm) is the function $norm(dot)_p: V -> RR$ defined by:
  $
    norm(bf(v))_p = (sum_(i=1)^n |v_i|^p)^(1 slash p),
  $
  where $bf(v) = (v_1, v_2, dots, v_n)$.
]

#proposition(oneline: true, ref: <valid-p-norm>)[
  For all $p >= 1$, the $p$-norm is a valid norm on $FF^n$.
]

#proposition(oneline: true, ref: <invalid-p-norm>)[
  Extend the function $norm(dot)_p$ from #card-prefix-ref(<p-norm>) 
  to accept $0 < p < 1$. Then for all $0 < p < 1$, $norm(dot)_p$ is #underline[not] a valid norm on $FF^n$.
]

#proof-sketch(card-prefix-ref(<invalid-p-norm>), oneline: true)[
  Show that the triangle inequality does not hold for $norm(dot)_p$ when $0 < p < 1$.
]

#terminology(oneline: true)[The $2$-norm is also called the *Euclidean norm*.]

#definition(ref: <oo-norm>)[Maximum Norm][
  Let $V = FF^n$ be the vector space of $n$-tuples over $FF$.
  The *maximum norm* (or $L^oo$-norm) is the function $norm(dot)_oo: V -> RR$ defined by:
  $
    norm(bf(v))_oo = max_(1 <= i <= n) |v_i|,
  $
  where $bf(v) = (v_1, v_2, dots, v_n)$.
]

#proposition(oneline: true)[
  For all $bf(v) in FF^n$, $display(norm(bf(v))_oo = lim_(p -> oo) norm(bf(v))_p)$.
]

// #definition(ref: <frobenius-norm>)[Frobenius Norm (Matrix Norm)][
//   Let $V = FF^(m times n)$ be the vector space of $m times n$ matrices over a field $FF$. 
//   The *Frobenius norm* is the function $norm(dot)_cal(F): V -> RR$ defined by:
//   $
//     norm(A)_cal(F) = sqrt(sum_(i=1)^m sum_(j=1)^n abs(a_(i j))^2),
//   $
//   where $A in FF^(m times n)$ and $a_(i j)$ is the $(i, j)$#th entry of $A$.
// ]

== Exercises

#exercise[Inner Product of Functions][
  Let $V = C_[a, b](FF)$ be the vector space of continuous functions from a closed interval $[a, b] subset.eq RR$ to a field $FF$. 
  Define a function $ang(dot, dot): V times V -> FF$ by:
  $
    ang(f, g) = integral_a^b f(x) overline(g(x)) dd(x),
  $
  where $f, g in C_[a, b](FF)$. Show that $ang(dot, dot)$ is an inner product on $V$.
]

#exercise(oneline: true)[
  Show that for all functions $f in C_[a, b](RR)$ with $b - a <= 1$, we have:
  $
    (integral_a^b f(x) dd(x))^2 <= integral_a^b (f(x))^2 dd(x).
  $
]

#exercise(oneline: true)[Prove _#card-prefix-ref(<invalid-p-norm>)_.]