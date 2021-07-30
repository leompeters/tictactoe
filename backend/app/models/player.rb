# frozen_string_literal: true

class Player < ApplicationRecord
  include Ratios

  validates_presence_of :name
end
