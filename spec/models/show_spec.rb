require 'rails_helper'

RSpec.describe Show, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  context 'Show model test ' do
    it 'ensure show not saves' do
      show = Show.new(name: "first show", timing: "12 pm - 3 pm").save
      expect(show).to eq(true)
    end
  end
end
