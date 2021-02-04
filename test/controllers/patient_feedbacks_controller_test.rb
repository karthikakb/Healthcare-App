require 'test_helper'

class PatientFeedbacksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @patient_feedback = patient_feedbacks(:one)
  end

  test "should get index" do
    get patient_feedbacks_url
    assert_response :success
  end

  test "should get new" do
    get new_patient_feedback_url
    assert_response :success
  end

  test "should create patient_feedback" do
    assert_difference('PatientFeedback.count') do
      post patient_feedbacks_url, params: { patient_feedback: { doctor_name: @patient_feedback.doctor_name, feedback: @patient_feedback.feedback, patient_email: @patient_feedback.patient_email, patient_name: @patient_feedback.patient_name } }
    end

    assert_redirected_to patient_feedback_url(PatientFeedback.last)
  end

  test "should show patient_feedback" do
    get patient_feedback_url(@patient_feedback)
    assert_response :success
  end

  test "should get edit" do
    get edit_patient_feedback_url(@patient_feedback)
    assert_response :success
  end

  test "should update patient_feedback" do
    patch patient_feedback_url(@patient_feedback), params: { patient_feedback: { doctor_name: @patient_feedback.doctor_name, feedback: @patient_feedback.feedback, patient_email: @patient_feedback.patient_email, patient_name: @patient_feedback.patient_name } }
    assert_redirected_to patient_feedback_url(@patient_feedback)
  end

  test "should destroy patient_feedback" do
    assert_difference('PatientFeedback.count', -1) do
      delete patient_feedback_url(@patient_feedback)
    end

    assert_redirected_to patient_feedbacks_url
  end
end
