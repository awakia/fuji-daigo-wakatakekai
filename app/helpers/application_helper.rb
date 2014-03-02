module ApplicationHelper
  def main_content_classes(options = {})
    controller = options[:controller] || params[:controller]
    action = options[:action] || params[:action]
    [
      "#{controller}-controller".gsub(%r(/|_), '-'),
      "#{controller}-#{canonical_action_name(action)}".gsub(%r(/|_), '-')
    ].join(' ')
  end

  def canonical_action_name(action)
    aliases = { "update" => "edit", "create" => "new" }
    aliases[action] || action
  end
end
