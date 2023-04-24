require 'rails_helper'

RSpec.describe 'the Doctors show page' do
  before(:each) do
    test_data

    visit doctor_path(@miranda)
  end

  describe 'User Story 1' do
    it 'displays doctors information' do
      expect(page).to have_content(@miranda.name)
      expect(page).to have_content(@miranda.specialty)
      expect(page).to have_content(@miranda.university)
      expect(page).to have_content(@miranda.hospital_name)

      expect(page).to_not have_content(@meredith.name)
    end

    it 'displays a list of doctors patients' do
      within('#patient-list') do
        expect(page).to have_content('Patients:')
        @miranda.patients.each do |patient|
          expect(page).to have_content(patient.name)
        end
        expect(page).to_not have_content(@zola.name)
      end
    end
  end
end
