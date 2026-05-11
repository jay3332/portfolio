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
#let st = $mid(|)$
#let evaluated(expr, size: 100%) = $lr(#expr|, size: #size)$

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

#let lgreen = line(length: 100%, stroke: rgb("#108010"))
#let lorange = line(length: 100%, stroke: orange)
#let lblue = line(length: 100%, stroke: blue)

#let lthin = line(length: 100%, stroke: 0.5pt)
#let lthick = line(length: 100%, stroke: 1.0pt)
#let ldouble = stack(
  line(length: 100%, stroke: 1.0pt),
  line(length: 100%, stroke: 1.0pt),
  spacing: 2pt,
)

#let th = super[th]

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
  
  // #show: it => context {
  //   if target() == "paged" {
  //     _t.generic(it)
  //   } else {
  //     it
  //   }
  // }

  #show math.equation.where(block: false): it => {
    if target() == "html" {
      html.elem("span", attrs: (role: "math"), html.frame(it))
    } else {
      it
    }
  }

  #show math.equation.where(block: true): it => {
    if target() == "html" {
      html.elem("figure", attrs: (role: "math"), html.frame(it))
    } else {
      it
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
      let style = if it.alignment == "center" {
        "text-align: center;"
      } else if it.alignment == "right" {
        "text-align: right;"
      } else {
        ""
      }
      html.elem("div", attrs: (style: style), html.frame(it))
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