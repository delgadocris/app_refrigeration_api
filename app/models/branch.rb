class Branch < ApplicationRecord
  validates :fridge, uniqueness: true

  def self.allowed_attributes
    [:fridge, :temperature]
  end
end
