# frozen_string_literal: true

require 'rails_helper'

describe PatientsController, type: :controller do
  before do
    5.times do |t|
      Patient.create(
        first_name: Faker::Name.first_name,
        middle_name: Faker::Name.middle_name,
        last_name: Faker::Name.last_name,
        mr: Faker::Lorem.word,
        dob: Faker::Date.backward(days: (365 * rand(20..60))),
        gender: Faker::Gender.binary_type.downcase.to_sym
      )
      Admission.create(
        facility: Facility.create(name: "#{Faker::Address.state} Hospital"),
        patient_id: t + 1
      )

    end
  end

  describe "GET index" do
    it "assigns @patients" do
      get :index
      expect(assigns(:patients)).to eq(Patient.all)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  describe "GET show" do
    it "assigns @patient" do
      get :show, params: {id: 1}
      expect(assigns(:patient)).to eq(Patient.find(1))
    end

    it "assigns @facility" do
      get :show, params: {id: 1}
      expect(assigns(:facility)).to eq(Patient.find(1).admission.facility)
    end

    it "renders the show template" do
      get :show, params: {id: 1}
      expect(response).to render_template("show")
    end
  end
end
