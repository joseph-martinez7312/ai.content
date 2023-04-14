class ContentTypesController < ApplicationController
  before_action :set_content_type, only: %i[ show edit update destroy ]

  # GET /content_types or /content_types.json
  def index
    @content_types = ContentType.all
  end

  # GET /content_types/1 or /content_types/1.json
  def show
  end

  # GET /content_types/new
  def new
    @content_type = ContentType.new
  end

  # GET /content_types/1/edit
  def edit
  end

  # POST /content_types or /content_types.json
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

  # PATCH/PUT /content_types/1 or /content_types/1.json
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

  # DELETE /content_types/1 or /content_types/1.json
  def destroy
    @content_type.destroy

    respond_to do |format|
      format.html { redirect_to content_types_url, notice: "Content type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content_type
      @content_type = ContentType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def content_type_params
      params.require(:content_type).permit(:content_type, :description, :template)
    end
end
