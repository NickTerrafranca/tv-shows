class CharactersController < ApplicationController

  def create
    @character = Character.new(character_params)
    @television_show = TelevisionShow.find(params[:television_show_id])
    @character.television_show_id = @television_show.id

    if @character.save
      flash[:notice] = "Success."
      redirect_to @television_show
    else
      flash[:notice] = "Something whent wrong, you posting could not be saved."
      redirect_to @television_show
    end
  end

  def character_params
    params.require(:character).permit(:actor_name, :character_name, :description)
  end

end
