module LocaleHelpers
  def unlocalized_url(current_url)
    '/' + current_url.split('/').drop(2).join('/')
  end
  
  def unlocalized_page(current_page)
    new_url = '/' + current_page.url.split('/').drop(2).join('/')
    if current_page.directory_index? && new_url == "/"
      return new_url + "index.html"
    elsif current_page.directory_index?
      return new_url + "/index.html"
    end
    new_url
  end
end