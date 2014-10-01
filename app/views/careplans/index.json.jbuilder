json.array!(@careplans) do |careplan|
  json.extract! careplan, :id
  json.url careplan_url(careplan, format: :json)
end
