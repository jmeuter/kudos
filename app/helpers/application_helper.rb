module ApplicationHelper

  def title(page_title)
    content_for(:title) { page_title }
  end

  def subtitle(subtitle)
    content_for(:subtitle) { subtitle }
  end

end
