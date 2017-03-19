class CreateBaseEntities < ActiveRecord::Migration[5.0]
  def change
    create_table :base_entities do |t|
      t.string :singular
      t.string :plural

      t.timestamps
    end

    add_index :base_entities, :singular, unique: true
    add_index :base_entities, :plural, unique: true
  end
end
