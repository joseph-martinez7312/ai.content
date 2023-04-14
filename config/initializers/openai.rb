OpenAI.configure do |config|
  config.access_token = Figaro.env.open_ai_access_token
end
