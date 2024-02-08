# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# City.destroy_all
# Doctor.destroy_all
# Patient.destroy_all
# Appointment.destroy_all
require 'faker'

specialties = ["Dentiste", "Généraliste", "ORL", "Proctologue"]

10.times do
  # Créer une ville pour chaque boucle
  city = City.create!(city_name: Faker::Address.city)
  
  # Créer un docteur avec une spécialité aléatoire, un code postal aléatoire et la ville associée
  doctor = Doctor.create!(
    name: Faker::Name.name,
    
    Specialty: specialties.sample, 
    zip_code: Faker::Address.zip_code, 
    city: City.all.sample
  )

  # Créer un patient avec la ville associée
  patient = Patient.create!(
    name: Faker::Name.name, 
    city: City.all.sample
  )

  # Créer un rendez-vous pour le docteur et le patient actuels
  appointment = Appointment.create!(
    doctor: Doctor.all.sample, 
    patient: Patient.all.sample, 
    appointment_date: Faker::Time.forward(days: 30),
    city: City.all.sample
  )
end

puts "10 docteurs, patients, villes et rendez-vous ont été créés"
