#import "template.typ": *

#set text(size: 9pt)
#let theme = light-theme()
#let theme = dark-theme()
#show: file-layout.with(
  filename: "resume.typ",
  source: "https://github.com/rhedgeco/resume/blob/main/resume.typ",
  theme: theme,
)

#resume_title(
  firstname: "RYAN",
  lastname: "HEDGECOCK",
  linkedin: "rhedgeco",
  github: "rhedgeco",
  youtube: "rhedgeco",
  website: "hedgecock.dev",
  subtitle: "Software Engineer - Bay Area - US Citizen - 1 (408) 834-3376 - rhedgeco@gmail.com",
  theme: theme,
)

= Objective
Software Development Engineer

= Education
*San Jose State University* - Software Engineering - 2024

= Work Experience
#timeline_item(end: "Present", title: "Software Consultant", theme: theme)[]
// #timeline_item(
//   start: "Oct21",
//   end: "Aug22",
//   title: "Software Engineer",
//   company: "Komprise",
//   link: "https://www.komprise.com/",
// )[]
