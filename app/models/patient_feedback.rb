class PatientFeedback < ApplicationRecord
  include Mobility
  translates :patient_name, type: :string
  translates :patient_email, type: :string
  translates :doctor_name, type: :string
  translates :feedback, type: :text
end
