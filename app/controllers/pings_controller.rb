class PingsController < ApplicationController
  def create
    @domain = Domain.find(params[:domain_id])
    @ping = DomainPing.call(@domain)
  end
end
