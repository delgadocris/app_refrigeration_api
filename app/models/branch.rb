class Branch < ApplicationRecord
  belongs_to :user
  
  validates :fridge, uniqueness: true

  def self.allowed_attributes
    [:fridge, :temperature, :user_id]
  end
end
