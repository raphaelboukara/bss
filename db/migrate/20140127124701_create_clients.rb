class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :name
      t.string :email
      t.integer :user_id

      t.timestamps
    end
    add_index :clients, [:user_id, :created_at]
  end
end
