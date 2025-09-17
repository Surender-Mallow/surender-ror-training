class CreateJobs < ActiveRecord::Migration[8.0]
  def change
    create_table :jobs, id: :uuid do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.string :location, null: false
      t.float :salary, null: false
      t.string :status
      t.references :companies, type: :uuid, null: false

      t.timestamps
    end
  end
end
