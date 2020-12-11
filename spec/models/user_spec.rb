require 'rails_helper'

RSpec.describe User, type: :model do
  context 'roles validation' do
    it 'ensure role should exist' do
      user = User.new(email: "abc@gmail.com", password: 123456).save
      expect(user).to eq(false)
    end
    it 'ensure admin role should exist' do
      Role.where(name: 'admin').first_or_create
      Role.where(name: 'user').first_or_create
      user = User.new(email: "abc@gmail.com", password: 123456, role: Role.find_by(name: 'admin')).save
      expect(user).to eq(true)
    end

    it 'ensure user role should exist' do
      Role.where(name: 'admin').first_or_create
      Role.where(name: 'user').first_or_create
      user = User.new(email: "abc@gmail.com", password: 123456, role: Role.find_by(name: 'user')).save
      expect(user).to eq(true)
    end
  end
end
