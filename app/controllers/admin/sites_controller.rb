class Admin::SitesController < ApplicationController
  load_and_authorize_resource

  layout 'admin'
  def dashboard;end
end
