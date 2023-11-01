class Api::V1::MetadatasharingImportedPackagesController < ApplicationController
  before_action :set_metadatasharing_imported_package, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @metadatasharing_imported_packages = MetadatasharingImportedPackage.all
    respond_with(@metadatasharing_imported_packages)
  end

  def show
    respond_with(@metadatasharing_imported_package)
  end

  def create
    @metadatasharing_imported_package = MetadatasharingImportedPackage.new(metadatasharing_imported_package_params)
    @metadatasharing_imported_package.save
    respond_with(@metadatasharing_imported_package)
  end

  def update
    @metadatasharing_imported_package.update(metadatasharing_imported_package_params)
    respond_with(@metadatasharing_imported_package)
  end

  def destroy
    @metadatasharing_imported_package.destroy
    respond_with(@metadatasharing_imported_package)
  end

  private
    def set_metadatasharing_imported_package
      @metadatasharing_imported_package = MetadatasharingImportedPackage.find(params[:id])
    end

    def metadatasharing_imported_package_params
      params.require(:metadatasharing_imported_package).permit(:uuid, :package_uuid, :date_created, :name, :description, :date_imported)
    end
end
