class DomainsController < ApplicationController

  before_action :set_params, only: [:update, :show]
  
  def new
    @domain = Domain.new
  end

  def create
    @domain = Domain.new(domain_params)
    if @domain.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @domain.update_attribute(:monitoring, params[:domain][:monitor])
      MonitorJob.perform_later(@domain)
      flash[:notice] = "Monitoring #{@domain.name}"
    else
      flash[:alert] = "Monitoring failed!"
    end
  end

  def show
  end

  private

    def domain_params
      params.require(:domain).permit(:name)
    end

    def set_params
      @domain = Domain.find(params[:id])
    end
end
