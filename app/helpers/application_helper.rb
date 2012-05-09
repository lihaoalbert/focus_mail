module ApplicationHelper
  def full_title(page_title)
    base_title = "Focus Mail"
    if page_title.empty?
      base_title
    else
      %Q{#{base_title} | #{page_title}}
    end
  end
end
