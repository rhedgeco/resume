#import "template.typ": *

#set text(size: 10.2pt)
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
  subtitle: "Software Engineer - Bay Area - 1(408) 834-3376 - rhedgeco@gmail.com",
  theme: theme,
)

= Professional Skills
- *Programming Languages* - Proven fluency in *Rust, C\#, Python, Java, JavaScript/Typescript*.
- *Development Experience* - 7+ years of professional development experience working on large systems.
- *Tooling* - Experienced a range of tools including: *linux, git, osx, windows, git-actions and other CI*.

= Work Experience
- *Senior Rust Developer* - #link("https://ford.com")[*Ford*] \ May25 - Present
  - Designed, implemented, and tested system critical vehicle infrastructure using rust.
    - _additional details pending vehicle launch..._

- *Software Engineer* - #link("https://tech.walmart.com")[*Walmart Labs*] \ Oct24 - Apr25
  - Designed and contributed to emerging `rust` backend systems for Walmart and Sams Club.
  - Performed deployment and performance testing of large distributed rust projects.

- *Software Consultant*\ Nov22 - Oct24
- *Software Engineer* - #link("https://www.komprise.com/")[*Komprise*]\ Oct21 - Aug22
  - Contributed to and built critical data migration infrastructure using Java.
  - Assessed customer issues in real time to push sensitive patches.
  - Solved integration issues between on-premises system hardware and cloud infrastructure.

- *Software Development Intern* - #link("https://www.elekta.com/")[*Elekta*]\ May21 - Oct21
  - Built analytics tooling in C\# for internal database management of patient data.
  - Constructed new database integrations and built a new GraphQL backend layer.

- *Software Engineer* - #link("https://aotu.ai/")[*aotu.ai*]\ Oct18 - May21
  - Lead engineer building a synthetic rendering platform #link("https://aotu.ai/synthall")[Synthall] using C\#, python, and Unity Engine.
    - Used to generate synthetic training data for AI machine learning inference models.


= Education
*San Jose State University* - Software Engineering

= Passion Projects
- #link("https://github.com/rhedgeco/wayne")[wayne] - An attempt at re-imagining a wayland API in rust.
- #link("https://github.com/rhedgeco/boba-engine")[boba-engine] - A modern game engine written in rust.
- #link("https://github.com/rhedgeco/boba-script")[boba-script] - A domain specific language for my game engine built in rust.
- #link("https://github.com/rhedgeco/Synthic")[Synthic] - A real-time audio synthesis engine built for Unity.
- #link("https://github.com/rhedgeco/imposters")[imposters] - A rust library for creating and managing type erased item collections.
- #link("https://github.com/rhedgeco")[See more on github...]
