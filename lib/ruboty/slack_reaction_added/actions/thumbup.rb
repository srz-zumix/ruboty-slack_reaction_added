
module Ruboty
  module SlackReactionAdded
    module Actions
      class Thumbup < Ruboty::Actions::Base

        def call
          # Ruboty.logger.info message.reaction
          # Ruboty.logger.info message.reaction_by
          unless message.reaction_by == Ruboty::Robot.name
            case message.reaction
            when '+1'
              message.add_reaction('thumbsup')
            end
          end
        end

      end
    end
  end
end
