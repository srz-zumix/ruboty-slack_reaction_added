# ruboty-slack_reaction_added

[![Gem Version](https://badge.fury.io/rb/ruboty-slack_reaction_added.svg)](https://badge.fury.io/rb/ruboty-slack_reaction_added)

Slack Reaction added event extension for [RubotySlackRTM][].

## Installation

Add this line to your application's Gemfile:

gem 'ruboty-slack_reaction_added'

## ENV

* `DISABLE_DEFAULT_REACTION_HANDLERS` : Disable ruboty-slack_reaction_added handlers
  * `@bot reaction ping` message reaction added: reply pong again
  * `@bot reaction name` message reaction added: reply reaction name
  * :bookmark: reaction : reply permalink
  * :+1: reaction : bot +1

## Handler options

* `allow_reaction` : handler is also called on the event to which the reaction_added
* `raction_only` : handler will only be called on the event to which the reaction_added

## Message

* `message.reaction` : get reaction name
* `message.reaction_by`: get reaction_added user name

## Example

https://github.com/srz-zumix/ruboty-slack_reaction_added/blob/main/lib/ruboty/slack_reaction_added/handlers/handler.rb

![Example](https://user-images.githubusercontent.com/1439172/110792563-ebffca00-82b6-11eb-928a-741de77659b9.png)

[RubotySlackRTM]:https://github.com/rosylilly/ruboty-slack_rtm
