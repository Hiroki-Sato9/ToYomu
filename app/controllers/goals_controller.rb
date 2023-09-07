class GoalsController < ApplicationController
  def new
    @goal = Goal.new
  end

  def create
    year = params[:goal]["date(1i)"]
    month = params[:goal]["date(2i)"]
    day = params[:goal]["date(3i)"]
    date = Time.zone.parse("#{year}-#{month}-#{day}")
  end
end
