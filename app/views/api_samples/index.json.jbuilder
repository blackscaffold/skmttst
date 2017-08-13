json.array!(@api_samples) do |api_sample|
  json.extract! api_sample, :id, :uri, :body
  json.url api_sample_url(api_sample, format: :json)
end
