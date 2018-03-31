module IconHelper
  def icon(name, text = nil)
    tags = []
    tags << content_tag(:i, nil, class: "icon icon-#{name}")
    tags << " #{text}" if text

    safe_join(tags)
  end
end
