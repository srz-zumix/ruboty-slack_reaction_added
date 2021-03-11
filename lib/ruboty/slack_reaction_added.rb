require 'ruboty/slack_reaction_added/version'
require 'ruboty/slack_reaction_added/extension/action'
require 'ruboty/slack_reaction_added/extension/adapter'
require 'ruboty/slack_reaction_added/extension/client'
require 'ruboty/slack_reaction_added/extension/message'
require 'ruboty/slack_reaction_added/extension/robot'

if ENV["DISABLE_DEFAULT_REACTION_HANDLERS"] != "1"
  require 'ruboty/slack_reaction_added/handlers/handler.rb'
end
