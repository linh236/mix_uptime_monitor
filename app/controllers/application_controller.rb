class ApplicationController < ActionController::Base
  before_action :domains

  def domains 
    @domains ||= Domain.all.order(created_at: :desc)
  end
end
