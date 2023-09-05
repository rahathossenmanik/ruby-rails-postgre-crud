class CharacterController < ApplicationController
  def index
    @characters = Character.all
    puts @characters
    render json: @characters, status: :ok
  end

  def show
    @character = Character.find(params[:id])
    fresh_when etag: @character
  end

  def create
    character = Character.create!(character_params)
    redirect_to character
  end

  def update
    character = Character.find(params[:id])
    character.update!(character_params)
    redirect_to character
  end

  def destroy
    character = Character.find(params[:id])
    character.destroy!
    redirect_to characters_path
  end

  private
    def character_params
      params.require(:character).permit(:title, :content)
    end
end
