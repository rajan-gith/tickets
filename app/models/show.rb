class Show < ApplicationRecord
  enum timing: { '12 pm - 3 pm': 0, '4 pm - 7 pm': 1, '8 pm - 11 pm': 2 }
  has_many :tickets

  def reserved_seats
    self.tickets.pluck(:seats).flatten
  end
end
