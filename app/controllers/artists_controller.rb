class ArtistsController < ApplicationController
  def new
    @artist_new = Artist.new
  end

  def create
    @artist_new = Artist.save(artist_params)
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
