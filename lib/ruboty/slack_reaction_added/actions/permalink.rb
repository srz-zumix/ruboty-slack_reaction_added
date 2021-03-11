
module Ruboty
  module SlackReactionAdded
    module Actions
      class Permalink < Ruboty::Actions::Base

        def call
          case message.reaction
          when 'bookmark'
            message.reply(message.permalink)
          end
        end

      end
    end
  end
end
