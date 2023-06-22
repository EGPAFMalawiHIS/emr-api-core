class Api::V1::XformsPersonRepeatAttributesController < ApplicationController
  before_action :set_xforms_person_repeat_attribute, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @xforms_person_repeat_attributes = XformsPersonRepeatAttribute.all
    respond_with(@xforms_person_repeat_attributes)
  end

  def show
    respond_with(@xforms_person_repeat_attribute)
  end

  def create
    @xforms_person_repeat_attribute = XformsPersonRepeatAttribute.new(xforms_person_repeat_attribute_params)
    @xforms_person_repeat_attribute.save
    respond_with(@xforms_person_repeat_attribute)
  end

  def update
    @xforms_person_repeat_attribute.update(xforms_person_repeat_attribute_params)
    respond_with(@xforms_person_repeat_attribute)
  end

  def destroy
    @xforms_person_repeat_attribute.destroy
    respond_with(@xforms_person_repeat_attribute)
  end

  private
    def set_xforms_person_repeat_attribute
      @xforms_person_repeat_attribute = XformsPersonRepeatAttribute.find(params[:id])
    end

    def xforms_person_repeat_attribute_params
      params.require(:xforms_person_repeat_attribute).permit(:person_id, :value, :person_attribute_type_id, :value_id, :value_id_type, :value_display_order, :creator, :date_created, :changed_by, :date_changed, :voided, :voided_by, :date_voided, :void_reason)
    end
end
