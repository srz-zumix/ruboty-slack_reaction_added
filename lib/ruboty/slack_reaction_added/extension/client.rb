require 'slack'

module Ruboty
  module SlackRTM
    class Client
      module ReactionAddedClient
        # def initialize(websocket_url:)
        #   Ruboty.logger.info websocket_url.to_s
        #   super(websocket_url: websocket_url)
        # end

        def on_text(&block)
          @client.on(:message) do |message|
            case message.type
            when :ping
              Ruboty.logger.debug("#{Client.name}: Received ping message")
              send('', type: 'pong')
            when :pong
              Ruboty.logger.debug("#{Client.name}: Received pong message")
            when :text
              block.call(JSON.parse(message.data))
            when :reaction_added
              case message.data.item.type
              when :message
                # Ruboty.logger.info message.data
                block.call(JSON.parse(message.data))
              else
                Ruboty.logger.warn("#{Client.name}: Received unknown reaction item type=#{message.data.item.type}: #{message.data}")
              end
            else
              Ruboty.logger.warn("#{Client.name}: Received unknown message type=#{message.type}: #{message.data}")
            end
          end
        end
      end

      prepend ReactionAddedClient
    end
  end
end
