module Spec
  module Mocks
    module Methods
      class GrammarException < Exception; end
      
      def should_recieve(sym, opts={}, &block)
        raise GrammarException, "Oi! i before except after c."
      end
    end
  end
end
 