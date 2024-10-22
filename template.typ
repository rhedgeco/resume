#let default-primary-color = rgb("#fca854")
#let default-secondary-color = rgb("#5bd8c3")

// ICON DEFINITIONS
#import "@preview/fontawesome:0.2.1": fa-icon
#let file-icon = box(
  fa-icon("file"),
)
#let github-icon = box(
  fa-icon("github"),
)
#let linkedin-icon = box(
  fa-icon("linkedin"),
)
#let youtube-icon = box(
  fa-icon("youtube"),
)
#let globe-icon = box(
  fa-icon("globe"),
)

#let file-layout(
  filename: "",
  source: "",
  text-color: rgb("#303030"),
  stroke-color: rgb("#d1d9e0"),
  background-color: rgb("#ffffff"),
  primary-color: default-primary-color,
  secondary-color: default-secondary-color,
  font-size: 10pt,
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
    size: font-size,
  )
  show heading: heading => (
    block(context {
      place(dx: -0.8em, text(fill: text-color.transparentize(50%), link(here(), "#")))
      heading.body
      if heading.level == 1 {
        box(
          width: 1fr,
          line(length: 100%, stroke: 1pt + stroke-color),
        )
      }
    })
  )

  // build page
  block(
    width: 100%,
    spacing: 0pt,
    radius: 0.5em,
    stroke: 1pt + stroke-color,
    {
      // file header
      block(
        width: 100%,
        spacing: 0em,
        {
          // render icon and filename
          box(
            pad(
              bottom: 1pt,
              box(
                stroke: (bottom: 2pt + primary-color),
                pad(bottom: 0.8em - 1pt, rest: 0.8em, [#file-icon #filename]),
              ),
            ),
          )

          // render source button if available
          if source.trim() != "" {
            h(1fr)
            box(
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
          y: 0.8em,
          x: 2em,
          body,
        ),
      )

      // footer
      v(1fr)
      place(
        bottom + right,
        pad(
          rest: 0.5em,
          text(
            size: 0.8em,
            weight: "bold",
            fill: text-color.transparentize(75%),
            [
              Updated #datetime.today().display("[month repr:long] [day], [year]")
            ],
          ),
        ),
      )
    },
  )
}

#let resume_title(
  firstname: "John",
  lastname: "Doe",
  linkedin: "johndoe",
  github: "",
  youtube: "",
  website: "",
  subtitle: "",
  text-color: rgb("#303030"),
  stroke-color: rgb("#d1d9e0"),
  background-color: rgb("#ffffff"),
  primary-color: default-primary-color,
  secondary-color: default-secondary-color,
) = {
  pad(
    top: 2em,
    bottom: 1em,
    align(center)[
      #text(font: "JetBrains Mono", size: 4em, weight: "black", fill: primary-color)[#firstname]
      #text("  ")
      #text(font: "JetBrains Mono", size: 4em, weight: "black", fill: text-color)[#lastname]
      #block(
        radius: 0.25em,
        stroke: 1pt + stroke-color,
        fill: stroke-color.transparentize(50%),
        {
          if linkedin.trim() != "" {
            link(
              "https://www.linkedin.com/in/" + linkedin,
              box(pad(rest: 0.5em, [#linkedin-icon #linkedin])),
            )
          }

          if github.trim() != "" {
            link(
              "https://github.com/" + github,
              box(pad(rest: 0.5em, [#github-icon #github])),
            )
          }

          if youtube.trim() != "" {
            link(
              "https://www.youtube.com/@" + youtube,
              box(pad(rest: 0.5em, [#youtube-icon #youtube])),
            )
          }

          if website.trim() != "" {
            link(
              "https://" + website,
              box(pad(rest: 0.5em, [#globe-icon #website])),
            )
          }
        },
      )

      #if subtitle.trim() != "" {
        subtitle
      }
    ],
  )
}

#let timeline_item(start: str, end: str, body) = [
  #start - #end
  #body
]