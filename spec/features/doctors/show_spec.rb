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

  describe 'User Story 2' do
    it 'displays a delete button next to each patient' do
      @miranda.patients.each do |patient|
        within("#patient-#{patient.id}") do
          expect(page).to have_button('Delete')
          expect(patient.name).to appear_before('Delete')
        end
      end
    end

    it 'deletes a patient from doctors show page but still shows on another doctors page' do
      within("#patient-#{@katie.id}") do
        expect(page).to have_content(@katie.name)

        click_button('Delete')
      end

      expect(current_path).to eq(doctor_path(@miranda))
      expect(page).to_not have_content(@katie.name)

      visit doctor_path(@meredith)

      within("#patient-#{@katie.id}") do
        expect(page).to have_content(@katie.name)
      end
    end
  end
end
