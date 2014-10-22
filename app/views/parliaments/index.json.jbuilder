json.array!(@parliaments) do |parliament|
  json.extract! parliament, :id
  json.url parliament_url(parliament, format: :json)
end
