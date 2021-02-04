class PatientFeedbacksController < ApplicationController
  before_action :set_patient_feedback, only: %i[ show edit update destroy ]

  # GET /patient_feedbacks or /patient_feedbacks.json
  def index
    @patient_feedbacks = PatientFeedback.all
  end

  # GET /patient_feedbacks/1 or /patient_feedbacks/1.json
  def show
     @patient_feedback = PatientFeedback.find(params[:id])
  end

  # GET /patient_feedbacks/new
  def new
    @patient_feedback = PatientFeedback.new
  end

  # GET /patient_feedbacks/1/edit
  def edit
    @patient_feedback = PatientFeedback.find(params[:id])
  end

  # POST /patient_feedbacks or /patient_feedbacks.json
  def create
    @patient_feedback = PatientFeedback.new(patient_feedback_params)

    respond_to do |format|
      if @patient_feedback.save
        format.html { redirect_to @patient_feedback, notice: "Patient feedback was successfully created." }
        format.json { render :show, status: :created, location: @patient_feedback }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @patient_feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /patient_feedbacks/1 or /patient_feedbacks/1.json
  def update
    respond_to do |format|
      if @patient_feedback.update(patient_feedback_params)
        format.html { redirect_to @patient_feedback, notice: "Patient feedback was successfully updated." }
        format.json { render :show, status: :ok, location: @patient_feedback }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @patient_feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /patient_feedbacks/1 or /patient_feedbacks/1.json
  def destroy
    @patient_feedback.destroy
    respond_to do |format|
      format.html { redirect_to patient_feedbacks_url, notice: "Patient feedback was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_patient_feedback
      @patient_feedback = PatientFeedback.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def patient_feedback_params
      locale_params = I18n.available_locales.map do |local|
      [:"patient_name_#{Mobility.normalize_locale(local)}", :"patient_email_#{Mobility.normalize_locale(local)}", :"doctor_name_#{Mobility.normalize_locale(local)}", :"feedback_#{Mobility.normalize_locale(local)}"]
      end.flatten
      params.require(:patient_feedback).permit(locale_params)
    end
end
