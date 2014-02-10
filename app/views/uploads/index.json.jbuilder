json.array!(@uploads) do |upload|
  json.extract! upload, :id, :post_id, :category, :name, :url
  json.url upload_url(upload, format: :json)
end
