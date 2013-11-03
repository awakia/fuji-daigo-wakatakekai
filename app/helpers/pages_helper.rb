module PagesHelper
  def side_link_to(page)
    selected = params[:action].to_sym == page.path
    class_attr = page.parent.present? ? 'tag_btn_sub' : 'tag_btn'
    class_attr += ' selected' if selected
    class_attr += ' hidden' if page.parent.present? && (params[:action].to_sym != page.parent && Page.find(params[:action].to_sym).try(:parent) != page.parent)
    res = "<li class=\"#{class_attr}\">"
    res += link_to_if !selected, page.title, pages_path(page.path)
    res += '</li>'
    res.html_safe
  end
end
