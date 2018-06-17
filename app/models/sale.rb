# frozen_string_literal: true

class Sale < ActiveRecord::Base
  validates :customer, :description, :address, :provider, presence: true
  validates :quantity, numericality: { only_integer: true }
  validates :unit_value, :total, :quantity, numericality: { greater_than: 0 }

  before_validation { self.total = quantity * unit_value }
end
