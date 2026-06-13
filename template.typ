#import "variable.typ": *

#let check(label-text, content: none) = {
  box(width: 10pt, height: 10pt, stroke: lightborder, baseline: 2pt)
  h(5pt)
  if label-text != none { label-text }
  if content != none { content }
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

#let titleframe(body, title: "", subtitle: "", stroke: heavyborder, inset: tableinset, showframe: true) = {
  stack(
    spacing: linegutter,
    grid(
      columns: (auto, 1fr),
      gutter: linegutter,
      text(weight: "bold")[#title], text(size: textsmall)[#subtitle],
    ),
    if showframe == true [
      #frame(stroke: stroke, inset: inset)[
        #body
      ]
    ] else [
      #body
    ],
  )
}

#let date-box() = {
  box(baseline: 5pt)[
    #grid(
      columns: 14,
      gutter: 2pt,
      char-box(1),
      char-box(1),
      char-box(1),
      char-box(1),
      h(2pt),
      text(size: 12pt)[/],
      h(2pt),
      char-box(1),
      char-box(1),
      h(2pt),
      text(size: 12pt)[/],
      h(2pt),
      char-box(1),
      char-box(1),
      // Last two boxes
    )
  ]
}

#let ip-box-height-long = 12pt
#let ip-box-height-short = 6pt

#let ip-box-seg-long() = {
  box(width: 100%, height: ip-box-height-long, stroke: (left: heavyborder, right: 0pt))
}

#let ip-box-seg-short() = {
  box(width: 100%, height: ip-box-height-short, stroke: (left: lightborder, right: lightborder))
}

#let ipv4-box(width: 100%) = {
  box(width: width, height: ip-box-height-long, stroke: (bottom: heavyborder, left: heavyborder, right: heavyborder))[
    #grid(
      columns: 12,
      align: bottom + center,
      ..range(12).map(i => if calc.rem(i, 3) == 0 { ip-box-seg-long() } else { ip-box-seg-short() })
    )
  ]
}

#let ipv6-box(width: 100%) = {
  box(width: width, height: ip-box-height-long, stroke: (bottom: heavyborder, left: heavyborder, right: heavyborder))[
    #grid(
      columns: 32,
      align: bottom + center,
      ..range(32).map(i => if calc.rem(i, 4) == 0 { ip-box-seg-long() } else { ip-box-seg-short() })
    )
  ]
}

#let footer(formcode: none) = {
  [
    #box(width: 100%, stroke: lightborder, inset: 10pt)[
      #footertext
    ]
    #place(
      bottom + center,
      text(size: textsmall, weight: "bold")[ [End of Document] ],
    )
  ]
}

#let apply-template(formcode: none, body) = {
  set page(
    paper: "a4",
    margin: (x: 0.8cm, y: 0.8cm, top: 3cm),
    header: context [
      #grid(
        columns: (auto, 1fr),
        align: (left + top, right + top),
        [
          #title()
          #text(size: textexsmall)[Only used for *#ownas.join("/")*] \
          #text(size: textexsmall)[_(Available at github.com/YukariChiba/peering-form)_]
        ],
        [
          #if formcode != none [*Form:* #text(size: 18pt)[*#formcode* \ ]]
          ( Rev. #version ) \
          _[Page #counter(page).display()]_
        ],
      )
    ],
    background: [
      #if preview [
        #rotate(24deg, [
          #text(128pt, fill: rgb("CCCCCC"))[*PREVIEW*]
          #text(48pt, fill: rgb("CCCCCC"))[*Not For Production*]
        ])
      ]
    ],
  )

  set text(font: globalfont, size: textnormal, lang: "en")

  set heading(numbering: "1")

  show title: it => block(
    text(size: 20pt, weight: "bold")[#it],
    above: 8pt,
    below: 8pt,
  )

  show heading.where(level: 1): it => block(
    above: 8pt,
    below: 8pt,
    grid(
      columns: (auto, auto),
      gutter: linegutter,
      align: horizon,
      box(
        fill: black,
        inset: 2pt,
        text(fill: white, weight: "bold", size: 12pt)[Part #counter(heading).display()],
      ),
      text(weight: "bold", size: 12pt)[#it.body],
    ),
  )
  body
}
