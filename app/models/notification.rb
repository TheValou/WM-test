class Notification < ApplicationRecord
  belongs_to :phase
  serialize :messages, as: :array, coder: YAML, type: Array
  enum :moment, [:null, :morning, :noon, :evening]

  def self.get_moment(moment)
      case moment
      when nil
        0
      when "Morning"
        1
      when "Noon"
        2
      when "Evening"
        3
      end
  end
end
