class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  belongs_to :user_group
  has_many :articles
  has_many :articles_comments, :class_name => 'Articles::Comment'
  has_many :recipes

  def full_name
    first_name + ' ' + last_name
  end
end
