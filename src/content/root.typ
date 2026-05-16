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
#let ang(..args) = {
  let inner = args.pos().join([$,$])
  $lr(chevron.l #inner chevron.r)$
}
#let varcal(it) = text(font: "New Computer Modern Math", math.cal(it))
#let varell = text(font: "New Computer Modern Math", math.ell)
#let grad = $arrow(nabla "")$
#let transpose = $sans(upright(T))$
#let suchthat = $mid(|)$
#let then = $#h(1fr) -> #h(1fr)$
#let th = super[th]

// Workarounds
#let negative = $class("unary", -)$
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
#let tred(x) = text(fill: red, x)
#let tblue(x) = text(fill: blue, x)
#let tgreen(x) = text(fill: rgb("#108010"), x)
#let tgray(x) = text(fill: gray, x)
#let torange(x) = text(fill: orange, x)
#let tpurple(x) = text(fill: purple, x)

#let cred(x) = tred($#x$)
#let cblue(x) = tblue($#x$)
#let cgreen(x) = tgreen($#x$)
#let cgray(x) = tgray($#x$)
#let corange(x) = torange($#x$)
#let cpurple(x) = tpurple($#x$)

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
#let semantic-hanging(role, ref: none, ..args) = {
  let ref = if ref == none { [] } else { ref }
  if args.pos().len() == 0 {
    []
  } else if args.pos().len() == 1 {
    hanging([_#role._#ref], args.pos().at(0), html-class: "hanging-" + lower(role), ..args.named())
  } else {
    hanging(
      [_#role:_ #args.pos().at(0).#ref], args.pos().at(1), 
      html-class: "hanging-" + lower(role), 
      ..args.named()
    )
  }
}
#let define-semantic-hanging(role) = (..args) => semantic-hanging(role, ..args)
#let solution = define-semantic-hanging("Solution")
#let proof = define-semantic-hanging("Proof")
#let example = define-semantic-hanging("Example")

#let proof-qed = if x-target == "web" {
  math.qed
} else {
  [#h(1fr) $qed$]
}

#let exercise-number = counter("Exercise")
#let exercise(..args) = semantic-hanging(
  [#exercise-number.step() #context [Exercise #exercise-number.display()]],
  html-class: "hanging-exercise",
  ..args
)
#let exercise-ref(label) = context {
  let num = exercise-number.at(label).at(0) + 1
  link(label, [Exercise #num])
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
    let left-inset = if double-mark { 3pt } else { 0pt }
    let out = box(
      stroke: (left: mark), 
      inset: (left: 1.33em - left-inset, top: y-inset, bottom: y-inset), 
      inner
    )
    if double-mark {
      box(stroke: (left: mark), inset: (left: 3pt), out)
    } else {
      out
    }
  }
}

#let define-card(role, default-method: none, mark: 1pt, double-mark: false, level: 4) = {
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
      html.elem("h4", attrs: (class: "infocard-heading"), head)
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

#let proposition = define-card("Proposition", default-method: "global", mark: 1pt + purple, level: 5)
#let lemma = define-card("Lemma", mark: 1pt + orange.darken(10%), level: 5)
#let property = define-card("Property", mark: 1pt + orange.darken(10%), level: 5)
#let corollary = define-card("Corollary", mark: 1pt + orange.darken(10%), level: 5)
#let remark = define-card("Remark", mark: 1pt + teal.darken(20%), level: 5)
#let notation = define-card("Notation", mark: 1pt + teal.darken(20%), level: 5)
#let important = define-card("Important", mark: 1pt + rgb("#8251df"), level: 5)
#let warning = define-card("Warning", mark: 1pt + yellow.darken(25%), level: 5)
#let caution = define-card("Caution", mark: 1pt + red.darken(20%), level: 5)
#let note = define-card("Note", mark: 1pt + blue, level: 5)
#let example-card = define-card("Example", mark: 1pt + gray.darken(10%), level: 5)

#let _card-ref(label, f) = {
  let el = query(label).first()
  link(el.location(), f(el.value))
}
#let card-ref(label, f, ctx: true) = if ctx {
  context _card-ref(label, f)
} else {
  _card-ref(label, f)
}

#let card-title-ref(label, ..args) = card-ref(label, it => it.title, ..args)
#let card-prefix-ref(label, ..args) = card-ref(label, it => it.prefix, ..args)
#let card-head-ref(label, ..args) = card-ref(label, it => it.head, ..args)

#let blog-post(
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
  
  #set text(font: "IBM Plex Serif")
  #show math.equation: set text(font: "IBM Plex Math")

  // #show: it => context {
  //   if target() == "paged" {
  //     _t.generic(it)
  //   } else {
  //     it
  //   }
  // }
  
  #show math.equation: it => in-math.update(true) + it + in-math.update(false)

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

#let set-chapter(x) = counter(heading).update(n => x)

#let book-chapter(chapter: auto, body) = [
  #show heading.where(level: 3): set heading(numbering: none)
  #show heading.where(level: 4): set heading(numbering: none)
  #show heading.where(level: 5): set heading(numbering: none)
  #show heading.where(level: 6): set heading(numbering: none)
  #set page("us-letter", margin: 1in, numbering: "1")
  #set heading(numbering: "1.1", offset: 1)
  #show title: it => {
    context if target() == "html" {
      it
    } else {
      set text(size: 24pt)
      let (chapter,) = counter(heading).get()
      pad(y: 1em, align(center)[#chapter. #it.body])
    }
  }
  #show heading.where(level: 2): set text(size: 20pt)
  #show heading.where(level: 3): set text(size: 14pt)
  #show heading: it => [
    #show math.equation.where(block: false): math.bold
    #it
  ]

  #set-chapter(chapter)
  #body
]