---
layout: writing_layout
title: About Times Haiku
summary: The explanatory text that ran on the Times Haiku site when we launched it
date: 20130401
year: 2013
category: published
permalink: /published/times-haiku
pub_permalink: https://haiku.nytimes.com/
publisher: The New York Times
---
Whimsy is not a quality we usually associate with computer programs. We tend to think of software in terms of the function it fulfills. For example, a spreadsheet helps us do our work. A game of Tetris provides a means of procrastination. Social media reconnects us with our high school nemeses. But what about computer code that serves no inherent purpose in itself?

> There is pleasure to
> be had here, in flares of spice
> that revive and warm.

This is a Tumblr blog of haikus found within The New York Times. Most of us first encountered haikus in a grade school, when we were taught that they are three-line poems with five syllables on the first line, seven on the second and five on the third. According to the Haiku Society of America, that is not an ironclad rule. A proper haiku should also contain a word that indicates the season, or “kigo,” as well as a juxtaposition of verbal imagery, known as “kireji.” That's a lot harder to teach an algorithm, though, so we just count syllables like most amateur haiku aficionados do.

> As dawn broke we warmed
> strawberry Pop Tarts over
> the dying embers.

How does our algorithm work? It periodically checks the New York Times home page for newly published articles. Then it scans each sentence looking for potential haikus by using an electronic dictionary containing syllable counts. We started with a basic rhyming lexicon, but over time we've added syllable counts for words like “Rihanna” or “terroir” to keep pace with the broad vocabulary of The Times.

Not every haiku our computer finds is a good one. The algorithm discards some potential poems if they are awkwardly constructed and it does not scan articles covering sensitive topics. Furthermore, the machine has no aesthetic sense. It can't distinguish between an elegant verse and a plodding one. But, when it does stumble across something beautiful or funny or just a gem of a haiku, human journalists select it and post it on this blog.

> Stop the machine and
> scrape down the sides of the bowl
> with a spatula.

Finding the haikus is only the beginning. Because we want the poems to retain their visual integrity, even when people share them across social networks, we post them as images instead of text. On every image, you’ll notice a seemingly random background pattern of colored lines. The different orientations of those lines are computer-generated according to the meter of the first line of the poem.

![An example of the visual Times Haiku presentation](/static/images/writing/times-haiku/symmetry.gif)

So, what's next? This experiment in automated poetry detection has only just begun. We’ll fine-tune the algorithm, expand the dictionary and see what treasures we find. We hope you’ll follow along.

## Addendum on Feb. 24, 2025
As I am writing this, the Times Haiku URL is long broken, although it's possible the underlying Tumblr still exists. No matter, it was an idea for the moment and that moment is gone.

I have still enjoyed haikus and writing code to find them in new languages (the original was in Ruby, but I rewrote it in Python), and for a while I had a bot doing it on Twitter (before the NYT broke the mechanism I had for pulling the full-text of articles):
- [Source Code](https://github.com/harrisj/nyt-haiku-python)
- [Twitter Account](https://xcancel.com/nythaikus)
