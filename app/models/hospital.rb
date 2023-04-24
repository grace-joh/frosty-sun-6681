class Hospital < ApplicationRecord
  has_many :doctors

  def doctors_by_most_patients
    doctors.joins(:patients)
           .group('doctors.id')
           .select('doctors.*, COUNT(patients) as patient_count')
           .order('patient_count DESC')
  end
end
