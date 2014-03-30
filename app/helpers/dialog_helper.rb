module DialogHelper
  def render_dialog(content_view_name, options = {})
    render partial: content_view_name, layout: "dialog", locals: options
  end
end
