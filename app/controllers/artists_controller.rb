class ArtistsController < ApplicationController
  def new
    @artist_new = Artist.new
  end

  def create
    @artist_new = Artist.new(artist_params)
    @artist_new.save(artist_params)
    redirect_to new_artist_path
  end

  def update
  end

  def destroy
  end

  def show
  end

  private
  def artist_params
    params.require(:artist).permit(:artist_name)
  end
end
