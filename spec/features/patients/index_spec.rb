require 'rails_helper'

RSpec.describe 'the Patients index page' do
  before(:each) do
    test_data

    visit patients_path
  end

  describe 'User Story 3' do
    it 'lists patients who are older than 18 in alphabetical order' do
      expect(page).to have_content('Patients')
      expect(@denny.name).to appear_before(@katie.name)
      expect(@katie.name).to appear_before(@rebecca.name)
      save_and_open_page
    end
  end
end
