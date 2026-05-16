#import "../root.typ": *

#show: blog-post.with(title: "Test Blog", date: "2026-05-09")

= Hi this is test blog

```rs
/// Extract all snowflake IDs surrounded by <@!? and >, called mentions, from a string.
#[must_use]
pub fn extract_mentions(s: &str) -> Vec<u64> {
    static REGEX: OnceLock<Regex> = OnceLock::new();

    let regex = REGEX.get_or_init(|| Regex::new(r"<@!?(\d+)>").unwrap());
    regex
        .captures_iter(s)
        .map(|c| c.get(1).unwrap().as_str().parse().unwrap())
        .collect::<Vec<_>>()
}
```

== Eigenproof

+ Sets $A$ and $B$ are defined as follows:
  $
    A &= {n in ZZ | n = 8r - 3 "for some integer" r} \
    B &= {m in ZZ | m = 4s + 1 "for some integer" s}.
  $
  + Prove that $A subset.eq B$.
  + Disprove that $B subset.eq A$.

#line(length: 100%, stroke: 0.5pt)

#set enum(numbering: "a.")

+ $A subset.eq B$. _Proof._

  Suppose $x$ is an element of set $A$, so $x = 8r - 3$ for some integer $r$. To prove $A subset.eq B$, we must show that $x$ is also an element of set $B$, so $x = 4s + 1$ for some integer $s$.

  We can rewrite $x$ as follows:
  $
    x = 8r - 3 = 4(2r - 1) + 1.
  $
  If we set $s = 2 r - 1$, then we have $x = 4 s + 1$. $s$ is an integer since $r$ is an integer, and the products and differences of integers are integers. Thus, $x$ is an element of $B$. Since $x$ was an arbitrary element of $A$, we have shown that every element of $A$ is also an element of $B$, so $A subset.eq B$. $qed$

+ $B subset.eq.not A$. _Proof._

  _Lemma: Parity Theorem for Even Integers._ If $x$ is even, then $x + 1$ is odd. \
  _Proof._ If $x$ is even, then $x = 2k$ for some integer $k$. Then $x + 1 = 2k + 1$, so $x + 1$ is odd.

  For the sake of contradiction, suppose $B subset.eq A$. Then for all elements $x in B$, $x in A$.

  Suppose that $s$ is an even integer, which means $s$ is an integer. If we let $x = 4s + 1$, then $x in B$ by satisfying the predicate for $B$.

  Since $x in B$, by the assumption that $B subset.eq A$, we have $x in A$. Thus, there exists some integer $r$ such that $x = 8r - 3$. Equating the expressions for $x$ in terms of $r$ and $s$, we have:
  $
    8r - 3 &= 4s + 1 \
    8r &= 4s + 4 \
    2r &= s + 1.
  $

  Since $s + 1$ can be written as $2r$ for an integer $r$, $s + 1$ is an even integer by the definition of even integers. However, we assumed that $s$ is even. By the Parity Theorem for Even Integers, since $s$ is even, $s + 1$ must be odd.
  
  $s$ cannot be even and odd at the same time. This is a contradiction, so our assumption that $B subset.eq A$ must be false. Thus, $B subset.eq A$ is false. $qed$