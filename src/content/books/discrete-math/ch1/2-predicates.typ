#import "../../../root.typ": *

#show: book-section.with(
  name: "First-Order Logic",
  numbering-depth: 3,
)

Propositional logic works with _propositions_, which are statements that, as a whole, are assigned either true or false. 

In contrast, *first-order logic* (also known as *predicate logic*) works with _predicates_, which are statements that contain variables and can be true or false depending on the values of those variables. That is, first-order logic extends propositional logic by allowing formulae to depend on variables.

In turn, first-order logic allows us to express statements about objects and their properties, as well as relationships between objects.

== Predicates and Quantifiers

A *predicate* is a function that takes one or more variables as input and returns a propositional formula:

#definition[Predicate][
  A *predicate* is a function $P(x_1, x_2, ..., x_n)$ that takes $n$ variables as input and returns a propositional formula. The variables $x_1, x_2, ..., x_n$ are called the *arguments* of the predicate.
]

#example(oneline: true)[
  Let $P(x)$ be the predicate "$x$ satisfies my special property." A truth assignment $sigma$ over a predicate must now specify, for each possible value of $x$, whether $P(x)$ is true or false. For example, if the domain of $x$ is the set of natural numbers, then $sigma$ must specify whether $P(0)$ is true or false, whether $P(1)$ is true or false, and so on. 
]
#definition[Universal Quantifier][
  The *universal quantifier* $forall$ is a logical operator that takes a variable and a proposition as input and produces a new proposition. The proposition $forall x thin P(x)$ is true if and only if $P(x)$ is true for every possible value of $x$.
]

#definition[Existential Quantifier][
  The *existential quantifier* $exists$ is a logical operator that takes a variable and a proposition as input and produces a new proposition. The proposition $exists x thin P(x)$ is true if and only if there exists at least one value of $x$ such that $P(x)$ is true.
]

#resource[Properties Involving Quantifiers][
  #table(
    columns: (0.8fr, 1.6fr, 2fr),
    stroke: 0pt,
    align: (center + horizon, left, center),
    table.header([], [*Property*], [*Equivalence*]),
    table.hline(stroke: 1pt),
    table.cell(rowspan: 2)[Negation Laws],
    [Negation of $forall$], $not forall x thin phi equiv exists x thin not phi$,
    [Negation of $exists$], $not exists x thin phi equiv forall x thin not phi$,
    table.hline(stroke: 1pt),
    table.cell(rowspan: 4)[Distributivity Laws],
    [Distributivity of $forall$ over $and$], $forall x thin (phi and psi) equiv forall x thin phi and forall x thin psi$,
    [Distributivity of $exists$ over $or$], $exists x thin (phi or psi) equiv exists x thin phi or exists x thin psi$,
    [Non-distributivity of $forall$ over $or$], $forall x thin (phi or psi) equiv.not forall x thin phi or forall x thin psi$,
    [Non-distributivity of $exists$ over $and$], $exists x thin (phi and psi) equiv.not exists x thin phi and exists x thin psi$,
    table.hline(stroke: 1pt),
    table.cell(rowspan: 2)[Commutativity Laws],
    [Commutativity of $forall$], $forall x thin forall y thin phi equiv forall y thin forall x thin phi$,
    [Commutativity of $exists$], $exists x thin exists y thin phi equiv exists y thin exists x thin phi$,
  )
]

== Well-Formed $L$-Formulae

== Normal Forms of $L$-Formulae

== Compactness

== Higher-Order Logic
