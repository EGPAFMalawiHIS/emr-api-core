class Api::V1::CohortMembersController < ApplicationController
  before_action :set_cohort_member, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @cohort_members = CohortMember.all
    respond_with(@cohort_members)
  end

  def show
    respond_with(@cohort_member)
  end

  def create
    @cohort_member = CohortMember.new(cohort_member_params)
    @cohort_member.save
    respond_with(@cohort_member)
  end

  def update
    @cohort_member.update(cohort_member_params)
    respond_with(@cohort_member)
  end

  def destroy
    @cohort_member.destroy
    respond_with(@cohort_member)
  end

  private
    def set_cohort_member
      @cohort_member = CohortMember.find(params[:id])
    end

    def cohort_member_params
      params.require(:cohort_member).permit(:cohort_id, :patient_id, :start_date, :end_date, :creator, :date_created, :voided, :voided_by, :date_voided, :void_reason, :uuid)
    end
end
