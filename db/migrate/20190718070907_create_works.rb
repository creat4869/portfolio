class CreateWorks < ActiveRecord::Migration[5.0]
  def change
    create_table :works do |t|
      t.string :title, null: false
      t.string :image
      t.string :category, null: false
      t.string :period
      t.string :skill
      t.string :charge
      t.string :detail
      t.text :summary, null: false
      t.integer :user_id
      t.timestamps
    end
  end
end
