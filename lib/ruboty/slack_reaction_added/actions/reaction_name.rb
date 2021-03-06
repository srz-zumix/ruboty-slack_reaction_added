
module Ruboty
  module SlackReactionAdded
    module Actions
      class ReactionName < Ruboty::Actions::Base

        def call
          unless message.reaction_by == message.robot.name
            message.reply(":#{message.reaction}: => `:#{message.reaction}:`")
          end
        end

      end
    end
  end
end
