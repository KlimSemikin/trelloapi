class CreateColumns < ActiveRecord::Migration[6.1]
  def change
    create_table :columns do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false, index: true

      t.timestamps
    end
  end
end
