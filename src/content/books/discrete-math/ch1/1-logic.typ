#import "../../../root.typ": *

#show: book-section.with(
  name: "Propositional Logic",
  numbering-depth: 3
)

The system of *propositional logic* allows us to express statements mathematically and reason about their truth values.

#let ttrue = $sans("T")$
#let ffalse = $sans("F")$

== Language of Propositional Logic

We must first define the syntax we will use to express propositions in propositional logic.

A _proposition_, in fact, is defined as follows:
#definition[Proposition][
  A *proposition* is a statement that can be true or false.
]

#terminology[Synonyms for _Proposition_][
  Mathematical papers often use the following terms to more concisely refer to propositions:
  - A *theorem* is a significant proposition that has been proven to be true.
  - A *lemma* is a proposition used to progress towards proving a larger theorem.
  - A *corollary* is a proposition that follows directly from a previously proven theorem.
  - A *proposition*, in general, is a statement that can be proven true or false.
]

_"True"_ and _"False"_ are the two *truth values* that propositions can take on. 

=== Propositional Variables

_Propositional variables_ are used to abstract propositions into a symbolic form.
Since we are interested in the _syntax_ used to express propositions, we cannot associate a propositional variable with a specific proposition. Instead, we treat propositional variables as placeholders that can represent any proposition.

#definition[Propositional Variable][
  A *propositional variable* $p$ is a variable that can potentially take on a *truth value*. That is, $p$ can be assigned either *true* or *false*.
]

#remark(oneline: true)[
  Note that a propositional variable $p$ itself is _not_
  "either true or false" directly. Rather it is merely "possible" to assign $p$ a truth value of either true or false, and we manipulate $p$ as if we don't know which truth value it has been assigned.
]

#example[
  The assertion that _$x$ is a square_ can be assigned a propositional variable $p$, since it would hold that $p$ is true if $x$ is a square, and false otherwise.
]

#notation[Truth Values][
  We can denote the truth values as #ttrue for true and #ffalse for false.
]

=== Complex Propositions

Although propositional variables can abstract individual propositions, we can express more complex propositions by combining propositional variables using *logical connectives*.

#definition[Logical Connective][
  A *logical connective* is an operator that takes one or more propositions as input and produces a new proposition as output.
]

#definition[Atomic and Compound Propositions][
  An *compound proposition* is a proposition that can be formed by combining one or more propositions using logical connectives. A proposition that is not compound is called an *atomic proposition*. 
]

#resource[Semantics of the Standard Logical Connectives][
   If $P$ and $Q$ are propositions, then the following are common logical connectives:
    - $not P$, called the *negation* of $P$, read "_not $P$_."
    - $P and Q$, called the *conjunction* of $P$ and $Q$, read "_$P$ and $Q$_."
    - $P or Q$, called the *disjunction* of $P$ and $Q$, read "_$P$ or $Q$_."
    - $P => Q$, called the *implication* from $P$ to $Q$, read _"if $P$ then $Q$"_ or _"$P$ implies $Q$_."
    - $P <=> Q$, called the *biconditional* between $P$ and $Q$, read _"$P$ if and only if $Q$_."

    The above connectives are listed in order of binding precedence. Also, the implication operator $=>$ is right-associative, while the other binary connectives are left-associative.
]

#example(oneline: true)[
  The compound proposition $p and q or r$ unambigously denotes $(p and q) or r$ since $and$ binds more tightly than $or$.
]

#example(oneline: true)[
  The compound proposition $p => q => r$ unambiguously denotes $p => (q => r)$ since $=>$ is right-associative.
]

#terminology[Tautology and Contradiction][
  A proposition is a *tautology*, denoted $bf(t)$ or $top$, if it is assumed to be true under all circumstances. A proposition is a *contradiction*, denoted $bf(c)$ or $bot$, if it is assumed to be false under all circumstances.
]

=== Well-Formed Propositional Formulae

Formally, we can define the syntax of compound propositions using the notion of *propositional formulae*. A *propositional formula* is an abstract syntactic object that represents a proposition. 
Propositional formulae are built from propositional variables and logical connectives according to the following rules:

#definition(ref: <wff>)[Well-Formed Propositional Formula][
  Let $Phi$ a set of propositional variables, and let $Psi$ be a set of logical connectives over $Phi$. The set of *well-formed propositional formulae* over $Psi$, denoted $cal(W)(Phi, Psi)$, is the smallest set such that the following rules hold:

  + *Trivial Formulae.* $bf(t) in cal(W)(Phi, Psi)$ and $bf(c) in cal(W)(Phi, Psi)$.
  + *Atomic Formulae.* If $p in Phi$, then $p in cal(W)(Phi, Psi)$.
  + *Unary Connectives.* For all $P in cal(W)(Phi, Psi)$ and for all unary connectives $star in Psi$, we have $(star P) in cal(W)(Phi, Psi)$.
  + *Binary Connectives.* For all $P, Q in cal(W)(Phi, Psi)$ and for all binary connectives $star in Psi$, we have $(P star Q) in cal(W)(Phi, Psi)$.
]

This definition of a _well-formed propositional formula_ rigorously defines a syntax under which we can write compound propositions. 

#example(oneline: true)[
  If $Phi = {triangle, square, circle}$ and $Psi = {star, *}$ where $star$ is a unary connective and $*$ is a binary connective, then
  $cal(W)(Phi, Psi)$ would include formulae such as $(star triangle)$, $(square * circle)$, and $(star (triangle * square))$. $cal(W)(Phi, Psi)$ would not include $(triangle square)$, since there is no connective between $triangle$ and $square$.
]

#proposition[Unique Readability of Propositional Formulae][
  Let $P in cal(W)(Phi, Psi)$. Then exactly one of the following holds:
  - $P = bf(t)$ or $P = bf(c)$.
  - $P in Phi$.
  - $exists! thin Q in cal(W)(Phi, Psi)$ such that $P = (star Q)$ for some unary connective $star in Psi$.
  - $exists! thin Q, R in cal(W)(Phi, Psi)$ such that $P = (Q star R)$ for some binary connective $star in Psi$.
]

The definition of well-formed formulae is a bit abstract, so it would be useful to restrict it to the set of familiar connectives we want to eventually assign semantics to. Define a set of _standard_ logical connectives $Psi$ that we will implicitly assume:

#definition(ref: <standard-logic-connectives>)[Standard Logical Connectives][
  Let $not$ be a unary connective, and let $and$, $or$, $=>$, and $<=>$ be binary connectives. Then the set of *standard logical connectives* is defined as $Psi = {not, and, or, =>, <=>}$.
]

#notation[Precendence and Associativity][
  When unambiguous, we will often omit parentheses in propositional formulae, relying on the standard binding precedence and associativity of the logical connectives to disambiguate: 

  - Define the binding strength from tightest to loosest of the standard logical connectives as $(not, and, or, =>, <=>)$.
  - Define $(not not P)$ to mean $(not (not P))$.
  - Define $(P star Q star R)$ to mean $((P star Q) star R)$ for the connectives $and$, $or$, and $<=>$.
  - Define $(P => Q => R)$ to mean $(P => (Q => R))$.
]

#notation(oneline: true)[
  Unless specified, assume that the set of propositional formulae is defined under 
  the standard logical connectives from #card-prefix-ref(<standard-logic-connectives>). Consequently, let $cal(W)(Phi)$ denote the set of well-formed propositional formulae over $Phi$ under the standard logical connectives.
]

#let Sub = $op("Sub")$
#definition[Subformula][
  Let $P in cal(W)(Phi, Psi)$. A *subformula* of $P$ is any formula that appears as a part of $P$. Formally, the set of subformulae of $P$, denoted $Sub(P)$, is defined recursively as follows:
  + If $P = bf(t)$, $P = bf(c)$, or $P in Phi$, then $Sub(P) = {P}$.
  + If $P = (star Q)$ for some unary connective $star in Psi$, then $Sub(P) = {P} union Sub(Q)$.
  + If $P = (Q star R)$ for some binary connective $star in Psi$, then $Sub(P) = {P} union Sub(Q) union Sub(R)$.
]

#example(oneline: true)[
  $Sub(p and (q or r)) = {p, q, r, q or r, p and (q or r)}$.
]

#definition[Complexity and Depth of a Propositional Formula][
  The *complexity* of a propositional formula $P$, denoted $"complexity"(P)$,
  is the total number of logical connectives in $P$. Formally, if $P in cal(W)(Phi, Psi)$, then:
  $
    cases(
      "complexity"(p) = 0 & "if" p = bf(t) "or" p = bf(c) "or" p in Phi,
      "complexity"(star P) = 1 + "complexity"(P) & "if" P in cal(W)(Phi, Psi) "and" star in Psi,
      "complexity"(P star Q) = 1 + "complexity"(P) + "complexity"(Q) & "if" P comma Q in cal(W)(Phi, Psi) "and" star in Psi,
    )
  $
  
  The *depth* of a propositional formula $P$, denoted $"depth"(P)$, is the length of the longest path from the root of $P$ to any leaf in the parse tree of $P$.
  Formally, if $P in cal(W)(Phi, Psi)$, then:
  $
    cases(
      "depth"(p) = 0 & "if" p = bf(t) "or" p = bf(c) "or" p in Phi,
      "depth"(star P) = 1 + "depth"(P) & "if" P in cal(W)(Phi, Psi) "and" star in Psi,
      "depth"(P star Q) = 1 + max("depth"(P), "depth"(Q)) & "if" P comma Q in cal(W)(Phi, Psi) "and" star in Psi,
    )
  $
]

#example(oneline: true)[
  Let $P = p and (q or r)$. Then $"complexity"(P) = 2$ since there are two logical connectives in $P$, and $"depth"(P) = 2$.
]

#let sand = $#h(1em) "and" #h(1em)$

== Truth Assignments and Semantics

While propositional formulae are syntactic objects, we can assign them meaning by defining *truth assignments* that specify the truth value of each propositional variable.

#definition[Truth Assignment][
  A *truth assignment* $sigma$ over a set of propositional variables $Phi$ is a function that assigns a truth value to each propositional variable in $Phi$ (and by extension, to all propositional formulae over $Phi$).
  
  Formally, a truth assignment $sigma$ over $Phi$ is a function that satisfies:
  $
    sigma&: cal(W)(Phi) -> {ttrue, ffalse}.
  $
  where $cal(W)(Phi)$ denotes the set of all propositional formulae over $Phi$.
]

#example(oneline: true)[
  By saying $sigma(p) = sans("T")$, we are asserting that the propositional variable $p$ is true under the truth assignment $sigma$.
]

#example(oneline: false)[
  Let $Phi = {p, q}$ be a set of propositional variables. Then a truth assignment $sigma$ over $Phi$ could be defined as follows:
  $
    sigma(p) = ttrue, sigma(q) = ffalse, sigma(p and q) = ffalse, sigma(p or q) = ttrue, ...
  $
  Another truth assignment over $Phi$, say $xi$, could be defined differently as:
  $
    xi(p) = ffalse, xi(q) = ffalse, xi(p and q) = ffalse, xi(p or q) = ffalse, ...
  $
]

There are _many_ possible truth assignments over a set of propositional variables. Specifically, if $Phi$ is a set of $n$ propositional variables, then there are $2^n$ possible truth assignments over $Phi$, since each propositional variable can be assigned one of two values ($ttrue$ or $ffalse$) independently.

#corollary[Number of Truth Assignments][
  Let $Phi$ be a set of $n$ propositional variables. Then there are $2^n$ possible truth assignments over $Phi$.
]

#definition[Satisfaction of Propositional Formulae][
  A propositional formula $P$ is *satisfied* under a truth assignment $sigma$, denoted $sigma tack.double P$, if $sigma(P) = ttrue$. Otherwise, if $sigma(P) = ffalse$, we say that $P$ is *not satisfied* under $sigma$, denoted $sigma tack.double.not P$.
]

#terminology[Satisfiability of Propositional Formulae][
  A propositional formula $P$ is *satisfiable* if there exists 
  a truth assignment $sigma$ such that $sigma tack.double P$. Otherwise, $P$ is *unsatisfiable*.
]

We can now rigorously define tautologies and contradictions in terms of truth assignments:

#definition[Tautology and Contradiction][
  Let $Phi$ be a set of propositional variables.
  A propositional formula $P$ over $Phi$ is a *tautology* if $sigma tack.double P$ for all truth assignments $sigma$ over $Phi$. 
  
  On the other hand, a propositional formula $P$ is a *contradiction* if $sigma tack.double.not P$ for all truth assignments $sigma$ over $Phi$.
]

=== Boolean Functions and Truth Tables

#definition[Boolean Parameterization][
  The *Boolean parameterization* $f: {ttrue, ffalse}^n -> {ttrue, ffalse}$ of a propositional formula $P$ over the variables $Phi = {p_1, p_2, ..., p_n}$ is the Boolean function defined by:
  $
    f(sigma(p_1), sigma(p_2), ..., sigma(p_n)) = sigma(P) "for all truth assignments" sigma "over" Phi.
  $
]

#example(oneline: true)[
  Let $P = p_1 and not p_2$ be a propositional formula over the variables $Phi = {p_1, p_2}$. Then the Boolean parameterization of $P$ is the function $f: {ttrue, ffalse}^2 -> {ttrue, ffalse}$ defined by:
  $
    f(ttrue, ttrue) = ffalse, f(ttrue, ffalse) = ttrue, f(ffalse, ttrue) = ffalse, f(ffalse, ffalse) = ffalse.
  $
]

#let truth-table(hdr, ..args) = table(
  columns: (1fr,) * hdr.len(),
  stroke: 0pt,
  align: center + horizon,
  table.header(..hdr),
  table.hline(stroke: 1pt),
  ..args,
)

#definition[Truth Table][
  The *truth table* of a propositional formula $P$ over the variables $Phi = {p_1, p_2, ..., p_n}$ is a tabular representation of all possible truth assignments. 
  Specifically, each row corresponds to a possible truth assignment over $Phi$, and the last column gives the truth value of $P$ under that assignment:

  #truth-table(
    ($p_1$, $p_2$, $dots.c$, $p_n$, $dots.c$, $P$),
    $sigma_1 (p_1)$, $sigma_1 (p_2)$, $dots.c$, $sigma_1 (p_n)$, $dots.c$, $sigma_1 (P)$,
    $sigma_2 (p_1)$, $sigma_2 (p_2)$, $dots.c$, $sigma_2 (p_n)$, $dots.c$, $sigma_2 (P)$,
    $dots.v$, $dots.v$, $dots.down$, $dots.v$, $dots.down$, $dots.v$,
    $sigma_m (p_1)$, $sigma_m (p_2)$, $dots.c$, $sigma_m (p_n)$, $dots.c$, $sigma_m (P)$,
  )

  Where $sigma_1, sigma_2, ..., sigma_m$ are the $2^n$ possible truth assignments over $Phi$.
  Auxiliary columns of the truth table may be added to show the truth values of subformulae of $P$ under each truth assignment.
]

#example[
  A truth table for the propositional formula $(p => q) => p$ is:
  #truth-table(
    ($p$, $q$, $p => q$, $(p => q) => p$),
    $ttrue$, $ttrue$, $ttrue$, $ttrue$,
    $ttrue$, $ffalse$, $ffalse$, $ttrue$,
    $ffalse$, $ttrue$, $ttrue$, $ffalse$,
    $ffalse$, $ffalse$, $ttrue$, $ffalse$,
  )
  Notice that all rows have the same truth value in the $p$ and $(p => q) => p$ columns. In other words, $p$ and $(p => q) => p$ have the same truth value under every possible truth assignment, so $p equiv (p => q) => p$.
]

#property(oneline: true)[
  Let $P$ be the propositional formula corresponding to a column of a truth table. $P$ is a tautology iff all entries in the column are $ttrue$, and $P$ is a contradiction iff all entries in the column are $ffalse$. $P$ is satisfiable iff _at least_ one entry in the column is $ttrue$.
]

=== Semantics of Logical Connectives

Until now, logical connectives like $not$, $and$, and $or$ have been treated as syntactic objects that can be used to build propositional formulae, but they have not been given any meaning. Under a truth assignment, we can properly define the semantics of the logical connectives.

#definition[Negation][
  Under a truth assignment $sigma$, the *negation* of a propositional formula $P$, denoted $not P$ and read "_not $P$_", is defined by:
  $
    sigma(not P) = cases(
      ttrue & "if" sigma tack.double.not P,
      ffalse & "otherwise",
    )
  $
]

#definition[Conjunction][
  Under a truth assignment $sigma$,
  the *conjunction* of two propositional formulae $P$ and $Q$, denoted $P and Q$ and read "_$P$ and $Q$_", is defined by:
  $
    sigma(P and Q) = cases(
      sigma(Q) & "if" sigma tack.double P,
      ffalse & "otherwise",
    )
  $
]

#definition[Disjunction][
  The *disjunction* of two propositional formulae $P$ and $Q$, denoted $P or Q$ and read "_$P$ or $Q$_", is defined by:
  $
    sigma(P or Q) = cases(
      sigma(Q) & "if" sigma tack.double.not P,
      ttrue & "otherwise",
    )
  $
]

#definition[Implication][
  The *implication* from a propositional formula $P$ to a propositional formula $Q$, denoted $P => Q$ and read _"if $P$ then $Q$_", is defined by:
  $
    sigma(P => Q) = cases(
      ttrue & "if" sigma tack.double.not P,
      sigma(Q) & "otherwise",
    )
  $
  When $sigma(P) = ffalse$, the implication $P => Q$ is true regardless of the truth value of $Q$, in which case we say that $P => Q$ is *vacuously true*.
]

#definition[Biconditional][
  The *biconditional* between two propositional formulae $P$ and $Q$, denoted $P <=> Q$ and read _"$P$ if and only if $Q$_", is defined by:
  $
    sigma(P <=> Q) = cases(
      ttrue & "if" sigma(P) = sigma(Q),
      ffalse & "otherwise",
    )
  $
]

=== Logical Equivalences

#definition[Logical Equivalence][
  Two propositional formulae $P$ and $Q$ are *logically equivalent*, denoted $P equiv Q$, iff $P$ and $Q$ have the same truth value under every possible truth assignment. That is,
  $
     P equiv Q "iff" sigma(P) = sigma(Q) "for all possible truth assignments" sigma.
  $
]

#corollary[Logical Equivalence as a Biconditional][
  Let $P$ and $Q$ be propositional formulae. Then $P equiv Q$ iff $P <=> Q$ is a tautology.
]

#property(oneline: true)[
  Let $P$ and $Q$ be propositional formulae corresponding to columns of a truth table. $P equiv Q$ iff the entries in the $P$ and $Q$ columns are the same for every row.
]

#definition[Propositional Axioms][
  For all propositional formulae $P$, $Q$, and $R$, the following laws hold:

  + *Associativity.* 
    $
      P or (Q or R) equiv (P or Q) or R sand P and (Q and R) equiv (P and Q) and R.
    $
  + *Commutativity.*
    $
      P or Q equiv Q or P sand P and Q equiv Q and P.
    $
  + *Distributivity.*
    $
      P or (Q and R) equiv (P or Q) and (P or R) sand P and (Q or R) equiv (P and Q) or (P and R).
    $
  + *Identity.*
    $
      P or bf(c) equiv P sand P and bf(t) equiv P.
    $
  + *Existence of Complements.*
    $
      P or not P equiv bf(t) sand P and not P equiv bf(c).
    $
]

To simplify propositional formulae, we can use logical equivalences to rewrite them in simpler forms.

#theorem(ref: <double-negation>)[Double Negation Law][
  For all propositional formulae $P$, it holds that $not not P equiv P$.
]

#proof(card-title-ref(<double-negation>))[
  Suppose $P$ is a propositional formula. Then:
  $
    
  $
]

#theorem[De Morgan's Laws][
  For all propositional formulae $P$ and $Q$, the following equivalences hold:
  $
    not (P or Q) equiv not P and not Q sand not (P and Q) equiv not P or not Q.
  $
]



#resource[Logical Equivalences][  
  #table(
    columns: (0.8fr, 1.4fr, 2fr),
    stroke: 0pt,
    align: (center + horizon, left, center),
    table.header([], [*Name*], [*Equivalence*]),
    table.hline(stroke: 1pt),
    table.cell(rowspan: 8)[Axioms],
    [Commutativity over $and$], $P and Q equiv Q and P$,
    [Commutativity over $or$], $P or Q equiv Q or P$,
    [Associativity over $and$], $P and (Q and R) equiv (P and Q) and R$,
    [Associativity over $or$], $P or (Q or R) equiv (P or Q) or R$,
    [Distributivity of $and$ over $or$], $P and (Q or R) equiv (P and Q) or (P and R)$,
    [Distributivity of $or$ over $and$], $P or (Q and R) equiv (P or Q) and (P or R)$,
    [Identity for $and$], $P and bf(t) equiv P$,
    [Identity for $or$], $P or bf(c) equiv P$,
    table.hline(stroke: 1pt),
    table.cell(rowspan: 11)[Equivalences over $not, and, or$],
    [Law of Excluded Middle], $P or not P equiv bf(t)$,
    [Law of Non-Contradiction], $P and not P equiv bf(c)$,
    [Domination of $or$], $P or bf(t) equiv bf(t)$,
    [Domination of $and$], $P and bf(c) equiv bf(c)$,
    [Double Negation], $not not P equiv P$,
    [De Morgan's Law over $and$], $not (P and Q) equiv not P or not Q$,
    [De Morgan's Law over $or$], $not (P or Q) equiv not P and not Q$,
    [Absorption Law over $and$], $P and (P or Q) equiv P$,
    [Absorption Law over $or$], $P or (P and Q) equiv P$,
    [Idempotency of $and$], $P and P equiv P$,
    [Idempotency of $or$], $P or P equiv P$,
    table.hline(stroke: 1pt),
    table.cell(rowspan: 4)[Implication Equivalences],
    [Material Implication], $P => Q equiv not P or Q$,
    [Contraposition of $=>$], $P => Q equiv not Q => not P$,
    [Exportation of $=>$], $(P and Q) => R equiv P => (Q => R)$,
    [Elimination using $or$], $P or Q equiv not P => Q$,
    table.hline(stroke: 1pt),
    table.cell(rowspan: 5)[Biconditional Equivalences],
    [Definition of Biconditional], $P <=> Q equiv (P and Q) or (not P and not Q)$,
    [Material Biconditional], $P <=> Q equiv (P => Q) and (Q => P)$,
    [Contraposition of $<=>$], $P <=> Q equiv not P <=> not Q$,
    [Exportation of $<=>$], $(P and Q) <=> R equiv P <=> (Q <=> R)$,
    [Negation of Biconditional], $not (P <=> Q) equiv P <=> not Q$,
  )
]

== Normal Forms

#definition[Literal][
  A *literal* over a set of propositional variables $Phi$ is either a propositional variable $p in Phi$ or the negation of a propositional variable $not p$ for some $p in Phi$.
]

#definition[Negation Normal Form][
  A propositional formula is in *negation normal form* (NNF) if the negation operator $not$ only applies to propositional variables, and the only logical connectives are conjunctions and disjunctions.
]

#definition[Disjunctive Normal Form][
  A propositional formula is in *disjunctive normal form* (DNF) if it is a disjunction of conjunctions of literals.


]

#definition[Conjunctive Normal Form][
  A propositional formula is in *conjunctive normal form* (CNF) if it is a conjunction of disjunctions of literals. 

]

#theorem[Existence of Normal Forms][
  For all propositional formulae $P$, there exist propositional formulae in NNF, DNF, and CNF that are logically equivalent to $P$.
]

#proposition[Length Complexity of Normal Forms][
  The number of symbols needed to express a propositional formula $P$ in CNF or DNF 
  has a length complexity of $cal(O)(2^n)$, where
  $n$ is the number of propositional variables in $P$.
]

=== Counting Formulae


== Functional Completeness

#definition[Functionally Complete Set of Connectives][
  A set of logical connectives $Psi_1$ over $Phi$ is *functionally complete* over $Psi_2$
  iff for every propositional formula $P in cal(W)(Phi, Psi_2)$, there exists a propositional formula $Q in cal(W)(Phi, Psi_1)$ such that $P equiv Q$.
]

#theorem[Alternative Characterization of Functional Completeness][


  A set of logical connectives $Psi$ over a set $Phi = {p_1, p_2, ..., p_n}$ iff for every truth assignment $sigma$ over $Phi$
]

#theorem[Functional Completeness over Standard Logical Connectives][
  Each of ${not, and}$, ${not, or}$, and ${not, =>}$ is functionally complete over the set of standard logical connectives.
]

#definition[Sheffer Stroke and Peirce's Arrow][
  The *Sheffer stroke* (also called the *NAND* operator) is a binary connective denoted by $arrow.t$ and defined by $P arrow.t Q equiv not (P and Q)$. *Peirce's arrow* (also called the *NOR* operator) is a binary connective denoted by $arrow.b$ and defined by $P arrow.b Q equiv not (P or Q)$.
]

#theorem[Functional Completeness of Sheffer Stroke and Peirce's Arrow][
  Each of ${arrow.t, arrow.b}$ is functionally complete over the set of standard logical connectives.
]

== Resolution

////






== Exercises

#exercise(oneline: true)[
  Compute the truth table for the proposition
  $(p => q) <=> (not q => not p)$.
]

#exercise(oneline: true)[
  Convert $not(p => (q and not r))$ to NNF, DNF, and CNF.
]

#exercise(oneline: true)[
  Show that $(p or q) => r equiv (p => r) and (q => r)$.
]

#exercise(oneline: true)[
  Show that $(p => q => r) => (p => q) => p => r$ is a tautology.
]

#exercise(oneline: true)[
  Show that ${or}$ is not functionally complete over the set of standard logical connectives.
]

#exercise(oneline: true)[
  
]