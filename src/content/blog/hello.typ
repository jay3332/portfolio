#import "../root.typ": *

#show: blog-post.with(title: "Test Blog", date: "2026-05-10")
#show math.equation: x => box(html.frame(x))

= hi

hi this is blog

#stack(
  line(length: 100%, stroke: 1.0pt),
  line(length: 100%, stroke: 1.0pt),
  spacing: 2pt,
)

#show math.equation.where(block: true): eq => {
  block(width: 100%, inset: 0pt, align(center, eq))
}

#set enum(numbering: "1.a.")

+ Prove that for all integers $n$, $k$, and $r$ for $r <= k <= n$ that:
  $
    binom(n, k) dot binom(k, r) = binom(n, r) dot binom(n - r, k - r).
  $

#line(length: 100%, stroke: 0.5pt)

_Proof._

  *Lemma 1.* The factorial expansion of $binom(n, r)$ is: <lemma-1>
  $
    binom(n, r) = n!/(r! (n - r)!).
  $

  By #link(<lemma-1>)[Lemma 1], we can rewrite the left-hand side of the equation as follows:
  $
    binom(n, k) dot binom(k, r) 
    &= (n!/(k! (n - k)!)) dot (k!/(r! (k - r)!)) \
    &= (n! k!)/(k! r! (n - k)! (k - r)!) \
    &= n!/(r! (n - k)! (k - r)!).
  $

  By #link(<lemma-1>)[Lemma 1], we can rewrite the right-hand side of the equation as follows:
  $
    binom(n, r) dot binom(n - r, k - r) 
    &= (n!/(r! (n - r)!)) dot ((n - r)!/((k - r)! ((n - r) - (k - r))!)) \
    &= (n! (n - r)!)/(r! (n - r)! (k - r)! ((n - r) - (k - r))!) \
    &= n!/(r! (k - r)! (n - k)!).
  $

  Since multiplication is commutative under $ZZ$, we have:
  $
    n!/(r! (n - k)! (k - r)!) = n!/(r! (k - r)! (n - k)!).
  $
  Thus, the LHS and RHS of the equation are equal, so $display(binom(n, k) dot binom(k, r) = binom(n, r) dot binom(n - r, k - r))$. $qed$


#pagebreak()

2. The binomial theorem states that for any numbers $a$ and $b$:
  $
    (a + b)^n = sum_(k = 0)^n binom(n, k) a^(n - k) b^k "for any integer" n >= 0.
  $
  Use this theorem to show that for any integer $n >= 0$:
  $
    sum_(k = 0)^n (-1)^k binom(n, k) 3^(n - k) 2^k = 1.
  $
#line(length: 100%, stroke: 0.5pt)

_Proof._ By the binomial theorem, we have:
  $
    (3 - 2)^n = sum_(k = 0)^n binom(n, k) 3^(n - k) (-2)^k.
  $
  Since $3 - 2 = 1$, we have:
  $
    1^n = sum_(k = 0)^n binom(n, k) 3^(n - k) (-2)^k.
  $
  Since $1^n = 1$ for all integers $n >= 0$, we have:
  $
    sum_(k = 0)^n binom(n, k) 3^(n - k) (-2)^k = 1.
  $
  Since $(-2)^k = (-1)^k dot 2^k$ for all integers $k >= 0$, we have:
  $
    sum_(k = 0)^n binom(n, k) 3^(n - k) (-1)^k dot 2^k = sum_(k = 0)^n (-1)^k binom(n, k) 3^(n - k) dot 2^k.
  $
  Thus, we have shown that:
  $
    sum_(k = 0)^n (-1)^k binom(n, k) 3^(n - k) 2^k = 1. #h(1em) qed
  $



时间差 $ Delta t = (4 A Omega) / c^2 $
将此时间差与光程差联系起来：$ Delta L = c Delta t = (4 A Omega) / c $
又 $f = display(c / lambda)$，对于周长为 P 的激光腔，谐振频率是 $display(c / P)$ 的整数倍。由于光程变化 $Delta L$ 引起的频率变化 $Delta f$ 可近似为 $ |(Delta f) / f| approx |Delta L / P|. $
代入 $Delta L$，得到 $ |Delta f| approx (f / P) times (4 A Omega / c) $

又 $f approx display(c / lambda)$，有$ |Delta f| approx (c / (lambda P)) times (4 A Omega / c) = (4 A) / (lambda P) Omega. $
这个拍频 $Delta f$ 就是环形激光陀螺中测量的量。记前面的系数 $display((4 A) / (lambda P) = S)$ 即为激光陀螺的标度因数。

=== How to insert an image

To insert an image here for html output, you need the experimental functions from `#html`: https://typst.app/blog/2025/typst-0.13/#a-first-look-at-html-export

There are two ways to insert the same image:

\


Note: The file is converted into html format. For more details, refer to the setting in `astro.config.mts`.

= Eigenproof

Suppose a matrix $A$ has distinct eigenvalues $lambda_1, lambda_2, ..., lambda_n$.  \
Let $bf(v)_i$ be an eigenvector for $lambda_i$, so $A bf(v)_i = lambda_i bf(v)_i$.

Assume for the sake of contradiction that the set ${bf(v)_1, bf(v)_2, ..., bf(v)_n}$ is linearly dependent. Then, there exists some $bf(v)_j$ ($1 < j <= n$) such that $bf(v)_j$ can be written as a linear combination of its preceding eigenvectors:
$
  bf(v)_j &= c_1 bf(v)_1 + c_2 bf(v)_2 + ... + c_(j - 1) bf(v)_(j - 1)
$
Then:
$
  A bf(v)_j &= A(c_1 bf(v)_1 + c_2 bf(v)_2 + ... + c_(j - 1) bf(v)_(j - 1)) & #h(1em) "by left-multiplying both sides by" A \
  A bf(v)_j &= c_1 A bf(v)_1 + c_2 A bf(v)_2 + ... + c_(j - 1) A bf(v)_(j - 1) & #h(1em) "by distributing" A "on the rhs" \
  lambda_j bf(v)_j &= c_1 lambda_1 bf(v)_1 + c_2 lambda_2 bf(v)_2 + ... + c_(j - 1) lambda_(j - 1) bf(v)_(j - 1) #h(1em) & "by performing the substitution" A bf(v)_i = lambda_i bf(v)_i
$
Also:
$
  lambda_j bf(v)_j &= lambda_j (c_1 bf(v)_1 + c_2 bf(v)_2 + ... + c_(j - 1) bf(v)_(j - 1)) & #h(1em) "by multiplying both sides by" lambda_j \
  lambda_j bf(v)_j &= c_1 lambda_j bf(v)_1 + c_2 lambda_j bf(v)_2 + ... + c_(j - 1) lambda_j bf(v)_(j - 1) #h(1em) & "by distributing" lambda_j "on the rhs" 
$
Finally, equate the two expressions for $lambda_j bf(v)_j$:
$
  c_1 lambda_1 bf(v)_1 + c_2 lambda_2 bf(v)_2 + ... + c_(j - 1) lambda_(j - 1) bf(v)_(j - 1) &= c_1 lambda_j bf(v)_1 + c_2 lambda_j bf(v)_2 + ... + c_(j - 1) lambda_j bf(v)_(j - 1)  \
  c_1 (lambda_1 - lambda_j) bf(v)_1 + c_2 (lambda_2 - lambda_j) bf(v)_2 + ... + c_(j - 1) (lambda_(j - 1) - lambda_j) bf(v)_(j - 1) &= bf(0).
$
However, all $lambda_i$ are distinct, so $lambda_a - lambda_b != 0$ for $a != b$. Thus, the above equation can only be satisfied if $c_1 = c_2 = ... = c_(j - 1) = 0$, which contradicts our assumption that $bf(v)_j$ is a linear combination of its preceding eigenvectors. Therefore, the set ${bf(v)_1, bf(v)_2, ..., bf(v)_n}$ must be linearly independent. $qed$