class CreateRights < ActiveRecord::Migration[5.0]
  def change
    create_table :rights do |t|
      t.references :user_group, foreign_key: true
      t.references :base_entity, foreign_key: true

      t.timestamps
    end

    add_index :rights, [:user_group_id, :base_entity_id], unique: true
    add_column :rights, :right_create, :boolean
    add_column :rights, :right_read, :boolean
    add_column :rights, :right_update_self, :boolean
    add_column :rights, :right_update_lesser_group, :boolean
    add_column :rights, :right_update_actual_group, :boolean
    add_column :rights, :right_update_upper_group, :boolean
    add_column :rights, :right_delete_self, :boolean
    add_column :rights, :right_delete_lesser_group, :boolean
    add_column :rights, :right_delete_actual_group, :boolean
    add_column :rights, :right_delete_upper_group, :boolean
  end
end
