json.array!(@samples) do |sample|
  json.extract! sample, :id, :title, :data
  json.url sample_url(sample, format: :json)
end
