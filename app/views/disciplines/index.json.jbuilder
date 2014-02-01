json.array!(@disciplines) do |discipline|
  json.extract! discipline, :id, :name, :abbr
  json.url discipline_url(discipline, format: :json)
end
