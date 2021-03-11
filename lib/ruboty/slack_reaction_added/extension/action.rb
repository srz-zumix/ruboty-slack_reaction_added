module Ruboty
  class Action
    module ReactionAddedAction
      def call(handler, message, options = {})
        if message.reaction
          if allow_reaction? || reaction_only?
            # Ruboty.logger.info "reaction"
            super(handler, message, options)
          end
        else
          unless reaction_only?
            super(handler, message, options)
          end
        end
      end

      def allow_reaction?
        !!@options[:allow_reaction]
      end

      def reaction_only?
        !!@options[:reaction_only]
      end
    end

    prepend ReactionAddedAction
  end
end
