require 'rails_helper'

RSpec.describe ShowsController, type: :controller do
  context 'get requests' do
    it 'should response ok' do
      get :index
      expect(response).to be_success
    end

    it 'should response ok' do
      show = Show.create(name: "first show", timing: "12 pm - 3 pm")
      get :show, params: {id: show.to_param}
      expect(response).to be_success
    end
  end
end
