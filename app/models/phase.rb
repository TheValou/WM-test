class Phase < ApplicationRecord
  has_many :notifications
  # adding phase begin and end dates
end
