Currently, dataview dynamic queries are not properly rendered in quartz  only in Obsidian.

Someone in the quartz Discord server wrote an Obsidian plugin [quartz-syncer](https://github.com/saberzero1/quartz-syncer), that assumes a bunch of things. Since I want to keep my garden Obsidian-independent, I will need to write some code to make the dataview block render before publishing.

The obvious step is for this to be done in the CICD pipeline, generate a new `contenrs` folder and render from there. Maybe need to move the current `contents` folder into a `vault` (or even different repo and link them?)

# References
