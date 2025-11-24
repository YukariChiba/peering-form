#import "variable.typ": *

#let check(label-text, content: none) = {
  box(width: 10pt, height: 10pt, stroke: lightborder, baseline: 2pt)
  h(5pt)
  if label-text != none { label-text }
  if content != none { content }
}

#let section-header(title) = {
  grid(
    columns: (auto, 1fr),
    gutter: 5pt,
    text(size: 12pt)[#sym.diamond.filled],
    text(weight: "bold", size: 12pt)[#title]
  )
}

#let char-box(count, size: charboxnormal, border: lightborder) = {
  for i in range(count) {
    box(width: size, height: size * 1.2, stroke: border, baseline: 2pt)
  }
}

#let underline-field(width: 1fr, stroke-style: lightborder) = {
  box(width: width, stroke: (bottom: stroke-style), baseline: 2pt, inset: (bottom: 2pt))[]
}

#let frame(body, stroke: heavyborder, inset: tableinset) = {
  table(
    columns: 1fr,
    stroke: stroke,
    inset: inset,
    body
  )
}

#let titleframe(body, title: "", subtitle: "", stroke: heavyborder, inset: tableinset) = {
    stack(
      grid(
        columns: (auto, 1fr),
        gutter: linegutter,
        text(weight: "bold")[#title],
        text(size: textsmall)[#subtitle]
      ),
      spacing: linegutter,
      frame(stroke: stroke, inset: inset)[
        #body
      ]
  )
}

#let date-box() = {
  box(baseline: 5pt)[
    #grid(
      columns: 14,
      gutter: 2pt,
      char-box(1), char-box(1), char-box(1), char-box(1),
      h(2pt),
      text(size: 12pt)[/],
      h(2pt),
      char-box(1), char-box(1),
      h(2pt),
      text(size: 12pt)[/],
      h(2pt),
      char-box(1), char-box(1) // Last two boxes
    )
  ]
}

#let ip-box-height-long = 12pt
#let ip-box-height-short = 6pt

#let ip-box-seg-long() = {
  box(width: 100%,height: ip-box-height-long, stroke: (left: heavyborder, right: 0pt))
}

#let ip-box-seg-short() = {
  box(width: 100%,height: ip-box-height-short, stroke: (left: lightborder, right: lightborder))
}

#let ipv4-box(width: 100%) = {
  box(width: width, height: ip-box-height-long, stroke: (bottom: heavyborder, left: heavyborder, right: heavyborder))[
    #grid(
        columns: 12,
        align: bottom + center,
        ip-box-seg-long(),
        ip-box-seg-short(),
        ip-box-seg-short(),
        ip-box-seg-long(),
        ip-box-seg-short(),
        ip-box-seg-short(),
        ip-box-seg-long(),
        ip-box-seg-short(),
        ip-box-seg-short(),
        ip-box-seg-long(),
        ip-box-seg-short(),
        ip-box-seg-short(),
    )
  ]
}

#let ipv6-box(width: 100%) = {
  box(width: width, height: ip-box-height-long, stroke: (bottom: heavyborder, left: heavyborder, right: heavyborder))[
    #grid(
        columns: 32,
        align: bottom + center,
        ip-box-seg-long(),
        ip-box-seg-short(),
        ip-box-seg-short(),
        ip-box-seg-short(),
        ip-box-seg-long(),
        ip-box-seg-short(),
        ip-box-seg-short(),
        ip-box-seg-short(),
        ip-box-seg-long(),
        ip-box-seg-short(),
        ip-box-seg-short(),
        ip-box-seg-short(),
        ip-box-seg-long(),
        ip-box-seg-short(),
        ip-box-seg-short(),
        ip-box-seg-short(),
        ip-box-seg-long(),
        ip-box-seg-short(),
        ip-box-seg-short(),
        ip-box-seg-short(),
        ip-box-seg-long(),
        ip-box-seg-short(),
        ip-box-seg-short(),
        ip-box-seg-short(),
        ip-box-seg-long(),
        ip-box-seg-short(),
        ip-box-seg-short(),
        ip-box-seg-short(),
        ip-box-seg-long(),
        ip-box-seg-short(),
        ip-box-seg-short(),
        ip-box-seg-short(),
    )
  ]
}
