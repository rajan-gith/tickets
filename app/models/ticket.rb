class Ticket < ApplicationRecord
  belongs_to :show
  belongs_to :user

  before_save :update_price

  def update_price
    amount = 0
    self.seats.each do |seat_number|
      amount += Ticket.seats_price(seat_number)
    end

    self.amount = amount
  end

  def self.seats_price(seat_number)
    if (seat_number >= 1 && seat_number <= 30)
      150
    elsif
      200
    else
      300
    end
  end

end
