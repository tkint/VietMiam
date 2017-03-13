class CreateArticleComments < ActiveRecord::Migration[5.0]
  def change
    create_table :article_comments do |t|
      t.string :content
      t.references :user, foreign_key: true
      t.references :article, foreign_key: true

      t.timestamps
    end
  end
end
