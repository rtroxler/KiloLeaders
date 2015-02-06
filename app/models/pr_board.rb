class PrBoard < ActiveRecord::Base
  belongs_to :user
  has_many :pr_lifts, :class_name => "Lift"

  #validates them some how, that they're unique to a degree
end
