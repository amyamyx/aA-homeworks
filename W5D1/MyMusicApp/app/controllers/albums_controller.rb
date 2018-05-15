class AlbumsController < ApplicationController
  def show
    @album =find_album

    if @album
      render :show
    else
      flash[:errors] = @album.errors.full_messages
      redirect_to bands_url
    end
  end

  def create

    @album = Album.new(album_params)

    if params[:album][:studio] == "on"
      # debugger
      @album.studio = true
    else
      @album.studio = false
    end

    @album.band_id = Band.find_by(name: params[:album][:band_name]).id
    # debugger
    if @album.save
      redirect_to album_url(@album)
    else
      flash[:errors] = @album.errors.full_messages
      redirect_to edit_album_url
    end
  end

  def new
    @bands = Band.all
    @album = Album.new

    render :new
  end

  def edit
    @album = find_album
    render :edit
  end

  def update
    @album = find_album

    if @album.update_attributes(album_params)
      redirect_to album_url(@album)
    else
      flash[:errors] = @album.errors.full_messages
      redirect_to edit_album_url
    end
  end

  def destroy
    @album = find_album

    @album.destroy
  end

  private

  def find_album
    Album.find(params[:id])
  end

  def album_params
    params.require(:album).permit(:title, :year, :studio, :band_id)
  end

end
