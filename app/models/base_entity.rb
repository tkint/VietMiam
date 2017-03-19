class BaseEntity < ApplicationRecord
  has_many :rights
  accepts_nested_attributes_for :rights
end
