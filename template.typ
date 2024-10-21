// GLOBAL COLOR DEFINITIONS
#let primary-color = rgb("#ff8104")
#let secondary-color = rgb("#249ea0")
#let text-color = rgb("#303030")
#let stroke-color = rgb("#d1d9e0")
#let background-color = rgb("#ffffff")

// ICON DEFINITIONS
#import "@preview/fontawesome:0.2.1": fa-icon
#let file-icon = box(
  fa-icon("file"),
)
#let github-icon = box(
  fa-icon("github"),
)

#let file-layout(
  filename: "",
  source: "",
  toc: false,
  body,
) = {
  let filename = filename.trim()
  if filename.trim() == "" {
    filename = "untitled"
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

  show heading: head => {
    link(here(), box("# "))
    box(head)
  }

  // build page
  box(
    width: 100%,
    radius: 0.5em,
    stroke: 1pt + stroke-color,
    {
      // file header
      block(
        width: 100%,
        spacing: 0em,
        {
          pad(
            bottom: 1pt,
            box(
              stroke: (
                bottom: 2pt + primary-color,
              ),
              pad(
                rest: 0.8em,
                {
                  file-icon
                  "  "
                  filename
                },
              ),
            ),
          )
          if source.trim() != "" {
            place(
              horizon + right,
              pad(
                rest: 0.3em,
                link(
                  source,
                  box(
                    radius: 0.25em,
                    fill: secondary-color.transparentize(80%),
                    pad(rest: 0.5em, [View Source #github-icon]),
                  ),
                ),
              ),
            )
          }
        },
      )
      line(length: 100%, stroke: 1pt + stroke-color)

      // file body
      block(
        width: 100%,
        spacing: 0em,
        pad(
          rest: 0.8em,
          {
            // render table of contents
            if toc {
              place(
                top + right,
                block(
                  radius: 0.25em,
                  fill: primary-color.transparentize(80%),
                  pad(
                    rest: 0.5em,
                    context {
                      set align(left)
                      let headings = query(heading)
                      for heading in headings {
                        if heading.depth == 1 {
                          link(
                            heading.location(),
                            block(spacing: 0pt, [\# #heading.body]),
                          )
                        } else {
                          text(size: 0.8em, block([#heading.body]))
                        }
                      }
                    },
                  ),
                ),
              )
            }

            // render the rest of the body
            body
          },
        ),
      )
    },
  )

  // footer
  text(
    size: 0.8em,
    weight: "bold",
    fill: text-color.transparentize(75%),
    [Updated #datetime.today().display("[month repr:long] [day], [year]")],
  )
}

#let resume_title(
  firstname: "John",
  lastname: "Doe",
  dark: false,
) = {
  "Hello World"
}