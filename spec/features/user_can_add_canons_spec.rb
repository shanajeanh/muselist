require 'rails_helper'

feature 'user adds canons' do
  let!(:canon) { FactoryGirl.create(:canon) }
  let!(:canon2) { FactoryGirl.creat(:canon, name: 'Gravity Falls') }
  let!(:user) { canon.user }
  context 'as a logged-in user' do
    scenario 'there is a list of canons' do
      user_sign_in(user)
      visit root_path

      expect(page).to have_content 'Fullmetal Alchemist'
      expect(page).to have_content 'Gravity Falls'
    end

    scenario 'canon can be added with a name' do
      user_sign_in(user)
      visit root_path
      fill_in 'New Canon', with: 'Newsflesh Trilogy'
      click_button 'Add Canon'

      expect(page).to have_content 'Newsflesh Trilogy'
    end

    scenario 'canon cannot be added without name' do
      user_sign_in(user)
      visit root_path
      click_button 'Add Canon'

      expect(page).to have_content 'Canon must have a name'
    end
  end

  context 'as a logged out user' do
    scenario 'there is a still a list of canons' do
      visit root_path

      expect(page).to have_content 'Fullmetal Alchemist'
      expect(page).to have_content 'Gravity Falls'
    end

    scenario 'there is no button to add a new canon' do
      visit root_path

      expect(page).not_to have_content 'Add Canon'
    end
  end
end
