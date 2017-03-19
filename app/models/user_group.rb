class UserGroup < ApplicationRecord
  has_many :users
  has_many :rights
  accepts_nested_attributes_for :rights
end
