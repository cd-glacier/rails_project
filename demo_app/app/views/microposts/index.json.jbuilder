json.array!(@microposts) do |micropost|
  json.extract! micropost, :content, :user
  json.url micropost_url(micropost, format: :json)
end