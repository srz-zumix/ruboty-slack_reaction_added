
module Ruboty
  module Adapters
    class SlackRTM < Base
      module ReactionAddedSlackRTM
        def on_reaction_added(data)
          # Ruboty.logger.info data
          channel = data['item']['channel']
          histories = @client.conversations_history(channel: channel, latest: data['item']['ts'], inclusive: true, limit: 1)
          message = histories['messages'][0]
          message['channel'] = channel
          message['reaction_added'] = data
          # Ruboty.logger.info message
          # on_message(message)
          on_message_from_reaction_added(message)
        end

        def on_message_from_reaction_added(data)
          user = user_info(data['user']) || {}
          reaction_added_user = user_info(data['reaction_added']['user']) || {}

          channel = channel_info(data['channel'])

          if (data['subtype'] == 'bot_message' || user['is_bot']) && ENV['SLACK_IGNORE_BOT_MESSAGE'] == '1'
            return
          end

          if channel
            return if channel['name'] == (ENV['SLACK_GENERAL_NAME'] || 'general') && ENV['SLACK_IGNORE_GENERAL'] == '1'

            channel_to = expose_channel_name? ? "##{channel['name']}" : channel['id']
          else # direct message
            channel_to = data['channel']
          end

          message_info = {
            from: data['channel'],
            from_name: user['name'],
            to: channel_to,
            channel: channel,
            user: user,
            ts: data['ts'],
            thread_ts: data['thread_ts'],
            time: Time.at(data['ts'].to_f),
            reaction: data['reaction_added']['reaction'],
            reaction_by: reaction_added_user['name']
          }


          text, mention_to = extract_mention(data['text'])
          robot.receive(message_info.merge(body: text, mention_to: mention_to))

          (data['attachments'] || []).each do |attachment|
            body, body_mention_to = extract_mention(attachment['fallback'] || "#{attachment['text']} #{attachment['pretext']}".strip)

            unless body.empty?
              robot.receive(message_info.merge(body: body, mention_to: body_mention_to))
            end
          end
        end

        def channel_info(channel_id)
          @channel_info_caches[channel_id] ||= begin
            resp = case channel_id
              when /^C/, /^D/, /^G/
                client.conversations_info(channel: channel_id)
              else
                {}
              end

            resp['channel']
          end
        end

        def permalink(channel_id, ts)
          permalink = @client.chat_getPermalink(channel: channel_id, message_ts: ts)
          permalink['permalink']
        end
      end

      prepend ReactionAddedSlackRTM
    end
  end
end
