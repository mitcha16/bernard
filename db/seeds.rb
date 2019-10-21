# frozen_string_literal: true

5.times do |_t|
  Diagnosis.create(
    coding_system: 'system',
    code: rand(1..10).to_s,
    description: Faker::Lorem.word
  )
end

5.times do |_t|
  Symptom.create(
    description: Faker::Lorem.word
  )
end

10.times do |_t|
  Patient.create(
    first_name: Faker::Name.first_name,
    middle_name: Faker::Name.middle_name,
    last_name: Faker::Name.last_name,
    mr: Faker::Lorem.word,
    dob: Faker::Date.backward(days: (365 * rand(20..60))),
    gender: Faker::Gender.binary_type.downcase.to_sym
  )
end

Patient.all.each do |patient|
  3.times do |_t|
    Allergy.create(description: Faker::Food.spice)
    MedicationOrder.create(name: Faker::Lorem.word, patient: patient)
    DiagnosticProcedure.create(description: Faker::Lorem.word, patient: patient)
    Treatment.create(description: Faker::Lorem.word, patient: patient, necessity: 'ease the pain')
  end
  Admission.create(
    moment: Faker::Date.backward(days: 20),
    facility: Facility.create(name: "#{Faker::Address.state} Hospital"),
    diagnoses: [Diagnosis.order('RANDOM()').first, Diagnosis.order('RANDOM()').first],
    symptoms: [Symptom.order('RANDOM()').first, Symptom.order('RANDOM()').first],
    observations: [Observation.create(description: Faker::Lorem.word)],
    patient_id: patient.id
  )
  MedicationOrder.create(
    dosage: rand(1..10),
    unit: :mg,
    medication_route: :PO,
    name: Faker::Lorem.word,
    patient_id: patient.id
  )
  DiagnosticProcedure.create(
    moment: Faker::Date.backward(days: 200),
    description: Faker::Lorem.word,
    patient_id: patient.id
  )
  patient.update_attributes(
    allergies: [Allergy.order('RANDOM()').first, Allergy.order('RANDOM()').first, Allergy.order('RANDOM()').first]
  )
end

MedicationOrder.all.each do |m|
  OrderFrequency.create(
    value: 'alot',
    frequency_unit: :hour,
    medication_order: m
  )
end
