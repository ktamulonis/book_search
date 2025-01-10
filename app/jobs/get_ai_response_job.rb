class GetAiResponseJob < ApplicationJob
  queue_as :default

  attr_reader :chat, :user_prompt, :message

  def perform(chat_id, user_prompt)
    @chat = Chat.find(chat_id)
    @user_prompt = user_prompt
    @message = chat.messages.create(role: 0, content: '') # Placeholder message

    service = BookSearchService.new(user_prompt)

    # Stream the response and update the message content
    full_response = ''

    response = service.call do |chunk|
      error = JSON.parse(chunk)['error'] rescue nil

      if error.present?
        message.update(content: error_message(error)) 
        return
      end

      parsed_chunks = parse_chunk(chunk)
      next unless parsed_chunks

      parsed_chunks.each do |parsed_chunk|
        full_response += parsed_chunk['response']

        message.content = full_response
        message.save!
      end
    end
  end

  private

  def error_message(error)
    "### Awh shoot! 😢\n\nSomething went wrong:\n\n```\n#{error.truncate(100)}\n```"
  end

  def parse_chunk(chunk)
    # Split concatenated JSON objects
    json_objects = chunk.scan(/\{.*?\}/)

    # Parse each JSON object and return as an array
    json_objects.map { |json_str| JSON.parse(json_str) rescue nil }.compact
  end
end

