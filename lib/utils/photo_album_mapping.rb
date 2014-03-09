Post.where(path: "photo_album").each do |post|
  Upload.where(category: "#{post.path}##{post.hash_name}").each do |upload|
    upload.post = post
    upload.save!
  end
end
