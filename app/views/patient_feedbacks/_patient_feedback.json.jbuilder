json.extract! patient_feedback, :id, :patient_name, :patient_email, :doctor_name, :feedback, :created_at, :updated_at
json.url patient_feedback_url(patient_feedback, format: :json)
