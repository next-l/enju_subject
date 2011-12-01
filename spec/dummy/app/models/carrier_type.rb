class CarrierType < ActiveRecord::Base
  default_scope :order => "position"
  has_many :manifestations
end
