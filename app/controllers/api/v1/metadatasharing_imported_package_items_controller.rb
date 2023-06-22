class Api::V1::MetadatasharingImportedPackageItemsController < ApplicationController
  before_action :set_metadatasharing_imported_package_item, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @metadatasharing_imported_package_items = MetadatasharingImportedPackageItem.all
    respond_with(@metadatasharing_imported_package_items)
  end

  def show
    respond_with(@metadatasharing_imported_package_item)
  end

  def create
    @metadatasharing_imported_package_item = MetadatasharingImportedPackageItem.new(metadatasharing_imported_package_item_params)
    @metadatasharing_imported_package_item.save
    respond_with(@metadatasharing_imported_package_item)
  end

  def update
    @metadatasharing_imported_package_item.update(metadatasharing_imported_package_item_params)
    respond_with(@metadatasharing_imported_package_item)
  end

  def destroy
    @metadatasharing_imported_package_item.destroy
    respond_with(@metadatasharing_imported_package_item)
  end

  private
    def set_metadatasharing_imported_package_item
      @metadatasharing_imported_package_item = MetadatasharingImportedPackageItem.find(params[:id])
    end

    def metadatasharing_imported_package_item_params
      params.require(:metadatasharing_imported_package_item).permit(:imported_package_id, :imported_item_id)
    end
end
