---
layout: project_layout
title: Times Haiku
start_year: 2012
end_year: 2017
category: project
---
This project largely happened because I was depressed and bored.

It was always a bit rough to end a season of election coverage. After spending almost more than a year testing, tweaking and [loading election results]({% link _projects/nytimes-election-loader.md %}), it's disorienting to suddenly have no more election stuff to do. In 2012, this shock was compounded with frustration from several significant technical bugs that had happened on election night itself. I needed an outlet. And that's when I decided to go hunting for haiku.

![An example of the visual Times Haiku presentation](/static/images/projects/times-haiku/symmetry.gif)

I had been inspired by the [Haiku Leaks](https://www.poetryfoundation.org/poetry-news/59602/leaks-come-in-all-shapes-and-sizes) project in late 2010, that combed the Wikileaks Cablegate corpus to find haiku hidden within the messages. And I had already written a few [silly bots that acted on NYT article text]({%link _projects/various-bots.md %}). So, why not combine the two?

The initial seed of this project was a hackish selection of a few Ruby scripts and a database to assemble the following building blocks into a haiku-finding machine:
- First, I needed a database to store the haiku I found, but also to help me lookup the syllable counts for specific words. To seed that database, I wrote a script to pull words and count syllables in the [CMUdict](http://www.speech.cs.cmu.edu/cgi-bin/cmudict)
- I also had some handy code to pull out the text after retrieving a NYT article page.
- The next step was writing some code to scan the text for haikus. It did this first by breaking up the text into a series of sentences and then it went through each sentence counting syllables to see if we got exactly 5-7-5.
- Finally, I created some code to regularly check the homepage and when it found a URL it hadn't seen before, it would fetch the article, scan it for haikus and store any haiku it had seen as well as a record that it had processed the page.

Put that all togther and I had a little program I could run on my computer that would go searching for haiku and sharing them with me. When I showed this to some of my coworkers on the 


## Explainer that Appeared on the Times Haiku Site
Whimsy is not a quality we usually associate with computer programs. We tend to think of software in terms of the function it fulfills. For example, a spreadsheet helps us do our work. A game of Tetris provides a means of procrastination. Social media reconnects us with our high school nemeses. But what about computer code that serves no inherent purpose in itself?

```
There is pleasure to
be had here, in flares of spice
that revive and warm.
```

This is a Tumblr blog of haikus found within The New York Times. Most of us first encountered haikus in a grade school, when we were taught that they are three-line poems with five syllables on the first line, seven on the second and five on the third. According to the Haiku Society of America, that is not an ironclad rule. A proper haiku should also contain a word that indicates the season, or “kigo,” as well as a juxtaposition of verbal imagery, known as “kireji.” That's a lot harder to teach an algorithm, though, so we just count syllables like most amateur haiku aficionados do.

```
As dawn broke we warmed
strawberry Pop Tarts over
the dying embers.
```

How does our algorithm work? It periodically checks the New York Times home page for newly published articles. Then it scans each sentence looking for potential haikus by using an electronic dictionary containing syllable counts. We started with a basic rhyming lexicon, but over time we've added syllable counts for words like “Rihanna” or “terroir” to keep pace with the broad vocabulary of The Times.

Not every haiku our computer finds is a good one. The algorithm discards some potential poems if they are awkwardly constructed and it does not scan articles covering sensitive topics. Furthermore, the machine has no aesthetic sense. It can't distinguish between an elegant verse and a plodding one. But, when it does stumble across something beautiful or funny or just a gem of a haiku, human journalists select it and post it on this blog.

```
Stop the machine and
scrape down the sides of the bowl
with a spatula.
```

Finding the haikus is only the beginning. Because we want the poems to retain their visual integrity, even when people share them across social networks, we post them as images instead of text. On every image, you’ll notice a seemingly random background pattern of colored lines. The different orientations of those lines are computer-generated according to the meter of the first line of the poem.

So, what's next? This experiment in automated poetry detection has only just begun. We’ll fine-tune the algorithm, expand the dictionary and see what treasures we find. We hope you’ll follow along.

## Launch and Reception

[Nieman Lab coverage](https://www.niemanlab.org/2013/04/not-an-april-fools-joke-the-new-york-times-has-built-a-haiku-bot/)

## Later Years

https://www.tumblr.com/timeshaiku

https://timeshaiku.tumblr.com/

summary: >
    The explanatory text that ran on the Times Haiku site when we launched it. As I am writing this, the Times Haiku URL is long broken, although it's possible the underlying Tumblr still exists. No matter, it was an idea for the moment and that moment is gone.

    I have still enjoyed haikus and writing code to find them in new languages (the original was in Ruby, but I rewrote it in Python), and for a while I had a bot doing it on Twitter (before the NYT broke the mechanism I had for pulling the full-text of articles):
    - [Source Code](https://github.com/harrisj/nyt-haiku-python)
    - [Twitter Account](https://xcancel.com/nythaikus)
date: 20130401