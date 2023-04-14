class ContentTypesController < ApplicationController
  before_action :set_content_type, only: %i[ show edit update destroy ]

  def index
    @content_types = ContentType.all
  end

  def show
  end

  def new
    @content_type = ContentType.new
  end

  def edit
  end

  def create
    @content_type = ContentType.new(content_type_params)

    respond_to do |format|
      if @content_type.save
        format.html { redirect_to content_type_url(@content_type), notice: "Content type was successfully created." }
        format.json { render :show, status: :created, location: @content_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @content_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @content_type.update(content_type_params)
        format.html { redirect_to content_type_url(@content_type), notice: "Content type was successfully updated." }
        format.json { render :show, status: :ok, location: @content_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @content_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @content_type.destroy

    respond_to do |format|
      format.html { redirect_to content_types_url, notice: "Content type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_content_type
      @content_type = ContentType.find(params[:id])
    end

    def content_type_params
      params.require(:content_type).permit(:content_type, :description, :template)
    end
end
