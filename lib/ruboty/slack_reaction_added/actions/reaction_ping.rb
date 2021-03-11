
module Ruboty
  module SlackReactionAdded
    module Actions
      class ReactionPing < Ruboty::Actions::Base

        def call
          message.reply('pong')
        end

      end
    end
  end
end
