require 'ruboty/slack_reaction_added/actions/permalink.rb'
require 'ruboty/slack_reaction_added/actions/reaction_name.rb'
require 'ruboty/slack_reaction_added/actions/reaction_ping.rb'
require 'ruboty/slack_reaction_added/actions/thumbup.rb'

module Ruboty
  module SlackReactionAdded
    module Handlers
      class Handler < Ruboty::Handlers::Base

        on /reaction ping\z/,
          name: 'reaction_able_ping',
          description: 'ping allow reaction',
          allow_reaction: true

        on /reaction name\z/,
          name: 'reaction_name',
          description: 'reaction name say on readciont_added',
          reaction_only: true

        on /.*\z/m,
          name: 'thumbup',
          description: 'thumbup',
          reaction_only: true,
          all: true

        on /.*\z/m,
          name: 'permalink',
          description: 'permalink',
          reaction_only: true,
          all: true

        def reaction_able_ping(message)
          Ruboty::SlackReactionAdded::Actions::ReactionPing.new(message).call
        end

        def reaction_name(message)
          Ruboty::SlackReactionAdded::Actions::ReactionName.new(message).call
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
