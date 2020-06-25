class CreateMenus < ActiveRecord::Migration[6.0]
  def change
    create_table :menus do |t|
      t.string :title
      t.belongs_to :diner, null: false, foreign_key: true

      t.timestamps
    end
  end
end
