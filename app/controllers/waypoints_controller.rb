class WaypointsController < ApplicationController
  before_action :find_waypoint
  before_action :find_route

  def update
    if @waypoint.update(waypoint_params)
      redirect_to @route, notice: 'Waypoint was successfully updated.'
    else
      redirect_to root_path, notice: 'Oops, something goes wrong!'
    end
  end

  private

  def find_waypoint
    @waypoint = Waypoint.find(params[:id])
  end

  def find_route
    @route = Route.find(params[:route_id])
  end

  def waypoint_params
    params.require(:waypoint).permit(:route_id, :position, :arrival_time, :departure_time)
  end
end
