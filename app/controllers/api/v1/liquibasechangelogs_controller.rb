class Api::V1::LiquibasechangelogsController < ApplicationController
  before_action :set_liquibasechangelog, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @liquibasechangelogs = Liquibasechangelog.all
    respond_with(@liquibasechangelogs)
  end

  def show
    respond_with(@liquibasechangelog)
  end

  def create
    @liquibasechangelog = Liquibasechangelog.new(liquibasechangelog_params)
    @liquibasechangelog.save
    respond_with(@liquibasechangelog)
  end

  def update
    @liquibasechangelog.update(liquibasechangelog_params)
    respond_with(@liquibasechangelog)
  end

  def destroy
    @liquibasechangelog.destroy
    respond_with(@liquibasechangelog)
  end

  private
    def set_liquibasechangelog
      @liquibasechangelog = Liquibasechangelog.find(params[:id])
    end

    def liquibasechangelog_params
      params.require(:liquibasechangelog).permit(:ID, :AUTHOR, :FILENAME, :DATEEXECUTED, :MD5SUM, :DESCRIPTION, :COMMENTS, :TAG, :LIQUIBASE, :ORDEREXECUTED, :EXECTYPE)
    end
end
