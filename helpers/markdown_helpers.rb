module MarkdownHelpers
  def markdown(text)
    renderer = Redcarpet::Render::XHTML.new
    markdown = Redcarpet::Markdown.new(renderer)
    return markdown.render(text)
  end

  def markdownFromFile(file)
    contents = File.read file
    return markdown(contents);
  end
end