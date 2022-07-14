class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards do |t|
      t.references :column, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false, index: true
      t.text :description

      t.timestamps
    end
  end
end
