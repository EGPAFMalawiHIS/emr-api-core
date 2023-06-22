class Api::V1::LiquibasechangeloglocksController < ApplicationController
  before_action :set_liquibasechangeloglock, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @liquibasechangeloglocks = Liquibasechangeloglock.all
    respond_with(@liquibasechangeloglocks)
  end

  def show
    respond_with(@liquibasechangeloglock)
  end

  def create
    @liquibasechangeloglock = Liquibasechangeloglock.new(liquibasechangeloglock_params)
    @liquibasechangeloglock.save
    respond_with(@liquibasechangeloglock)
  end

  def update
    @liquibasechangeloglock.update(liquibasechangeloglock_params)
    respond_with(@liquibasechangeloglock)
  end

  def destroy
    @liquibasechangeloglock.destroy
    respond_with(@liquibasechangeloglock)
  end

  private
    def set_liquibasechangeloglock
      @liquibasechangeloglock = Liquibasechangeloglock.find(params[:id])
    end

    def liquibasechangeloglock_params
      params.require(:liquibasechangeloglock).permit(:LOCKED, :LOCKGRANTED, :LOCKEDBY)
    end
end
