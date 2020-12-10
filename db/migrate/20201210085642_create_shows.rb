class CreateShows < ActiveRecord::Migration[5.2]
  def change
    create_table :shows do |t|
      t.string :name
      t.column :timing, :integer, default: 0

      t.timestamps
    end
  end
end
