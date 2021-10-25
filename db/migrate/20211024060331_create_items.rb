class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :notes
      t.datetime :due_date, index: true
      t.boolean :completed, default: false
      t.timestamps
    end
  end
end
