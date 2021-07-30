# frozen_string_literal: true

class Player < ApplicationRecord
  # :category: Included Module
  #
  # Document the responsibility of the module...
  #
  # Base Class:: rdoc-ref:Player
  #
  # ===== Related Links
  #
  # * https://ruby-doc.org/core-2.5.3/Numeric.html#method-i-fdiv
  #
  # Author::    Leo M. Peters <mailto:leompeters@belanton.com>
  # Copyright:: Copyright (c) 2021 by Leo M. All Rights Reserved.
  # License::   Licensed under the MIT license [www.opensource.org/licenses/mit-license.php]
  #
  module Ratios
    extend ActiveSupport::Concern

    included do
      scope :all_with_win_ratio, -> {
        map { |p| p.attributes.merge p.slice(:win_ratio) }
      }

      def win_ratio(decimals = 2)
        ratio = wins.fdiv(wins + losses + draws).round(decimals)
        ratio.nan? ? 0.0 : ratio
        # ratio = wins / (wins + losses + draws).round(decimals)
        # rescue ZeroDivisionError
        #   0.0
      end
    end
  end
end
