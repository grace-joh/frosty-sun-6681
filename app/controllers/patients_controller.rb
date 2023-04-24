class PatientsController < ApplicationController
  def index
    @patients = Patient.adult_patients_abc
  end
end
