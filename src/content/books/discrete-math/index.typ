#import "../../root.typ": *

#render-book(
  title: "Discrete Mathematics for Computer Science",
  description: "Comprehensive notes for the discrete math sequence for CS students at CMU",
  author: "Jaysen Tsao",
  course: "CMU 15-051/15-151 (Math Concepts) and 15-251 (Theoretical CS)",
  chapters: (
    (
      title: "Mathematical Logic",
      description: "Introduction to propositional logic, proof techniques, and set theory",
      sections: (
        (src: "ch1/1-logic.typ", title: "Propositional Logic"),
        (src: "ch1/2-predicates.typ", title: "First-Order Logic"),
        (src: "ch1/3-proofs.typ", title: "Arguments and Proofs"),
      ),
    ),
    (
      title: "Set Theory",
      description: "Introduction to elementary and axiomatic set theory, relations, functions, and cardinality",
      sections: (
        (src: "ch2/1-sets.typ", title: "Naive Set Theory"),
        (src: "ch2/2-functions.typ", title: "Functions and Relations"),
        (src: "ch2/3-countability.typ", title: "Countability and Cardinality"),
        (src: "ch2/4-zfc.typ",
        title: "Zermelo-Fraenkel Set Theory"),
      ),
    ),
    (
      title: "Number Theory",
      description: "Elementary and analytic number theory, modular arithmetic, and applications to cryptography",
      sections: (

      )
    ),
  ),
  root: "books/discrete-math"
)