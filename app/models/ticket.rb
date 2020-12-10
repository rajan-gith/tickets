class Ticket < ApplicationRecord
  enum timing: {'12 pm - 3 pm': 0, '4 pm - 7 pm': 1, '8 pm -11 pm': 2}
end
