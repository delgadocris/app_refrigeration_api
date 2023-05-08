class Branch < ApplicationRecord
  def self.allowed_attributes
    [:fridge, :temperature]
  end
end
