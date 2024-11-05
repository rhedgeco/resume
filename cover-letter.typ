#import "template.typ": *

#set text(size: 10.5pt)
#let theme = light-theme()
#let theme = dark-theme()
#show: file-layout.with(
  filename: "cover-letter.typ",
  source: "https://github.com/rhedgeco/resume/blob/main/cover-letter.typ",
  theme: theme,
)

#cover_letter_title(
  firstname: "RYAN",
  lastname: "HEDGECOCK",
  linkedin: "rhedgeco",
  github: "rhedgeco",
  youtube: "rhedgeco",
  website: "hedgecock.dev",
  subtitle: "Software Engineer - Bay Area - US Citizen - 1 (408) 834-3376 - rhedgeco@gmail.com",
  theme: theme,
)

= About Me

I started writing code when I was about 10 years old. I was initially interested because I loved the idea of being able to make a video game that people could play. At the time I was really interested in drawing and art and I thought making a game would be the same as drawing a bunch of pictures or making a video. I came to find out that it was definitely an art, but to my great suprise it was so much more than I had ever dreamed. I fell down the rabbit hole from there.

My professional journey as a software engineer started shortly after high-school after being recruited
by a #link("https://aotu.ai")[machine learning startup]. I was lucky because the people there could see my talent and put me in charge of R&D for developing a #link("https://aotu.ai/en/synthall/")[platform] for generating synthetic training data for vision models. Unfortunately at some point we started running out of money and I had to step down. From there I worked briefly in medical tech, and enjoyed my time at #link("https://www.komprise.com/")[another startup] working on backend services for cloud data migration.
