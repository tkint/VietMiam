class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_validation :set_user_group

  belongs_to :user_group, required: true
  has_many :articles
  has_many :articles_comments, :class_name => 'Articles::Comment'
  has_many :recipes

  def full_name
    first_name + ' ' + last_name
  end

  def set_user_group
    self.user_group_id = UserGroup.second.id
  end
end
