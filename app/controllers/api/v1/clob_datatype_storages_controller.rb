class Api::V1::ClobDatatypeStoragesController < ApplicationController
  before_action :set_clob_datatype_storage, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @clob_datatype_storages = ClobDatatypeStorage.all
    respond_with(@clob_datatype_storages)
  end

  def show
    respond_with(@clob_datatype_storage)
  end

  def create
    @clob_datatype_storage = ClobDatatypeStorage.new(clob_datatype_storage_params)
    @clob_datatype_storage.save
    respond_with(@clob_datatype_storage)
  end

  def update
    @clob_datatype_storage.update(clob_datatype_storage_params)
    respond_with(@clob_datatype_storage)
  end

  def destroy
    @clob_datatype_storage.destroy
    respond_with(@clob_datatype_storage)
  end

  private
    def set_clob_datatype_storage
      @clob_datatype_storage = ClobDatatypeStorage.find(params[:id])
    end

    def clob_datatype_storage_params
      params.require(:clob_datatype_storage).permit(:uuid, :value)
    end
end
