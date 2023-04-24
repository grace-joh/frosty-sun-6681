require 'rails_helper'

RSpec.describe 'the Hospitals show page' do
  before(:each) do
    test_data

    visit hospital_path(@grey)
  end

  describe 'Extension' do
    it 'displays the hospital name' do
      expect(page).to have_content(@grey.name)
    end

    it 'displays name and the number of patients for each doctor' do
      within('#doctor-list') do
        @grey.doctors.each do |doctor|
          within("#doctor-#{doctor.id}") do
            expect(page).to have_content(doctor.name)
            expect(page).to have_content('Number of patients:')
            # cant call patient count here...
          end
        end
      end
    end

    it 'orders the list of doctors by most number of patients' do
      within('#doctor-list') do
        expect(@meredith.name).to appear_before(@alex.name)
      end
    end
  end
end
