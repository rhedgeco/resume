// GLOBAL COLOR DEFINITIONS
#let text-dark = rgb("#303030")
#let text-light = rgb("#c7c7c7")
#let primary-color = rgb("#ff8104")
#let secondary-color = rgb("#249ea0")
#let background-dark = rgb("#1f1f1f")
#let background-light = rgb("#ffffff")
#let stroke-dark = rgb("#2b2b2b")
#let stroke-light = rgb("#d1d9e0")

// ICON DEFINITIONS
#import "@preview/fontawesome:0.2.1": fa-icon
#let file-icon = box(
  fa-icon("file"),
)
#let github-icon = box(
  fa-icon("github"),
)

#let github_file(
  dark: false,
  filename: "",
  source: "",
  body,
) = {
  let filename = filename.trim()
  if filename.trim() == "" {
    filename = "untitled"
  }

  // set colors based on theme
  let text-color = text-dark
  let background-color = background-light
  let stroke-color = stroke-light
  if dark {
    text-color = text-light
    background-color = background-dark
    stroke-color = stroke-dark
  }

  // set default page and text settings
  set page(
    paper: "us-letter",
    fill: background-color,
    margin: 1em,
  )
  set text(
    fill: text-color,
    font: "Noto Sans",
    size: 10pt,
  )

  // build page
  block(
    width: 100%,
    height: 100%,
    stroke: 1pt + stroke-color,
    radius: 0.5em,
    {
      // file header
      block(
        width: 100%,
        spacing: 0em,
        pad(
          rest: 0.3em,
          {
            pad(
              rest: 0.5em,
              {
                file-icon
                "  "
                filename
              },
            )
            if source.trim() != "" {
              place(
                horizon + right,
                link(
                  source,
                  box(
                    radius: 0.25em,
                    fill: secondary-color.transparentize(80%),
                    pad(rest: 0.5em, "View Source " + github-icon),
                  ),
                ),
              )
            }
          },
        ),
      )
      line(length: 100%, stroke: 1pt + stroke-color)

      // file body
      block(spacing: 0em, pad(rest: 0.8em, body))
    },
  )
}
