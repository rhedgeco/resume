#import "template.typ": *

#show: file-layout.with(
  filename: "resume.typ",
  source: "https://github.com/rhedgeco/resume/blob/main/resume.typ",
)

#resume_title(
  firstname: "RYAN",
  lastname: "HEDGECOCK",
  linkedin: "rhedgeco",
  github: "rhedgeco",
  youtube: "rhedgeco",
  website: "hedgecock.dev",
  subtitle: "Software Engineer - Bay Area - US Citizen",
)

= Objective
Software Development Engineer

= Education
*San Jose State University* - Software Engineering - 2024

= Work Experience
#timeline_item(start: "hello", end: "world")[
  hello world
]