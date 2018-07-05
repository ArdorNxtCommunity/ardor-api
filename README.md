<p align="center">
  <img src="https://raw.githubusercontent.com/lord/img/master/logo-slate.png" alt="Ardor API Documentation" width="226">
  <br>
  <a href="https://travis-ci.org/lord/slate"><img src="https://travis-ci.org/lord/slate.svg?branch=master" alt="Build Status"></a>
</p>

<p align="center">Welcome the Ardor platform API documentation</p>

Introduction
------------


* **RTL Support** Full right-to-left layout for RTL languages such as Arabic, Persian (Farsi), Hebrew etc.

Getting started with Slate is super easy! Simply fork this repository and follow the instructions below. Or, if you'd like to check out what Slate is capable of, take a look at the [sample docs](http://lord.github.io/slate).

How to get Started?
------------------------------

### Prerequisites

You're going to need:

 - **Linux or OS X** — Windows may work, but is unsupported.
 - **Ruby, version 2.3.1 or newer**
 - **Bundler** — If Ruby is already installed, but the `bundle` command doesn't work, just run `gem install bundler` in a terminal.

### Getting Set Up

1. Fork this repository on GitHub.
2. Clone *your forked repository* (not our original one) to your hard drive with `git clone https://github.com/YOURUSERNAME/slate.git`
3. `cd slate`
4. Initialize and start Slate. You can either do this locally, or with Vagrant:

```shell
# either run this to run locally
bundle install
bundle exec middleman server

# OR run this to run with vagrant
vagrant up
```

You can now see the docs at http://localhost:4567. Whoa! That was fast!

Now that Slate is all set up on your machine, you'll probably want to learn more about [editing Slate markdown](https://github.com/lord/slate/wiki/Markdown-Syntax), or [how to publish your docs](https://github.com/lord/slate/wiki/Deploying-Slate).

If you'd prefer to use Docker, instructions are available [in the wiki](https://github.com/lord/slate/wiki/Docker).

### Note on JavaScript Runtime

For those who don't have JavaScript runtime or are experiencing JavaScript runtime issues with ExecJS, it is recommended to add the [rubyracer gem](https://github.com/cowboyd/therubyracer) to your gemfile and run `bundle` again.

How to cotnribute ?
---------------------------------

If you want to contribute in writing and maintaining this documentation please proceed as follow:

- Clone this repo.
- Follow the Getting Started steps to set up your environment and build the documentation
- Open the code in your favorite IDE (Visual Studio Code can be fine)
- Start a contribution
- When you finish a contribution, please submit a Pull Request with a clear message defining the work done
- Your contribution will be reviewed and merged as soon as possible. But, please be prepared to receive comments and adjust your contribution

If you want to be a permanent contribution to this documentation, please contact us on [Slack](https://ardornxt.slack.com/) or [Discord](https://discord.gg/ZrBhZNp) channels

Questions? Need Help? Found a bug?
----------------------------------

If you have any question, need assistance or found an issue within the code or in the documentation, please visit the Ardor [Slack](https://ardornxt.slack.com/) or [Discord](https://discord.gg/ZrBhZNp) channels


Special Thanks
--------------------
This documentation is based on Open Source projects below. We want to thank them for their efforts and give them credit for all their contributions.
- [Slate](https://github.com/lord/slate)
- [Middleman](https://github.com/middleman/middleman)
- [jquery.tocify.js](https://github.com/gfranko/jquery.tocify.js)
- [middleman-syntax](https://github.com/middleman/middleman-syntax)
- [middleman-gh-pages](https://github.com/edgecase/middleman-gh-pages)
- [Font Awesome](http://fortawesome.github.io/Font-Awesome/)
