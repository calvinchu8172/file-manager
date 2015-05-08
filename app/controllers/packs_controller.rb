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

    if @pack.update( pack_params )
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

  def recycler
    @packs = Pack.all
  end

  def bulk_update
    ids = Array(params[:ids])
    packs = ids.map{ |i| Pack.find_by_id(i) }.compact

      if params[:commit] == I18n.t("Bulk_Delete")
        packs.each do |e|
          e.destroy
        end
      elsif params[:commit] == I18n.t("Soft_Delete")
        packs.each do |e|
          e.set_delete
        end
      elsif params[:commit] == I18n.t("Recover")
        packs.each do |e|
          e.reset_delete
        end
      elsif params[:commit] == I18n.t("Bulk_Clone")
        packs.each do |e|
          b = e.dup
          b.name = I18n.t("dup_") + b.name
          b.save
        end
      end

    redirect_to packs_path
  end

  private

  def pack_params
    params.require(:pack).permit(:name, :description, :is_deleted)
  end

end
