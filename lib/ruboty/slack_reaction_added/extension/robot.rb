require 'ruboty/robot'

module Ruboty
  module ReactionAddedClient
    module Robot
      delegate :permalink, to: :adapter

      def permalink(channel_id, timestamp)
        adapter.permalink(channel_id, timestamp)
      end
    end
  end

  Robot.include ReactionAddedClient::Robot
end
