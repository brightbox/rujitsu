# encoding: utf-8

module Spec
  module Mocks
    module Methods
      class GrammarException < Exception; end
      
      def should_recieve(sym, opts={}, &block)
        raise GrammarException, "Oi! i before e except after c."
      end
    end
  end
end
 
