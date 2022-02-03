class HomeController < ApplicationController
  def index
    @model_names = [Division, Employee, Target, Team, User]
  end
end
