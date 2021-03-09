
module Ruboty
  module Adapters
    class SlackRTM < Base
      module ReactionAddedSlackRTM
        def on_reaction_added(data)
          Ruboty.logger.info data
          channel = data['item']['channel']
          histories = @client.conversations_history(channel: channel, latest: data['item']['ts'], inclusive: true, limit: 1)
          message = histories['messages'][0]
          permalink = @client.chat_getPermalink(channel: channel, message_ts: data['item']['ts'])
          message['permalink'] = permalink['permalink']
          message['channel'] = channel
          message['reaction_added'] = data
          Ruboty.logger.info message
          on_message(message)
        end
      end

      prepend ReactionAddedSlackRTM
    end
  end
end
