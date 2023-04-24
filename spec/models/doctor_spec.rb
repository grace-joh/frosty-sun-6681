require 'rails_helper'

RSpec.describe Doctor do
  describe 'relationships' do
    it { should belong_to :hospital }
    it { should have_many :doctor_patients }
    it { should have_many(:patients).through(:doctor_patients) }
  end

  describe 'instance methods' do
    before(:each) do
      test_data
    end

    describe '#hospital_name' do
      it 'returns hospital name' do
        expect(@miranda.hospital_name).to eq(@seaside.name)
      end
    end
  end
end
