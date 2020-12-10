class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :name
      t.timestamps
      t.column :timing, :integer, default: 0
    end
  end
end
