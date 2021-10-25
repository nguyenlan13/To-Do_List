class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.bigint :list_id
      t.string :name
      t.text :notes
      t.datetime :date, index: true
      t.boolean :completed, default: false
      t.timestamps
    end
  end
end
