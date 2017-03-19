class Article < ApplicationRecord
  belongs_to :user
  has_many :articles_comments, :class_name => 'Articles::Comment'
end
