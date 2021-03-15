
module Ruboty
  module SlackReactionAdded
    module Actions
      class ReactionPing < Ruboty::Actions::Base

        def call
          unless message.reaction_by == message.robot.name
            message.reply('pong')
          end
        end

      end
    end
  end
end
