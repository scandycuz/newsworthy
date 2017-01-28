json.articles @articles do |article|
  json.extract! article, :id, :title, :url, :company_id, :sentiment, :anger, :disgust, :fear, :joy, :sadness
end
