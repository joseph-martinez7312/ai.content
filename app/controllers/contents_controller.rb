class ContentsController < ApplicationController
  before_action :set_content, only: %i[ show edit update destroy generate ]

  def index
    @contents = Content.all
  end

  def show
  end

  def new
    @content = Content.new
  end

  def edit
  end

  def create
    @content = Content.new(content_params)

    respond_to do |format|
      if @content.save
        format.html { redirect_to content_url(@content), notice: "Content was successfully created." }
        format.json { render :show, status: :created, location: @content }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @content.update(content_params)
        format.html { redirect_to content_url(@content), notice: "Content was successfully updated." }
        format.json { render :show, status: :ok, location: @content }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @content.destroy

    respond_to do |format|
      format.html { redirect_to contents_url, notice: "Content was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def generate
    response = OpenaiService.new.generate_content(@content)
    @content_result = @content.content_results.create(content_results_params(response))
    redirect_to content_path(@content)
  end

  def content_results_params(params)
    {
      output_content: params['choices'].map { |c| c['text'] }.last,
    }
  end

  private

    def set_content
      @content = Content.find(params[:id])
    end

    def content_params
      params.require(:content).permit(:business_ideal_customer, :business_problem_solved, :output_language, :content_topic, :topic_quantity, :business_customer_subtype, :business_customer_subtype_needs, :business_customer_subtype_result)
    end
end
