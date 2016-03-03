class CreateWorkers < ActiveRecord::Migration
  def change
    create_table :workers do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
