class AddingFieldsToTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :amount, :float, default: 0
    add_reference :tickets, :user
    add_reference :tickets, :show
    add_column :tickets, :seats, :integer, array: true, default: []
  end
end
