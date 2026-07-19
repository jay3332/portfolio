#import "../../root.typ": *

#render-book(
  title: "Linear Algebra",
  description: "Comprehensive notes for a proof-based introduction to linear algebra with applications",
  author: "Jaysen Tsao",
  chapters: (
    (
      title: "Introduction to Vector Spaces",
      description: "Abstraction and properties of scalars, vectors, and vector spaces",
      sections: (
        (src: "ch1/1-fields.typ", title: "Fields and Subfields"),
        (src: "ch1/2-vector-spaces.typ", title: "Vector Spaces and Subspaces"),
        (src: "ch1/3-linear-independence.typ", title: "Span and Linear Independence"),
        (src: "ch1/4-dimension.typ", title: "Basis and Dimension"),
      ),
    ),
    (
      title: "Linear Maps and Matrices",
      description: "Theory of linear maps, matrix representations, change of basis, and duality",
      sections: (
        (src: "ch2/1-linear-maps.typ", title: "Introduction to Linear Maps"),
        (src: "ch2/2-matrices.typ", title: "Introduction to Matrices"),
        (src: "ch2/3-invertibility.typ", title: "Invertibility and Isomorphisms"),
        (src: "ch2/4-quotient-spaces.typ", title: "Product and Quotient Spaces"),
      ),
    ),
    (
      title: "Linear Systems",
      description: "Theory of linear systems, Gaussian elimination, related matrix factorizations, and applications",
      sections: (
        (src: "ch3/1-linear-systems.typ", title: "Linear Systems and Matrix Equations"),
        (src: "ch3/2-row-reduction.typ", title: "Echelon Forms and Row Reduction"),
        (src: "ch3/3-computation-of-subspaces.typ", title: "Computation of Matrix Subspaces"),
      ),
    ),
    (
      title: "Determinants",
      description: "Theory of multilinear maps, determinants, properties, and applications",
      sections: (
        (src: "ch4/1-determinants.typ", title: "Determinants and Permutations"),
        (src: "ch4/2-properties-of-determinants.typ", title: "Properties of Determinants"),
        (src: "ch4/3-cofactor-expansion.typ", title: "Cofactor Expansion and Cramer's Rule"),
      ),
    ),  
    (
      title: "Eigenvalues and Eigenvectors",
      description: "Theory of eigenvalues, eigenvectors, polynomials, and diagonalization",
      sections: (
        (src: "ch5/1-invariant-subspaces.typ", title: "Invariant Subspaces"),
        (src: "ch5/2-polynomials.typ", title: "Polynomials"),
        // (src: "ch5/3-diagonalization.typ", title: "Diagonalization"),
        // (src: "ch5/4-commuting-operators.typ", title: "Commuting Operators"),
      ),
    ),
    (
      title: "Inner Product Spaces and Orthogonality",
      description: "Theory of inner product spaces and orthogonality",
      sections: (
        (src: "ch6/1-inner-products.typ", title: "Inner Products and Norms"),
        (src: "ch6/2-orthogonality.typ", title: "Orthogonality and Projections"),
        // (src: "ch6/3-orthogonalization.typ", title: "Orthogonalization Process"),
        // (src: "ch6/4-adjoint-operators.typ", title: "Adjoint Operators"),
        // (src: "ch6/5-isometries", title: "Isometries and Unitary Operators"),
        // (src: "ch6/6-complexification.typ", title: "Complexification"),
      ),
    ),
    (
      title: "Spectral Theory",
      description: "Theory of spectral decomposition, singular values, and quadratic forms",
      sections: (
        // (src: "ch7/1-spectral-theorem.typ", title: "Spectral Theorem"),
        // (src: "ch7/2-singular-value-decomposition.typ", title: "Singular Value Decomposition"),
        // (src: "ch7/3-other-decompositions.typ", title: "Cholesky and Polar Decompositions"),
        // (src: "ch7/4-quadratic-forms.typ", title: "Bilinear and Quadratic Forms"),
        // (src: "ch7/5-optimization.typ", title: "Optimization Techniques"),
      ),
    ),
    (
      title: "Duality and Tensors",
      description: "Theory of multilinear algebra, duality, and tensors",
      sections: (
        (src: "ch8/1-dual-spaces.typ", title: "Dual Spaces and Dual Maps"),
        // (src: "ch8/2-tensors.typ", title: "Introduction to Tensors"),
        // (src: "ch8/3-change-of-basis-for-tensors.typ", title: "Change of Basis for Tensors"),
      )
    ),
    (
      title: "Jordan Canonical Form",
      description: "Theory of generalized eigenspaces and the Jordan canonical form",
      sections: (
        // (src: "ch9/1-generalized-eigenvectors.typ", title: "Generalized Eigenvectors and Nilpotency"),
        // (src: "ch9/2-generalized-eigenspaces.typ", title: "Generalized Eigenspaces"),
        // (src: "ch9/3-jordan-canonical-form.typ", title: "Jordan Canonical Form"),
      ),
    ),
    (
      title: "Applications of Linear Algebra",
      description: "Applications of linear algebra to various fields",
      sections: (
        // (src: "ch10/1-geometry.typ", title: "Geometric Applications"),
        // (src: "ch10/2-diff-eq.typ", title: "Difference and Differential Equations"),
        // (src: "ch10/3-markov-chains.typ", title: "Markov Chains"),
        // (src: "ch10/4-machine-learning.typ", title: "Data and Machine Learning"),
      ),
    ),
    (
      title: "Appendix",
      description: "Solutions to exercises and additional material",
      unnumbered: true,
      sections: (
        (src: "appendix/solutions.typ", title: "Solutions"),
      ),
    )
  ),
  root: "books/linear-algebra"
)
