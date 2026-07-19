#import "../../../root.typ": *

#show: book-section.with(name: "Zermelo-Fraenkel Set Theory")

== Limitations of Naive Set Theory

#theorem[Russell's Paradox][
  The "set" $R = {x | x in.not x}$ is not well-defined.
]

== Natural Numbers as Sets

#definition[Von Neumann Numerals][
  The von Neumann numeral $N_k$ for a natural number $k$ is defined as the set of all von Neumann numerals less than $k$, or $emptyset$ if $k=0$. Formally:
  $
    N_k = cases(
      emptyset & "if" k = 0,
      {N_0, N_1, ..., N_(k-1)} & "otherwise",
    )
  $
]

#definition[Successor Function][
  The successor function, denoted $"succ"$, is defined as follows:
  $
    "succ"(x) = x union {x}.
  $
]

#theorem[Validity of Successor Function][
  Let $N_k$ be the von Neumann numeral for any $k in NN$. Then:
  $
    "succ"(N_k) = N_(k+1).
  $
]

== Zermelo-Fraenkel Axioms

#definition[Zermelo-Fraenkel Axioms][
  + *Extensionality.* Two sets are equal if and only if they have the same elements:
    $
      forall x thin forall y thin [forall z thin (z in x <=> z in y) => x = y].
    $
  + *Regularity.* 
]