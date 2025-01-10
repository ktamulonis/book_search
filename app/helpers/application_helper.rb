module ApplicationHelper
  def render_markdown(text)
    # Preprocess the text:
    formatted_text = text
      .gsub(/^\s*\+\s*/, '-  ')             # Replace lines starting with `-` with 2 spaces
      .gsub(/(?<!\n)\s*•/, "\n\n•")        # Ensure newlines before `•` (but not if there's already one)

    renderer = Redcarpet::Render::HTML.new(hard_wrap: true)
    markdown = Redcarpet::Markdown.new(renderer, autolink: true, tables: true, fenced_code_blocks: true)
    markdown.render(formatted_text).html_safe
  end
end

