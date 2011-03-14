module TutorialMediasHelper
  def remove_html_tags(html)
    html = html.sub('<img src="', '')
    html = html.sub('" >', '')
  end

  def get_image_tag(url)
    "<img src=\"" + url + "\" >"
  end
end
