# frozen_string_literal: true

require 'spec_helper'

describe Spree::Admin::BaseController, type: :controller do
  let(:user) { create(:user) }

  stub_authorization!

  context 'as a logged in user' do
    before do
      sign_in(user)
    end

    it 'returns a proper user id' do
      expect(controller.user_for_paper_trail).to eq(user.id)
    end
  end

  context 'without a logged in user' do
    it 'returns a proper user id' do
      expect(controller.user_for_paper_trail).to match(/public user/i)
    end
  end
end
