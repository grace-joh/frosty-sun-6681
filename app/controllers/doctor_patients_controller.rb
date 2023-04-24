class DoctorPatientsController < ApplicationController
  def destroy
    doctor = Doctor.find(params[:doctor_id])
    patient = Patient.find(params[:id])
    doc_pat = DoctorPatient.find_by(doctor_id: doctor.id, patient_id: patient.id)
    doc_pat.destroy

    redirect_to doctor_path(doctor)
  end
end
