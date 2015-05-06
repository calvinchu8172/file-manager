class PacksController < ApplicationController

  def index
    @packs = Pack.all
  end

  def show
    @pack = Pack.find(params[:id])
  end

  def new
    @pack = Pack.new
  end

  def create
    @pack = Pack.new(pack_params)
    if @pack.save
      redirect_to packs_path
    else
      render :new
    end
  end

  def edit
    @pack = Pack.find(params[:id])
  end

  def update
    @pack = Pack.find(params[:id])

    if @pack = Pack.update(pack_params)
      redirect_to pack_path(@pack)
    else
      render :edit
    end
  end

  def destroy
    @pack = Pack.find(params[:id])
    @pack.destroy

    redirect_to packs_path
  end

  private

  def pack_params
    params.require(:pack).permit(:name, :description)
  end

end
