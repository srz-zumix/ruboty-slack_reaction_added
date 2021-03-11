
module Ruboty
  class Message
    module ReactionAddedMessage
      def add_reaction(reaction)
        channel_id = @original[:channel]["id"]
        timestamp  = @original[:ts]
        robot.add_reaction(reaction, channel_id, timestamp)
      end

      def permalink
        robot.permalink(@original[:channel]["id"], @original[:ts])
      end

      def reaction
        @original[:reaction]
      end

      def reaction_by
        @original[:reaction_by]
      end

      def dump_original(key)
        Ruboty.logger.info @original[key]
      end
    end

    prepend ReactionAddedMessage
  end
end
