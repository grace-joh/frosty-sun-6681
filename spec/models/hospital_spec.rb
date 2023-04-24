require 'rails_helper'

RSpec.describe Hospital do
  describe 'relationships' do
    it { should have_many :doctors }
  end

  describe 'instance methods' do
    before(:each) do
      test_data
    end

    describe 'doctors_by_most_patients' do
      it 'lists all hospitals doctors by most number of patients' do
        expect(@grey.doctors_by_most_patients).to eq([@meredith, @alex])
        expect(@seaside.doctors_by_most_patients).to eq([@miranda, @derek])
      end
    end
  end
end
