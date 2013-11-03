module ApplicationHelper
  def nl2br(str)
    return ''.html_safe if str.blank?
    str = str.split(/\r\n|\n\r|\r|\n/o).map {|line| line }.join('<br>')
    str.html_safe
  end
end
