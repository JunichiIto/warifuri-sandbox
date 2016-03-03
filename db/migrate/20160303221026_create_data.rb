class CreateData < ActiveRecord::Migration
  def change
    create_table :data do |t|
      t.belongs_to :worker, index: true, foreign_key: true
      t.string :label

      t.timestamps null: false
    end
  end
end
