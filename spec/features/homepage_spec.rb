require 'rails_helper'

feature 'Homepage feature' do
  scenario 'As a user I want to see a text in the homepage', type: :feature do
      visit '/'
      expect(page).to have_content('some text')
  end

  scenario 'As a user I want to see a text in the homepage using javascript',
  type: :feature,
  js: true do
      visit '/'
      expect(page).to have_content('some text')
  end
end
