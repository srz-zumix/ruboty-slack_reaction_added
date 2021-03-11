require 'ruboty/slack_reaction_added/actions/permalink.rb'
require 'ruboty/slack_reaction_added/actions/reaction_ping.rb'
require 'ruboty/slack_reaction_added/actions/thumbup.rb'

module Ruboty
  module SlackReactionAdded
    module Handlers
      class Handler < Ruboty::Handlers::Base

        on /ping\z/,
          name: 'reaction_able_ping',
          description: 'ping allow reaction',
          allow_reaction: true

        on /.*\z/,
          name: 'thumbup',
          description: 'thumbup',
          reaction_only: true,
          all: true

        on /.*\z/,
          name: 'permalink',
          description: 'permalink',
          reaction_only: true,
          all: true

        def reaction_able_ping(message)
          Ruboty::SlackReactionAdded::Actions::ReactionPing.new(message).call
        end

        def thumbup(message)
          Ruboty::SlackReactionAdded::Actions::Thumbup.new(message).call
        end

        def permalink(message)
          Ruboty::SlackReactionAdded::Actions::Permalink.new(message).call
        end
      end
    end
  end
end
