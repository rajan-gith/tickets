require 'rails_helper'

RSpec.describe Ticket, type: :model do
  context 'FK validation' do
    it 'should not save 1' do
      Role.where(name: 'admin').first_or_create
      Role.where(name: 'user').first_or_create
      user = User.create(email: "abc@gmail.com", password: 123456, role: Role.find_by(name: 'user'))
      ticket = Ticket.new(user: user).save
      expect(ticket).to eq(false)
    end
    it 'should not save 2' do
      Role.where(name: 'admin').first_or_create
      Role.where(name: 'user').first_or_create
      show = Show.create(name: "first show", timing: "12 pm - 3 pm")
      ticket = Ticket.new(show: show).save
      expect(ticket).to eq(false)
    end

    it 'shoud calculate price' do
      Role.where(name: 'admin').first_or_create
      Role.where(name: 'user').first_or_create
      user = User.create(email: "abc@gmail.com", password: 123456, role: Role.find_by(name: 'user'))
      show = Show.create(name: "first show", timing: "12 pm - 3 pm")
      ticket = Ticket.create(show: show, user: user, seats: [1,31,71])
      expect(ticket.amount).to eq(650)
    end
  end
end
