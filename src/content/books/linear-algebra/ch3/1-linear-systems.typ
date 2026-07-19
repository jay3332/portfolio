#import "../../../root.typ": *

#show: book-section.with(name: "Linear Systems and Matrix Equations")

#definition[Linear Equation][
  A *linear equation* in $F$ over the variables $x_1, x_2, dots, x_n$ is an equation of the form:
  $
    a_1 x_1 + a_2 x_2 + dots.c + a_n x_n = b
  $
  for scalars $a_1, a_2, dots, a_n, b in F$. A *solution* to a linear equation is an $n$-tuple
  $(s_1, s_2, dots, s_n) in F^n$ such that $a_1 s_1 + a_2 s_2 + dots.c + a_n s_n = b$.
  The *solution set* of a linear equation is the set of all solutions to that equation.
]

#definition[Linear System][
  A *linear system* (or *system of linear equations*) in $F$ over the variables $x_1, x_2, dots, x_n$ is 
  a finite set of linear equations over the same variables $x_1, x_2, dots, x_n$. The *solution set* of a linear system is the set of all $n$-tuples $(s_1, s_2, dots, s_n) in F^n$ that are solutions to all equations in the system.
]

#terminology(oneline: true)[
  A linear system is called *consistent* if it has at least one solution, 
  and *inconsistent* if it has zero solutions.
]

