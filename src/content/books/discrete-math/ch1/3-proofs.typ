#import "../../../root.typ": *
#import "@preview/curryst:0.6.0" as curryst

#show: book-section.with(
  name: "Arguments and Proofs",
  numbering-depth: 3,
)

#let ttrue = $sans("T")$
#let ffalse = $sans("F")$

#let rule(
  label: "",
  name: "",
  ..args,
) = if x-target == "web" {
  let premises = args.pos().slice(0, -1).join($quad$)
  let conclusion = args.pos().at(-1)
  let base = $display(frac(premises, conclusion))$

  base = if label != "" {
    $#label thin base$
  } else { base }

  base = if name != "" {
    $base thin #name$
  } else { base }
 
  base
} else {
  curryst.rule(label: label, name: name, ..args)
}

#let rule-tree(rule) = if x-target == "web" {
  $ rule $
} else {
  $ curryst.prooftree(rule) $
}

== Introduction to Proofs

#definition[Argument][
  An *argument* is a sequence of propositions $P_1, P_2, ..., P_n$ such that the last proposition $P_n$ is called the *conclusion* of the argument, and the preceding propositions $P_1, P_2, ..., P_(n-1)$ are called the *premises* of the argument.
]

#notation[Therefore Symbol][
  The conclusion of an argument can be separated from the premises by the symbol ($therefore$):
  $
    P_1, P_2, ..., P_(n-1) therefore P_n
  $
]

#definition[Valid and Sound Arguments][
  An argument is *valid* iff, for all truth assignments $sigma$, $sigma tack.double P_i$ for all premises $P_i$ implies $sigma tack.double P_n$ for the conclusion $P_n$.
  Otherwise, the argument is *invalid*.

  An argument is *sound* iff it is valid and all its premises are true. Otherwise, the argument is *unsound*.
]

#definition[Proof][
  A *proof* of a proposition $P$ is a sound argument whose conclusion is $P$.
]

=== Proof Trees 

To represent proofs, we can use *proof trees*, which are tree diagrams that represent the structure of an argument.

#remark(oneline: true)[
  Proof trees are an informal extension of the _sequent calculus_, which will be covered later.
]

#notation[Proof Tree for a Valid Argument][
  If the conclusion $P_n$ is derived from the premises $P_1, P_2, ..., P_(n-1)$, then the proof tree for this argument is:
  $
    #rule-tree(rule(
      $P_1$,
      $P_2$,
      $dots.c$,
      $P_(n-1)$,
      $P_n$
    ))
  $
  We can also label the rule with a name or reasoning:
  $
    #rule-tree(rule(
      name: "(Common Sense)",
      $P_1$,
      $P_2$,
      $dots.c$,
      $P_(n-1)$,
      $P_n$
    ))
  $
]

=== Methods of Proof


#definition[Modus Ponens][
  Under some truth assignment $sigma$, if $sigma tack.double P$ and $sigma tack.double (P => Q)$, then $sigma tack.double Q$:
  $
    #rule-tree(rule(
      name: "(Modus Ponens)",
      $P => Q$,
      $P$,
      $Q$
    ))
  $ 
  This is often called a *direct proof* of $Q$ from $P$.
]

#definition[Modus Tollens][
  Under some truth assignment $sigma$, if $sigma tack.double not Q$ and $sigma tack.double (P => Q)$, then $sigma tack.double not P$:
  $
    #rule-tree(rule(
      name: "(Modus Tollens)",
      $P => Q$,
      $not Q$,
      $not P$
    ))
  $
  This is often called a *proof by contraposition* of $not P$ from $not Q$.
]

#definition[Proof by Contradiction][
  Under some truth assignment $sigma$, if $sigma tack.double (not P => bot)$, then $sigma tack.double P$:
  $
    #rule-tree(rule(
      name: "(Contradiction)",
      $not P => bot$,
      $P$
    ))
  $
]

#definition[Weak Mathematical Induction][
  Under some truth assignment $sigma$, to prove a predicate $P(n)$ for all $n > n_0$, show that:
  + *Base Case.* $sigma tack.double P(n_0)$.
  + *Inductive Step.* For all $k > n_0$, if $sigma tack.double P(k)$, then $sigma tack.double P(k+1)$.

  The rule for weak induction is as follows:
  $
    #rule-tree(rule(
      name: "(Ind.)",
      $P(n_0)$,
      $forall k > n_0, P(k) => P(k+1)$,
      $forall n > n_0, thin P(n)$,
    ))
  $
]

#definition[Strong Mathematical Induction][
  Under some truth assignment $sigma$, to prove a predicate $P(n)$ for all $n > n_0$, show that:
  + *Base Case.* $sigma tack.double P(n_0)$.
  + *Inductive Step.* For all $k > n_0$, if $sigma tack.double P(j)$ $forall j$ such that $n_0 < j <= k$, then $sigma tack.double P(k + 1)$.

  The rule for strong induction is as follows:
  $
    #rule-tree(rule(
      name: "(Str. Ind.)",
      $P(n_0)$,
      $forall k > n_0, display((and.big_(j = n_0 + 1)^k P(j))) => P(k+1)$,
      $forall n > n_0, thin P(n)$,
    ))
  $
]

== Rules of Inference



#theorem[Rules of Inference for Conjunctions][
  Let $P$ and $Q$ be propositional formulae, and $sigma$ be a truth assignment. Then:
  + *Introduction ($and_"I"$).* If $sigma tack.double P$ and $sigma tack.double Q$, then $sigma tack.double P and Q$.
  + *Right-Elimination ($and_"E"_1$).* If $sigma tack.double P and Q$, then $sigma tack.double P$.
  + *Left-Elimination ($and_"E"_2$).* If $sigma tack.double P and Q$, then $sigma tack.double Q$.
]

#theorem[Rules of Inference for Disjunctions][
  Let $P$ and $Q$ be propositional formulae, and $sigma$ be a truth assignment. Then:
  + *Left-Introduction ($or_"I"_1$).* If $sigma tack.double P$, then $sigma tack.double P or Q$.
  + *Right-Introduction ($or_"I"_2$).* If $sigma tack.double Q$, then $sigma tack.double P or Q$.
  + *Elimination ($or_"E"$).* If $sigma tack.double P or Q$, and if $sigma tack.double R$ whenever $sigma tack.double P$, and if $sigma tack.double R$ whenever $sigma tack.double Q$, then $sigma tack.double R$.
]

#theorem[Rules of Inference for Implications][
  Let $P$ and $Q$ be propositional formulae, and $sigma$ be a truth assignment. Then:
  + *Introduction ($op(=>)_"I"$).* If $sigma(Q) = ttrue$ whenever $sigma(P) = ttrue$, then $sigma(P => Q) = ttrue$.
  + *Modus Ponens ($op(=>)_"E"_1$).* If $sigma(P => Q) = ttrue$ and $sigma(P) = ttrue$, then $sigma(Q) = ttrue$.
  + *Modus Tollens ($op(=>)_"E"_2$).* If $sigma(P => Q) = ttrue$ and $sigma(Q) = ffalse$, then $sigma(P) = ffalse$.
]

#theorem[Rules of Inference for Biconditionals][
  Let $P$ and $Q$ be propositional formulae, and $sigma$ be a truth assignment. Then:
  + *Introduction ($op(<=>)_"I"$).* If $sigma(P) = sigma(Q)$, then $sigma(P <=> Q) = ttrue$.
  + *Right-Elimination ($op(<=>)_"E"_1$).* If $sigma(P <=> Q) = ttrue$ and $sigma(P) = ttrue$, then $sigma(Q) = ttrue$.
  + *Left-Elimination ($op(<=>)_"E"_2$).* If $sigma(P <=> Q) = ttrue$ and $sigma(Q) = ttrue$, then $sigma(P) = ttrue$.
]

== Sequent Calculus and Natural Deduction

#definition[Sequent][

]

== Soundness and Completeness

== Decidability

== Higher-Order Logic