class Api::V1::MetadatasharingImportedItemsController < ApplicationController
  before_action :set_metadatasharing_imported_item, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @metadatasharing_imported_items = MetadatasharingImportedItem.all
    respond_with(@metadatasharing_imported_items)
  end

  def show
    respond_with(@metadatasharing_imported_item)
  end

  def create
    @metadatasharing_imported_item = MetadatasharingImportedItem.new(metadatasharing_imported_item_params)
    @metadatasharing_imported_item.save
    respond_with(@metadatasharing_imported_item)
  end

  def update
    @metadatasharing_imported_item.update(metadatasharing_imported_item_params)
    respond_with(@metadatasharing_imported_item)
  end

  def destroy
    @metadatasharing_imported_item.destroy
    respond_with(@metadatasharing_imported_item)
  end

  private
    def set_metadatasharing_imported_item
      @metadatasharing_imported_item = MetadatasharingImportedItem.find(params[:id])
    end

    def metadatasharing_imported_item_params
      params.require(:metadatasharing_imported_item).permit(:uuid, :itemUuid)
    end
end
