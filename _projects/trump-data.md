---
layout: project_layout
title: DOGE Track
published: true
start_year: 2025
---
The second Trump Presidency has been a whirlwind of chaos in Washington. It's been hard keeping track of all that is being damaged and lost within the federal government. Emboldened by Musk and the absence of oversight, the so-called "Department of Government Efficiency" (DOGE) has been rampaging through agencies to subvert their security, cancel contracts, fire staff and siphon up confidential data into large data warehouses. It's going to take years to both undo the damage and to ensure that breaking the law will be met with consequences.

As someone who has spent the past decade of my live in [Civic Tech]({% link _projects/civic-tech.md %}), this has been extremely demoralize to watch. Not only are they destroying vital government services, they're undermining the idea that technology can serve the public good. I feel compelled to bear witness to this moment. But, I'm not particularly good at writing commentary. I'm no longer adjacent enough to journalism that I can report on what is happening. However, I do enjoy working with data and seeing what patterns will emerge over time from data collection and analysis.

And so, I created a new GitHub repo named [**trump_data**](https://github.com/harrisj/trump_data) on February 8th, 2025. And then, I started collecting data. The first datasets were relatively modest in scope:

- I wrote a script for pulling data from the [Just Security Litigation Tracker](https://www.justsecurity.org/107087/tracker-litigation-legal-challenges-trump-administration/) to see how cases changed over time
- I created a dataset for tracking Trump's trips to one of his various properties and what days he went golfing. This turned out to be easier to just hand-edit rather than write a scraper for it. More recently, [John Emerson](https://github.com/bcks) contributed an automated scraper to find the golf dates so I don't need to update those manually
- I added a table of CSV data recording the population at the concentration camp in Guantanamo Bay that Trump promised to create for immigration detention
- I started collecting the weekly unemployment reports to see if it would start showing a surge in unemployment for federal employees

My biggest project within the repository has turned out to be an evolving effort to track the activities of DOGE's ["IT Modernization"](https://github.com/harrisj/trump_data/tree/main/it_modernization) efforts across the federal government. Practically every single example of DOGE's smash-and-grab assaults on a given federal agency starts with the lie that they're just there to help the agency with "IT modernization" before they quickly escalate their privileges, lock out staff, cancel contracts and fire much of the staff. I was tired of how much they operated in the shadows, so I started collecting data from news sources of their activities.

## Evolving the IT Modernization Dataset

It started simply enough as a single [YAML](https://en.wikipedia.org/wiki/YAML) file, with the following basic structure:

```yaml
- agency: Centers for Medicare and Medicaid Services
  acronym: CMS
  date_started: 2025-02-05
  date_completed:
  participants:
  - Luke Farritor
  vandalism:
  systems:
  - name: CMS Acquisition Lifecycle Management system
    acronym: CALM
    description: System for tracking CMS acquisitions, contracts, milestones and audits.
  sources:
  - https://www.msn.com/en-us/money/general/doge-targets-u-s-health-agencies-gains-access-to-payment-systems/ar-AA1yu5OD
  - https://www.cms.gov/newsroom/press-releases/cms-statement-collaboration-doge
  - https://www.wsj.com/politics/elon-musk-doge-medicare-medicaid-fraud-e697b162
```

I just wanted to track who was at each agency and what was happening. I chose YAML because it is a data format that is designed for machine-processing but it is also meant to be somewhat readable for non-technical people if they wanted to also read the data From there, I have kept evolving both the types of data I'm collecting and the systems for keeping track of it all with a variety of iterations:

- I added an `events` field where I started listing the dates and details of specific events, always with a linked source for attribution and reconstruction
- I added a `named` field to the `event` structure to record when specific DOGE staff were associated with events
- I added a `roundups` section for listing when news sites published roundups of who is where. I also started recording more info for systems.
- To make it more accessible to non-programmers, I built a script to create a CSV version of events that could be loaded in Excel
- While working on that, I discovered that I had made some formatting errors in the YAML file and I was sometimes inconsistent with field names. So, I created a [JSON Schema](https://json-schema.org/) file to validate the YAML so my editor could tell me when I was introducing errors.
- I then extended that YAML schema to also include Enumerated field types for the DOGE names so I would never have to worry about keeping it consistent for people (_e.g._, Mike Russo in one place and Michael Russo in other places). I used that for also validating agency abbreviations and system acronyms.
- I added a `type` field and defined several basic event types so I could differentiate between things like "DOGE staff were spotted at an agency" from "a specific DOGE staffer was granted access to several systems" or "a person was detailed form one agency to another"
- I added support for [imprecise dates](https://www.datafix.com.au/BASHing/2020-02-12.html), so I would be able to better represent the fuzziness of a news article reporting that something happened "late last week" vs. an exact date

At this point, the YAML looked more like this for a single agency

```yaml
- name: Department of the Interior
  acronym: DOI
  roundups:
  - source: https://www.nytimes.com/interactive/2025/02/27/us/politics/doge-staff-list.html
    organization: The New York Times
    named:
    - Tyler Hassen
  - source: https://projects.propublica.org/elon-musk-doge-tracker/
    organization: ProPublica
    named:
    - Tyler Hassen
  - source: https://www.wired.com/story/elon-musk-doge-silicon-valley-corporate-connections/
    organization: Wired Magazine
    date: 2025-03-28
    named:
    - Tyler Hassen
  events:
  - date: 2025-01-28
    type: disruption
    event: Two DOGE staffers attempted to force water pumps to be turned on in a large reservoir in California for a photo op
    named:
    - Tyler Hassen
    - Bryton Shang
    source: https://www.cnn.com/2025/03/07/climate/trump-doge-california-water/index.html
  - date: 2025-02-24
    type: onboarded
    onboard_type: detailed
    event: Stephanie Holmes is detailed to the Department of the Interior as a Special Advisor and acting Chief Human Capital Officer for the entire agency
    detailed_from: DOGE
    named:
    - Stephanie Holmes
    source: https://subscriber.politicopro.com/article/eenews/2025/03/05/heres-the-people-connected-to-doge-at-interior-00213330
  - date: 2025-03-04
    type: disruption
    event: DOGE boasts in a tweet that 27% more water was released in February compared to January (unclear if this adjusts for different lengths of months)
    source: https://xcancel.com/DOGE/status/1896948512975433787
  - date: 2025-03-07
    type: promotion
    event: Tyler Hassen is promoted to Acting Assistant Secretary of Policy, Management and Budget
    named:
    - Tyler Hassen
    source: https://www.eenews.net/articles/doge-official-appointed-head-of-policy-at-interior/
  - date: 2025-03-28
    type: report
    event: Expressing concerns about DOGE requesting access to FPPS, the CIO and CISO of the Department of the Interior present a memo to the Interior Secretary about the risks for him to acknowledge and sign. He doesn't sign it
    source: https://www.nytimes.com/2025/03/31/us/politics/doge-musk-federal-payroll.html
  - date: 2025-03-28
    type: disruption
    event: Tyler Hassen places the CIO and CISO on admininstrative leave under investigation for raising alarm about DOGE access
    named:
    - Tyler Hassen
    source: https://www.nytimes.com/2025/03/31/us/politics/doge-musk-federal-payroll.html
  - date: 2023-03-29
    event: Two DOGE staffers are granted admin access to the FPPS payroll system at the Department of the Interior
    type: access_granted
    access_type: admin
    access_systems:
    - FPPS
    named:
    - Stephanie Holmes
    - Katrine Trampe
    source: https://www.nytimes.com/2025/03/31/us/politics/doge-musk-federal-payroll.html
  systems:
  - name: Federal Personnel Payroll System
    id: FPPS
    description: A shared service which processes payrolls for the Justice, Treasury and Homeland Security departments, as well as the Air Force, Nuclear Regulatory Commission and the U.S. Customs and Border Protection, among other federal agencies.
    risk: PII and payment info for federal staff at several large agencies, including the ability to interfere with pay
    pia: https://www.doi.gov/sites/doi.gov/files/fpps-pia-revised-04222020_0.pdf
  cases:
  - name: Center for Biological Diversity v. U.S. Department of Interior (D.D.C.)
    description: Plaintiffs, a nonprofit organization focused on habitat preservation for endangered species, alleges that DOGE and the Department of Interior have violated the Administrative Procedures Act by failing to follow Federal Advisory Committee Act (FACA) requirements
    case_no: 1:25-cv-00612
    date_filed: 2025-03-03
    link: https://www.courtlistener.com/docket/69698261/center-for-biological-diversity-v-us-department-of-interior/
```

But it was starting to get more unwieldy to edit. And sometimes, when I was dealing with a single event that affected multiple agencies for instance, I would need to duplicate and move content around. It made it harder to ensure everything was consistent. So, the next big step was to define a workflow where I would edit raw data and then a pre-commit hook could be used to regenerate files downstream. Under this model, I defined a few files with basic types that I can then join into more complicated data structures.

From this information, I can then use the [raw data](https://github.com/harrisj/trump_data/tree/main/it_modernization/raw_data) to create files that are derived from processing the source files and combining information. My process starts by making sure the events table is sorted and I can then output an events table with some other information joined in. Using this, I can also generate other files like `postings.yaml` which records the durations and locations of various DOGE staff or `people.yaml` which groups events by each person.

Since then, I have expanded the approach to collect even more data:

- Details are where I record any information I could gather on federal details where staff from one agency goes to work for another. This is one of DOGE's favorite tactics for obfuscation.
- Aliases. In some cases like court filings or early reporting, specific people aren't named, but it is possible to identify them by other factors and information. I modified it so I could specify `named_aliases` for events and if I were confident enough to say "SSA-2 is Scott Coulter", then the processed version of the Events data would put his real info in.
- Charts. I even decided to use the built-in Gantt charting that's in [Mermaid](https://mermaid.js.org/) so I could visually display when DOGE is at specific agencies or what specific staff have been doing over time. It's still very imprecise, because I only have definitive onboarding and offboarding dates for a few DOGE staffers at agencies when it's provided in [legal declarations for court cases](https://storage.courtlistener.com/recap/gov.uscourts.dcd.277150/gov.uscourts.dcd.277150.73.2.pdf), but it does give me a rough idea of who is where.

My daily routine now is to run a few searches on Google News when I have some spare time on queries like "DOGE when:1d" to give me results from the last 24 hours. When I find new articles, I scan them to see if there are relevant details on specific people, systems or agencies and add it to the `events.yaml` or other files. I have an automated process that then runs on my laptop and generates changes to other files based on the new information. Occasionally, I also look at cases to see if there are new filings or I will look at some of my files to see if there are agencies or people for whom I have limited information (_e.g._, I still have very little visibility into what has been happening at SBA and I only recently found information on Frank Schuler). More information invariably just leads to more questions, but at least they are better ones.

## DOGE Track

YAML is nice, but YAML is still not approachable for people with non-technical skills. More importantly, it also doesn't allow me to easily present the data clearly in multiple ways. The next step in the evolution of the project was to make a website. So that's what I did and it's **live now (in a beta form) at [dogetrack.info](https://dogetrack.info/).**

The IT Modernization data is an interesting dataset because it doesn't contain any user-supplied information (what we would call _state_, things like your username, posts, etc.) And the data is updated relatively infrequently (perhaps several times a day). This makes it the perfect candidate for a statically-generated site. These are sites where all the pages are programmatically built at deploy time and saved to disk where they can be served. That mode was how the web used to be originally, but it has now been supplanted by the [LAMP stack](https://en.wikipedia.org/wiki/LAMP_(software_bundle)) or similarly named variants where each request from a user is handled by a server-side program which runs some code and talks to a database. The dynamic approach quickly become predominant because it offers so much more flexibility in terms of customizing responses to the user or presenting data that is changing all the time, but it also means additional complexity (more things needed to run it which means more things that can break) as well as additional costs (at least one or more servers needs to be running with an associated database backend). Static sites on the other hand are dirt cheap and nearly impossible to break (if anything breaks, it happens during deployment so public site just stays the same and isn't updated with new content).

I have written a more [in-depth deep dive of the technology on the new site](https://dogetrack.info/about/this-data/) and technical completists are also welcome to browse [the public source code](https://github.com/harrisj/doge_track) to see how it fits together. It's been challenging at times, but I have really enjoyed how this project has evolved from a single YAML file to an entire workflow that creates a fully-browsable website. And I hope it will continue to shine a light into the darkness of DOGE's activities.
