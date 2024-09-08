# frozen_string_literal: true

# DashboardController
class DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    @projects = Project.all
  end

  def home; end
end
