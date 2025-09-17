class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :email, null: false
      t.integer :type, null: false
      t.references :company, type: :uuid, null: true

      t.timestamps
    end
  end
end
