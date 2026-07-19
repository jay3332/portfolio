#import "../../packages/mathyml.typ": try-to-mathml, _utils, prelude as mathyml-prelude
#import mathyml-prelude: display, inline, script, sscript
// #import mathyml-prelude: *

#let x-target = sys.inputs.at("x-target", default: "pdf")
#let _mathml-fix(ident, paged, body, ..args) = {
  if x-target == "web" [
    #metadata((_utils._type-ident: ident, body: body, ..args.named()))
    #context if target() != "html" { paged(body) }
  ] else {
    paged(body)
  }
}
#let upright(body) = _mathml-fix(_utils._dict-types.upright, math.upright, body)
#let italic(body) = _mathml-fix(_utils._dict-types.italic, math.italic, body)
#let bold(body) = _mathml-fix(_utils._dict-types.bold, math.bold, body)
#let serif(body) = _mathml-fix(_utils._dict-types.variant, math.serif, body, variant: "serif")
#let sans(body) = _mathml-fix(_utils._dict-types.variant, math.sans, body, variant: "sans")
#let frak(body) = _mathml-fix(_utils._dict-types.variant, math.frak, body, variant: "frak")
#let mono(body) = _mathml-fix(_utils._dict-types.variant, math.mono, body, variant: "mono")
#let bb(body) = _mathml-fix(_utils._dict-types.variant, math.bb, body, variant: "bb")
#let cal(body) = _mathml-fix(_utils._dict-types.variant, math.cal, body, variant: "cal")

// #let _sizes-inner(body, paged, size) = {
//   import "../../packages/mathyml/src/convert.typ": convert-mathml
//   if x-target == "web" {
//     convert-mathml(body, size: size)
//   } else {
//     paged(body)
//   }
// }

// #let display(body) = _sizes-inner(body, math.display, "display")
// #let inline(body) = _sizes-inner(body, math.inline, "text")
// #let script(body) = _sizes-inner(body, math.script, "script")
// #let sscript(body) = _sizes-inner(body, math.sscript, "script-script")

#let dif = [#sym.space.thin #upright(symbol("d"))]
#let Dif = [#sym.space.thin #upright(symbol("D"))]

// Math helpers
#let bf(content) = $upright(bold(#content))$
#let dd(variable) = $dif#variable$
#let dv(f, x) = $dd(#f)/dd(#x)$
#let inlinedv(f, x) = $dd(#f) slash dd(#x)$
#let ndv(f, x, n) = $(dif^#n #f)/(dif #x^#n)$
#let pdv(f, x) = $(partial #f)/(partial #x)$
#let npdv(f, x, n) = $(partial^#n #f)/(partial #x^#n)$
#let rmat = math.mat.with(align: right)
#let lmat = math.mat.with(align: left)
#let dmat = math.mat.with(delim: "|")
#let rdmat = rmat.with(delim: "|")
#let ldmat = lmat.with(delim: "|")
#let ang(..args) = {
  let inner = args.pos().join([$,$])
  $lr(chevron.l #inner chevron.r)$
}
#let varcal(it) = text(font: "New Computer Modern Math", math.cal(it))
#let varell = text(font: "New Computer Modern Math", math.ell)
#let grad = $arrow(nabla "")$
#let transpose = $sans(upright(T))$
#let hermitian = $sans(upright(H))$
#let suchthat = $mid(|)$
#let without = $backslash$

#let span = $op("span")$
#let col = $op("col")$
#let row = $op("row")$
#let nul = $op("nul")$
#let ker = $op("ker")$
#let im = $op("im")$
#let rank = $op("rank")$
#let dim = $op("dim")$
#let proj = $op("proj")$
#let nullity = $op("nullity")$

#let then = $#h(1fr) -> #h(1fr)$
#let th = super[th]

// Workarounds
#let negative = $class("unary", -)$
#let trueminus = $class("binary", -)$
#let evaluated(f, a, b) = $#f lr(| vec(delim: #none, align: #left, #b, , #a))$
#let evaluatedd(f, a, b) = $#f lr(| vec(delim: #none, align: #left, #b, , , #a))$
#let evaluatedat(f, x) = $evaluated(#f, #x, #[])$
#let evaluateddat(f, x) = $evaluatedd(#f, #x, #[])$

#let cancelto(to, body) = {
  let max(a, b) = if a > b { a } else { b };
  context {
    let m = measure(body)
    let (w, h) = (m.width, m.height * 2)
    let arrow = rotate(-55deg, math.stretch(sym.arrow.r, size: max(h*1.8, w*2.0)))
    set place(center + horizon)
    body
    place(dx: -w * 0.5, dy: -h * 0.1, arrow)
    place(dx: w * 0.35, dy: -h * 1.15, to)
  }
}

#let in-math = state("in-math", false)
#let is-in-math() = in-math.get()

// Colored text

#let _define-color-functions(color) = {
  let tfunc = (x) => text(fill: color, x)
  let cfunc = (x) => if x-target == "web" {
    x
  } else {
    tfunc($#x$)
  }
  (tfunc, cfunc)
}

#let (tred, cred) = _define-color-functions(red)
#let (tblue, cblue) = _define-color-functions(blue)
#let (tgreen, cgreen) = _define-color-functions(rgb("#108010"))
#let (tgray, cgray) = _define-color-functions(gray)
#let (torange, corange) = _define-color-functions(orange)
#let (tpurple, cpurple) = _define-color-functions(purple)

// Subtexts
#let subtext(content) = text(size: 0.85em, fill: gray.darken(20%), content)
#let rsubtext(content) = align(right, subtext(content))

// Geometry helpers (for use in cetz canvas blocks)
#let midpoint(a, b) = ((a.at(0) + b.at(0)) / 2, (a.at(1) + b.at(1)) / 2)
#let midpoint3d(a, b) = (
  (a.at(0) + b.at(0)) / 2,
  (a.at(1) + b.at(1)) / 2,
  (a.at(2) + b.at(2)) / 2,
)

// Lines
#let lgreen = line(length: 100%, stroke: rgb("#108010"))
#let lorange = line(length: 100%, stroke: orange)
#let lblue = line(length: 100%, stroke: blue)
#let lthin = {
  context if target() == "html" {
    html.elem("hr", attrs: (class: "lthin"))
  } else {
    line(length: 100%, stroke: 0.5pt)
  }
}
#let lthick = line(length: 100%, stroke: 1.0pt)
#let ldouble = stack(
  line(length: 100%, stroke: 1.0pt),
  line(length: 100%, stroke: 1.0pt),
  spacing: 2pt,
)

// Semantic blocks
#let hanging(
  heading, 
  body, 
  indent: 1.33em, 
  oneline: false,
  html-class: "",
) = context if target() == "html" {
  let class = "hanging" + if oneline { " hanging-oneline" } else { " hanging-par" }
  if html-class.len() > 0 {
    class += " " + html-class
  }
  html.elem("details", attrs: (class: class))[
    #html.elem("summary", attrs: (class: "hanging-heading"))[#heading]
    #html.elem("div", attrs: (class: "hanging-body"))[#body]
  ]
} else {
  if oneline [
    #set par(hanging-indent: indent)
    #heading #body
  ] else [
    #heading
    #linebreak()
    #show math.equation.where(block: true): pad.with(left: -indent)
    #pad(left: indent, body)
  ]
}
#let semantic-hanging(role, ref: none, html-class: auto, ..args) = {
  let ref = if ref == none { [] } else { ref }
  let html-class = if html-class == auto { "hanging-" + lower(role) } else { html-class }
  if args.pos().len() == 0 {
    []
  } else if args.pos().len() == 1 {
    hanging([_#role._#ref], args.pos().at(0), html-class: html-class, ..args.named())
  } else {
    hanging(
      [_#role:_ #args.pos().at(0).#ref], args.pos().at(1), 
      html-class: html-class, 
      ..args.named()
    )
  }
}
#let define-semantic-hanging(role) = (..args) => semantic-hanging(role, ..args)
#let solution = define-semantic-hanging("Solution")
#let proof = define-semantic-hanging("Proof")
#let partial-proof = define-semantic-hanging("Partial Proof")
#let proof-sketch = define-semantic-hanging("Proof Sketch")
#let proof-lemma(n, ..args) = semantic-hanging(
  if n == none [Lemma] else [Lemma #n], 
  html-class: "hanging-lemma", ..args
)
#let example = define-semantic-hanging("Example")
#let nonexample = define-semantic-hanging("Nonexample")

#let proof-qed = if x-target == "web" {
  math.qed
} else {
  [#h(1fr) $square$]
}

#let exercise-number = counter("Exercise")
#let exercise(..args) = semantic-hanging(
  [#exercise-number.step() #context [Exercise #exercise-number.display()]],
  html-class: "hanging-exercise",
  ..args
)
#let exercise-ref(label) = context {
  let matches = query(label)
  if matches.len() > 0 {
    let num = exercise-number.at(label).at(0) + 1
    link(label, [Exercise #num])
  } else if target() == "html" {
    html.elem("a", attrs: (href: "#" + str(label)), [Exercise])
  } else {
    [Exercise]
  }
}
#let solution-to(ref, ..args) = {
  solution(exercise-ref(ref), ..args, ref: label(str(ref) + "-solution"))
}

// Cards
#let raw-card(
  body, 
  mark: 1pt, level: 3, 
  double-mark: false, y-inset: 1.33em / 2,
  html-classes: "",
) = {
  let inner = [
    #set heading(numbering: none)
    #(counter(heading).step(level: level) + body)
  ]
  context if target() == "html" {
    let class = "infocard infocard-level-" + str(level)
    if double-mark {
      class += " infocard-double-mark"
    }
    if html-classes.len() > 0 {
      class += " " + html-classes
    }
    html.elem("div", attrs: (class: class, data-level: str(level)), inner)
  } else {
    // let left-inset = if double-mark { 3pt } else { 0pt }
    let y-inset = if double-mark { y-inset * 1.67 } else { y-inset }
    let left-inset = 0pt
    let right-inset = if double-mark { 1em } else { 0pt }
    let out = box(
      stroke: (left: mark),
      fill: if double-mark { mark.paint.lighten(92%) } else { none },
      inset: (left: 1.33em - left-inset, top: y-inset, bottom: y-inset, right: right-inset),
      width: 100%,
      inner
    )
    out
    // if double-mark {
    //   box(stroke: (left: mark), inset: (left: 3pt), out)
    // } else {
    //   out
    // }
  }
}

#let define-card(role, default-method: none, mark: 1pt, double-mark: false, level: 5) = {
  let global-counter = counter(role)
  return (..args, method: auto, oneline: false, y-inset: 1.33em / 2, ref: none) => {
    let title
    let body
    if args.pos().len() == 0 {
      title = none
      body = []
    } else if args.pos().len() == 1 {
      title = none
      body = args.pos().at(0)
    } else {
      title = args.pos().at(0)
      body = args.pos().at(1)
    }
    oneline = if x-target != "web" { oneline } else { false }
  
    let method = if method == auto { default-method } else { method }
    let suffix = if title == none { [] } else { [: #title] }
  
    let resolve = (c) => if ref == none { c.get() } else { c.at(ref) }
    let prefix = if method == none {
      [#role]
    } else if method == "absolute" {
      [#role #context numbering("1.1", ..resolve(counter(heading)))]
    } else if method == "global" {
      [#role #context resolve(global-counter).at(0)]
    }
    let head = [#prefix#suffix]
    head = if oneline { [#head.] } else { head }
    head = context if target() == "html" {
      let id-val = if ref != none { str(ref) } else { none }
      let title-part = if title != none { [: ] + html.elem("span", attrs: (class: "infocard-heading-title"), title) } else { [] }
      let content = html.elem("span", attrs: (class: "infocard-heading-prefix"), prefix) + title-part
      let h4-attrs = if id-val != none { (class: "infocard-heading", id: id-val) } else { (class: "infocard-heading") }
      html.elem("h4", attrs: h4-attrs, content)
    } else { head }

    let color = stroke(mark).paint
    let meta = [#metadata((title: title, head: head, prefix: prefix))#ref]
    let global-step = if method == "global" { global-counter.step() } else { [] }

    let resolved = global-step + if oneline [
      #set par(hanging-indent: 1.33em)
      *#text(fill: color, head)*#meta
      #body
    ] else [
      #heading(text(fill: color)[#head #meta], level: level)
      #body
    ]
    raw-card(
      resolved,
      mark: mark, double-mark: double-mark,
      level: level, y-inset: y-inset,
      html-classes: "infocard-" + lower(role)
    )
  }
}

#let definition = define-card("Definition", default-method: "global", mark: 1pt + green.darken(30%), double-mark: true)
#let theorem = define-card("Theorem", default-method: "global", mark: 1pt + purple, double-mark: true)
#let algorithm = define-card("Algorithm", default-method: "global", mark: 1pt + blue.darken(20%).saturate(10%), double-mark: true)
#let resource = define-card("Resource", default-method: "global", mark: 1pt + blue.darken(20%).saturate(10%), double-mark: true)

#let proposition = define-card("Proposition", default-method: "global", mark: 1pt + purple, level: 5)
#let lemma = define-card("Lemma", mark: 1pt + orange.darken(10%))
#let property = define-card("Property", mark: 1pt + orange.darken(10%))
#let corollary = define-card("Corollary", default-method: "global", mark: 1pt + orange.darken(10%))
#let remark = define-card("Remark", mark: 1pt + teal.darken(20%))
#let notation = define-card("Notation", mark: 1pt + teal.darken(20%))
#let terminology = define-card("Terminology", mark: 1pt + teal.darken(20%))
#let important = define-card("Important", mark: 1pt + rgb("#8251df"))
#let warning = define-card("Warning", mark: 1pt + yellow.darken(25%))
#let caution = define-card("Caution", mark: 1pt + red.darken(20%))
#let note = define-card("Note", mark: 1pt + blue)
#let example-card = define-card("Example", mark: 1pt + gray.darken(10%))

#let _card-ref(label, f, ref-type: "head") = {
  let els = query(label)
  if els.len() > 0 {
    link(els.first().location(), f(els.first().value))
  } else if target() == "html" {
    html.elem("a", attrs: (
      href: "#" + str(label),
      "data-card-ref-label": str(label),
      "data-card-ref-type": ref-type,
    ), [?])
  } else {
    [?]
  }
}
#let card-ref(label, f, ctx: true, ref-type: "head") = if ctx {
  context _card-ref(label, f, ref-type: ref-type)
} else {
  _card-ref(label, f, ref-type: ref-type)
}

#let card-title-ref(label, ctx: true) = card-ref(label, it => it.title, ctx: ctx, ref-type: "title")
#let card-prefix-ref(label, ctx: true) = card-ref(label, it => it.prefix, ctx: ctx, ref-type: "prefix")
#let card-head-ref(label, ctx: true) = card-ref(label, it => it.head, ctx: ctx, ref-type: "head")

#let ibm-font(body) = [
  #let (main-font, math-font) = if x-target == "web" {
    ("IBM Plex Serif", "IBM Plex Math")
  } else {
    ("Libertinus Sans", "Libertinus Math")
    // ("IBM Plex Serif", "IBM Plex Math")
    // ("XITS", "XITS Math")
  }
  #set text(font: main-font, size: 11pt)
  #show math.equation: set text(font: math-font)
  #show math.equation: it => in-math.update(true) + it + in-math.update(false)
  #body
]

#let to-string(c) = {
  if type(c) == str {
    c
  } else if type(c) != content {
    str(c)
  } else if c.has("text") {
    c.text
  } else if c.has("children") {
    c.children.map(to-string).join()
  } else if c.has("body") {
    to-string(c.body)
  } else {
    ""
  }
}

#let web-compatible(
  title: "", 
  brief: "",
  date: "",
  tags: (),
  body
) = [
  #metadata((
    title: title,
    brief: brief,
    date: date,
    tags: tags,
  )) <frontmatter>
  
  #show: ibm-font
  #show math.equation: it => {
    if target() == "html" {
      try-to-mathml(it)
    } else {
      it
    }
  }

  #show math.equation.where(block: true): eq => {
    if target() == "html" {
      eq
    } else {
      block(width: 100%, inset: 0pt, align(center, eq))
    }
  }

  // for styling, use `where` to assign classes for different types of figure
  #show figure: it => {
    if target() == "html" { 
      html.elem("figure", attrs: (class: "typst"), html.frame(it))
    } else {
      it
    }
  }

  #show heading: it => if x-target == "web" {
    if it.supplement == [] { return it }
    let (body, ..fields) = it.fields()
    if "label" not in fields { return it }
    let label = fields.remove("label")
    let link = html.elem("span", attrs: (class: "typst-pilcrow"), link(label, sym.pilcrow))
    let body = [#body #link]
    return heading(body, ..fields, supplement: [])
    // html.elem("div", attrs: (class: "typst-linked-heading", dir: "auto"))[
    //   #box(heading(body, ..fields, supplement: []))
    //   #html.elem("span", attrs: (class: "typst-pilcrow"), link(label, sym.pilcrow))
    // ]
  } else {
    it
  }

  #show grid: it => {
    if target() == "html" {
      let style = "display: flex;"
      html.elem("div", attrs: (style: style), html.frame(it))
    } else {
      it
    }
  }

  #show align: it => {
    if target() == "html" {
      let style = if it.alignment == center {
        "text-align: center"
      } else if it.alignment == right {
        "text-align: right"
      } else if it.alignment == left {
        "text-align: left"
      } else {
        ""
      }
      html.elem("p", attrs: (style: style), it.body)
    } else {
      it
    }
  }

  #show h: it => {
    if target() == "html" {
      let style = if type(it.amount) == relative {
        "width: calc(" + it.amount.to_string() + ");"
      } else {
        "width: 40pt;"
      }
      html.elem("div", attrs: (style: style), "")
    } else {
      it
    }
  }

  // suppress pagebreak warnings
  #show pagebreak: it => {
    if target() == "paged" {
      it
    } else {
      []
    }
  }

  #body
]

#let set-chapter(x) = counter(heading).update(x)

#let book-content(numbering-depth: 2, body) = [
  #let _a(level) = if level > numbering-depth {
    (numbering: none)
  } else { () }

  #show heading.where(level: 3): set heading(.._a(1))
  #show heading.where(level: 3): set heading(.._a(2))
  #show heading.where(level: 3): set heading(.._a(3))
  #show heading.where(level: 4): set heading(.._a(4))
  #show heading.where(level: 5): set heading(.._a(5))
  #show heading.where(level: 6): set heading(.._a(6))
  #show title: it => {
    context if target() == "html" {
      html.elem("h1", attrs: (class: "book-section-title"), it.body)
    } else {
      set text(size: 24pt)
      let (ch,) = counter(heading).get()
      pad(y: 1em, align(center)[#ch. #it.body])
    }
  }
  #show heading.where(level: 2): set text(size: 1.67em)
  #show heading.where(level: 3): set text(size: 1.50em)
  #show heading.where(level: 4): set text(size: 1.33em)
  #show math.equation: set block(breakable: true)
  #show heading: it => [
    #show math.equation.where(block: false): math.bold
    #it
  ]

  // #let ch-num = if chapter == auto {
  //   int(sys.inputs.at("x-chapter", default: "1"))
  // } else { chapter }
  // #set-chapter(ch-num)
  #body
]

#let book-section(name: "", numbering-depth: 2, body) = [
  #if x-target == "web" [
    #counter("Exercise").update(int(sys.inputs.at("x-exercise-start", default: "0")))
    #counter("Definition").update(int(sys.inputs.at("x-definition-start", default: "0")))
    #counter("Theorem").update(int(sys.inputs.at("x-theorem-start", default: "0")))
    #counter("Algorithm").update(int(sys.inputs.at("x-algorithm-start", default: "0")))
    #counter("Proposition").update(int(sys.inputs.at("x-proposition-start", default: "0")))
    #counter("Corollary").update(int(sys.inputs.at("x-corollary-start", default: "0")))
    #counter("Resource").update(int(sys.inputs.at("x-resource-start", default: "0")))
  ]
  #show: web-compatible.with(
    title: name,
    date: "2026-05-16",
  )
  #show: book-content.with(numbering-depth: numbering-depth)

  = #name
  #body
]

#let render-book(..cfg) = [
  #let cfg = cfg.named()
  #metadata(cfg) <frontmatter>
  #set page("us-letter", numbering: "1")

  #if sys.inputs.at("x-mode", default: "") != "meta" [
    #show: ibm-font
    #set document(title: cfg.title, author: cfg.author)

    #page(numbering: none)[
      #align(center + horizon)[
        #text(size: 28pt, weight: "bold", cfg.title)
        #v(6pt)
        #text(size: 14pt, cfg.author)
        #v(0.75em)
        #text(size: 12pt, style: "italic", fill: gray.darken(20%), cfg.description)
      ]
    ]

    #outline(title: [Table of Contents #v(0.5em)], depth: 2)
    #pagebreak()

    #for (ch-idx, chapter) in cfg.chapters.enumerate() [
      #set-chapter(ch-idx)
      #let unnumbered = chapter.at("unnumbered", default: false)
      #set heading(..if unnumbered {
        (numbering: none, offset: 1)
      } else {
        (numbering: "1.1", offset: 1)
      })
      #show heading.where(body: [Exercises]): set heading(outlined: false, numbering: none)
      
      #show heading.where(level: 1): it => context if target() == "html" {
        html.elem("h1", attrs: (class: "book-section-title"), it.body)
      } else {
        pad(top: 0.5em, bottom: 0.5em, align(center, text(it, size: 1.67em)))
      }

      #heading(level: 1, chapter.title)
      #align(center, emph(chapter.description))
      #v(1em)

      #for section in chapter.sections [
        #include cfg.at("root", default: ".") + "/" + section.src
        #pagebreak(weak: true)
      ]
    ]
  ]
]
