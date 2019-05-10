class AstronautsController < ApplicationController

  def index
    @astronauts = Astronaut.all
    # @missions = Astronaut.missions.mission_sort
  end

end
