class Api::V1::MetadatasharingExportedPackagesController < ApplicationController
  before_action :set_metadatasharing_exported_package, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @metadatasharing_exported_packages = MetadatasharingExportedPackage.all
    respond_with(@metadatasharing_exported_packages)
  end

  def show
    respond_with(@metadatasharing_exported_package)
  end

  def create
    @metadatasharing_exported_package = MetadatasharingExportedPackage.new(metadatasharing_exported_package_params)
    @metadatasharing_exported_package.save
    respond_with(@metadatasharing_exported_package)
  end

  def update
    @metadatasharing_exported_package.update(metadatasharing_exported_package_params)
    respond_with(@metadatasharing_exported_package)
  end

  def destroy
    @metadatasharing_exported_package.destroy
    respond_with(@metadatasharing_exported_package)
  end

  private
    def set_metadatasharing_exported_package
      @metadatasharing_exported_package = MetadatasharingExportedPackage.find(params[:id])
    end

    def metadatasharing_exported_package_params
      params.require(:metadatasharing_exported_package).permit(:uuid, :date_created, :name, :description, :content)
    end
end
