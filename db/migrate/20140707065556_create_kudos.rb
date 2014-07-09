class CreateKudos < ActiveRecord::Migration
  def change
    create_table :kudos do |t|
      t.integer :primary_user_id
      t.integer :kudos_user_id

      t.timestamps
    end
    add_index :kudos, :primary_user_id
    add_index :kudos, :kudos_user_id
  end
end
