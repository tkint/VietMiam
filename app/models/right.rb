class Right < ApplicationRecord
  belongs_to :user_group
  belongs_to :base_entity
end
