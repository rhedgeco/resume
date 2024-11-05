#let default-primary-color = rgb("#fca854")
#let default-secondary-color = rgb("#5bd8c3")

// define default themes
#let light-theme(
  primary: default-primary-color,
  secondary: default-secondary-color,
) = {
  (
    text-color: rgb("#303030"),
    stroke-color: rgb("#d1d9e0"),
    background-color: rgb("#ffffff"),
    primary-color: primary,
    secondary-color: secondary,
  )
}
#let dark-theme(
  primary: default-primary-color,
  secondary: default-secondary-color,
) = {
  (
    text-color: rgb("#c6c6c6"),
    stroke-color: rgb("#2b2b2b"),
    background-color: rgb("#1f1f1f"),
    primary-color: primary,
    secondary-color: secondary,
  )
}
#let default-theme = light-theme()

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
  theme: default-theme,
  body,
) = {
  let filename = filename.trim()
  if filename.trim() == "" {
    filename = "untitled"
  }

  // set default page and text settings
  set page(
    paper: "us-letter",
    fill: theme.background-color,
    margin: 1em,
  )
  set text(
    fill: theme.text-color,
    font: "Noto Sans",
  )
  show heading: heading => (
    block(context {
      place(dx: -0.8em, link(here(), text(fill: theme.primary-color)[\#]))
      heading.body
      if heading.level == 1 {
        box(
          width: 1fr,
          pad(left: 0.25em, line(length: 100%, stroke: 1pt + theme.stroke-color)),
        )
      }
    })
  )

  // build page
  block(
    width: 100%,
    spacing: 0pt,
    radius: 0.5em,
    stroke: 1pt + theme.stroke-color,
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
                stroke: (bottom: 2pt + theme.primary-color),
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
                    fill: theme.secondary-color.transparentize(80%),
                    pad(rest: 0.5em, [View Source #github-icon]),
                  ),
                ),
              ),
            )
          }
        },
      )
      line(length: 100%, stroke: 1pt + theme.stroke-color)

      // file body
      show link: set text(fill: theme.secondary-color)
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
            fill: theme.text-color.transparentize(75%),
            [
              Updated #datetime.today().display("[month repr:long] [day], [year]")
            ],
          ),
        ),
      )
    },
  )
}

#let title_content(
  firstname: "John",
  lastname: "Doe",
  linkedin: "johndoe",
  github: "",
  youtube: "",
  website: "",
  subtitle: "",
  theme: default-theme,
) = [
  #text(font: "JetBrains Mono", size: 4em, weight: "black", fill: theme.primary-color)[#firstname]
  #text("  ")
  #text(font: "JetBrains Mono", size: 4em, weight: "black", fill: theme.text-color)[#lastname]

  #if subtitle.trim() != "" {
    subtitle
  }
  #block(
    radius: 0.25em,
    stroke: 1pt + theme.stroke-color,
    fill: theme.stroke-color.transparentize(50%),
    {
      show link: set text(fill: theme.text-color)
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
]

#let resume_title(
  firstname: "John",
  lastname: "Doe",
  linkedin: "johndoe",
  github: "",
  youtube: "",
  website: "",
  subtitle: "",
  theme: default-theme,
) = {
  pad(
    top: 2em,
    bottom: 1em,
    align(center)[
      #title_content(
        firstname: firstname,
        lastname: lastname,
        linkedin: linkedin,
        github: github,
        youtube: youtube,
        website: website,
        subtitle: subtitle,
        theme: theme,
      )
    ],
  )
}

#let cover_letter_title(
  firstname: "John",
  lastname: "Doe",
  linkedin: "johndoe",
  github: "",
  youtube: "",
  website: "",
  subtitle: "",
  theme: default-theme,
) = {
  block(
    height: 10em,
    pad(
      top: 2em,
      {
        place(
          top + left,
          box(
            width: 8em,
            height: 8em,
            radius: 2em,
            clip: true,
            stroke: 1pt + theme.primary-color,
            image("profile.jpg"),
          ),
        )
        pad(
          left: 9em,
          title_content(
            firstname: firstname,
            lastname: lastname,
            linkedin: linkedin,
            github: github,
            youtube: youtube,
            website: website,
            subtitle: subtitle,
            theme: theme,
          ),
        )
      },
    ),
  )
}