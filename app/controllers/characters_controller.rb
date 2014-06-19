class CharactersController < ApplicationController

  def index
    @characters = Character.all
  end

  def create
    @character = Character.new(character_params)
    @television_show = TelevisionShow.find(params[:television_show_id])
    @character.television_show_id = @television_show.id

    if @character.save
      flash[:notice] = "Success."
      redirect_to @television_show
    else
      flash[:notice] = "Something whent wrong, your posting could not be saved."
      render :template => "television_shows/show"
    end
  end

   def destroy
    # binding.pry
    @character = Character.find(params[:id])
    @character.destroy
    if @character.destroy
      flash[:notice] = 'Your entry was deleted'
      redirect_to '/characters'
    else
      flash.now[:notice] = "Your entry couldn't be deleted."
      render "/characters"
    end
  end

  def character_params
    params.require(:character).permit(:actor_name, :character_name, :description)
  end

end
