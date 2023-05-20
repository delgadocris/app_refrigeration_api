json.extract! branch, :id, :fridge, :temperature, :humidity, :created_at, :updated_at
json.user branch.user, partial: 'api/v1/branches/user', as: :user