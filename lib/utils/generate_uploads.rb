require 'csv'

# def process(dirname, category = nil)
#   p "[%s] %s" % [Time.now, dirname]
#   category = nil if category == 'archive'
#   Dir::foreach(dirname) do |item|
#     next if item == '.' || item == '..'
#     full_path = File.join(dirname, item)
#     if File.ftype(full_path) == 'directory'
#       next if item == 'thumbs'
#       process(full_path, category || item)
#     elsif File.extname(item).downcase.in? ['.jpg', '.png', '.pdf']
#       next if item.start_with?('title_')  # skip title images
#       next if item.start_with?('t_')  # skip thumb images
#       name = nil
#       name = 'data_' + item if dirname.end_with?('data') && category == 'info'

#       fin = File.open(full_path, 'r')
#       categ = category
#       categ = 'root' if category == 'top'
#       categ += '#' + dirname.split('/')[-2] if category == 'photo_album'
#       Upload.create(file: fin, category: categ, name: name)
#       fin.close
#     end
#   end
# end

# process '/Users/aikawa/Desktop/wakatake_140228'

filename = Rails.root.join('db', 'uploads.csv')
CSV.open(filename, 'w') do |writer|
  p %w(category name file)
  writer << %w(category name file)
  Upload.order(:id).each do |u|
    p [u.category.to_s, u.name.to_s, u.file.to_s]
    writer << [u.category.to_s, u.name.to_s, u.file.to_s]
  end
end
