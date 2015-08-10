class CreateMngs < ActiveRecord::Migration
  def change
    create_table :mngs do |t|
      t.string :question
      t.integer :yes
      t.integer :no

      t.timestamps null: false
    end
  end
end
