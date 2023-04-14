class OpenaiService

  def initialize
    @client ||= OpenAI::Client.new
  end

  def generate_content(content)
    prompt_to_send = ContentType.find_by(content_type: 'Email')&.template.to_s
    prompt_keys = get_prompt_keys(content)
    prompt_keys.keys.each do |key|
      prompt_to_send = prompt_to_send.gsub("<#{key.to_s}>", prompt_keys[key].to_s)
    end
    @client.completions(parameters: { model: Figaro.env.ai_model, prompt: prompt_to_send, max_tokens: 2500 })
  end

  private

  def get_prompt_keys(content)
    { 
      business_ideal_customer: content.business_ideal_customer,
      business_problem_solved: content.business_problem_solved,
      content_topic: content.content_topic,
      topic_quantity: content.topic_quantity,
      business_customer_subtype: content.business_customer_subtype,
      business_customer_subtype_result: content.business_customer_subtype_result
    }
  end
end
