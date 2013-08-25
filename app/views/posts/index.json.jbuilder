json.array!(@posts) do |post|
  json.extract! post, :path, :title, :content, :published_at
  json.url post_url(post, format: :json)
end
