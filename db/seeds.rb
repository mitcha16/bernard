5.times do |t|
  Diagnosis.create(
    coding_system: 'system',
    code: rand(1..10).to_s,
    description: Faker::Lorem.sentence
  )
end

10.times do |t|
  Patient.create(
    first_name: Faker::Name.first_name,
    middle_name: Faker::Name.middle_name,
    last_name: Faker::Name.last_name,
    mr: 'medical record',
    dob: Faker::Date.backward(days: 20),
    gender: Faker::Gender.binary_type.downcase.to_sym,
  )
end

Diagnosis.all.each do |c|
  3.times do |t|
    Admission.create(
      moment: Faker::Date.backward(days: 20),
      facility: Facility.create(name: Faker::Address.state),
      diagnoses: [Diagnosis.order("RANDOM()").first, Diagnosis.order("RANDOM()").first],
      patient_id: rand(1..10)
    )
  end
end

Patient.all.each do |patient|
  3.times do |t|
    Allergy.create(description: Faker::Food.spice)
    MedicationOrder.create(name: Faker::Lorem.word, patient: patient)
    DiagnosticProcedure.create(description: Faker::Lorem.word, patient: patient)
    Treatment.create(description: Faker::Lorem.word, patient: patient)
  end
  patient.update_attributes(
    allergies: [Allergy.order("RANDOM()").first, Allergy.order("RANDOM()").first, Allergy.order("RANDOM()").first]
  )
end
