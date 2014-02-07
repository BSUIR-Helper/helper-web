json.array!(@lectors) do |lector|
  json.extract! lector, :id, :name, :title, :description
  json.url lector_url(lector, format: :json)
end
