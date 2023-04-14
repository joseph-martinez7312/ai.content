class ContentsController < ApplicationController
  before_action :set_content, only: %i[ show edit update destroy generate ]

  def index
    @content_types = ContentType.all.pluck(:content_type)
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
    OpenAI.configure do |config|
       config.access_token = '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'
    end
    client = OpenAI::Client.new
    prompt_to_send = ContentType.find_by(content_type: params[:output_type])&.template.to_s

    prompt_keys = { 
      output_language: params[:output_language],
      business_ideal_customer: @content.business_ideal_customer,
      business_problem_solved: @content.business_problem_solved,
      content_topic: @content.content_topic,
      topic_quantity: @content.topic_quantity,
      user_action: get_action(@content.content_topic),
      business_customer_subtype: @content.business_customer_subtype,
      business_customer_subtype_result: @content.business_customer_subtype_result
    }
    
    prompt_keys.keys.each do |key|
      prompt_to_send = prompt_to_send.gsub("<#{key.to_s}>", prompt_keys[key].to_s)
    end
    #prompt_to_send = prompt_to_send.gsub("<avoid|know|accomplish etc>", prompt_keys[:user_action])
   
    response = client.completions(
      parameters: {
        model: 'text-davinci-003',
        prompt: prompt_to_send,
        max_tokens: 2500
      }
    )
    redirect_to content_path(@content)
  end

  def get_action(content_topic)
    case content_topic
    when "Problems"
      return "avoid"
    when "Secrets"
      return "know"
    when "Things"
      return "accomplish"
    end
  end

  private
    def set_content
      @content = Content.find(params[:id])
    end

    def content_params
      params.require(:content).permit(:business_ideal_customer, :business_problem_solved, :output_language, :content_topic, :topic_quantity, :business_customer_subtype, :business_customer_subtype_needs, :business_customer_subtype_result)
    end
end
