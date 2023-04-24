# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
DoctorPatient.delete_all
Patient.delete_all
Doctor.delete_all
Hospital.delete_all

# hospitals
@grey = Hospital.create!(name: 'Grey Sloan Memorial Hospital')
@seaside = Hospital.create!(name: 'Seaside Health & Wellness Center')

# doctors
@merideth = @grey.doctors.create!(name: 'Meredith Grey', specialty: 'General Surgery', university: 'Harvard University')
@alex = @grey.doctors.create!(name: 'Alex Karev', specialty: 'Pediatric Surgery', university: 'Johns Hopkins University')
@miranda = @grey.doctors.create!(name: 'Miranda Bailey', specialty: 'General Surgery', university: 'Stanford University')
@derek = @grey.doctors.create!(name: 'Derek McDreamy Shepherd', specialty: 'Attending Surgeon', university: 'University of Pennsylvania')

# patients
@katie = Patient.create!(name: 'Katie Bryce', age: 24)
@denny = Patient.create!(name: 'Denny Duquette', age: 39)
@rebecca = Patient.create!(name: 'Rebecca Pope', age: 32)
@zola = Patient.create!(name: 'Zola Shepherd', age: 2)

# patients
@katie = Patient.create!(name: 'Katie Bryce', age: 24)
@denny = Patient.create!(name: 'Denny Duquette', age: 39)
@rebecca = Patient.create!(name: 'Rebecca Pope', age: 32)
@zola = Patient.create!(name: 'Zola Shepherd', age: 2)

# meredith's patients
@doc_pat1 = DoctorPatient.create!(doctor: @merideth, patient: @katie)
@doc_pat2 = DoctorPatient.create!(doctor: @merideth, patient: @denny)
@doc_pat3 = DoctorPatient.create!(doctor: @merideth, patient: @rebecca)
@doc_pat4 = DoctorPatient.create!(doctor: @merideth, patient: @zola)

# miranda's patients
@doc_pat5 = DoctorPatient.create!(doctor: @miranda, patient: @katie)
@doc_pat6 = DoctorPatient.create!(doctor: @miranda, patient: @denny)
@doc_pat7 = DoctorPatient.create!(doctor: @miranda, patient: @rebecca)

# alex's patients
@doc_pat8 = DoctorPatient.create!(doctor: @alex, patient: @katie)
@doc_pat8 = DoctorPatient.create!(doctor: @alex, patient: @rebecca)

# derek's patients
@doc_pat8 = DoctorPatient.create!(doctor: @derek, patient: @katie)

# katie sees all 4 doctors
# denny sees meredith and miranda
# rebecca sees meredith, alex, and miranda
# zola sees only meredith
