require 'rails_helper'

RSpec.describe Patient do
  describe 'relationships' do
    it { should have_many :doctor_patients }
    it { should have_many(:doctors).through(:doctor_patients) }
  end

  describe 'class methods' do
    before(:each) do
      test_data
    end
    
    describe '.adult_patients_abc' do
      it 'returns patients older than 18 in alphabetical order' do
        expect(Patient.adult_patients_abc).to eq([@denny, @katie, @rebecca])
      end
    end
  end
end
