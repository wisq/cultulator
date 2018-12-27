# cultulator

Takes some useful data from [Cultist Simulator](http://weatherfactory.biz/cultist-simulator/) and displays it in a nice tabular format.

The end result is uploaded [here](http://cult.wisq.net/).

[![Build Status](https://travis-ci.org/wisq/cultulator.svg?branch=master)](https://travis-ci.org/wisq/cultulator)

## Development

If you see something incorrect, you can fork the repo, update the code / data, and then test your changes:

* You'll need [Elixir](https://elixir-lang.org/).
* To fetch dependencies, run `mix deps.get`.
* Then, run `mix cult` to build all the HTML pages.
* Open the resulting HTML files in your web browser.

Alternatively, you can [create an issue](https://github.com/wisq/cultulator/issues/new) to tell me what's wrong.  Please include exact details about what's wrong, what it should be instead, and how you know that.

Commits to the main `wisq/cultulator` repo are automatically uploaded to `cult.wisq.net` by [Travis CI](https://travis-ci.org/wisq/cultulator).

## Data mining

If the data tables get out of date, you can refresh them using the game's own source files:

* The game's JSON files are incredibly dirty and need `json5` to clean them up:
  * Make sure [Node](https://nodejs.org/) is installed.
  * Run `npm install -g json5`.
* Either copy the game's data files into a new `data/` directory, or create a symbolic link.
  * Make sure `data/StreamingAssets/content/core/` exists.  That's all we need for now.
* Run `mix cult.datamine` to regenerate the data source files.

Once the files are updated, see the "Development" section above for how to use them.
