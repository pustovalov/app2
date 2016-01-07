require 'rails_helper'
require 'support/helpers/login_helper.rb'
include LoginHelper

feature 'Login to Admin dashboard' do
  describe 'user is not logged in' do
    it 'should redirect to login path' do
      visit admin_path
      expect(page).to have_content(I18n.t('.sing_up_label'))
    end
  end

  describe 'user logged in as admin' do
    let!(:user) { create(:user, :admin) }

    before(:each) do
      visit root_path
      login('test@test.com', '12345', 'Войти')
      visit admin_path
    end

    it 'open admin dashboard' do
      expect(page).to have_content('Flashcards Admin')
    end
  end
end