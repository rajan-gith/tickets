class Show < ApplicationRecord
  enum timing: { '12-3': 0, '4-7': 1, '8-11': 2 }
end
