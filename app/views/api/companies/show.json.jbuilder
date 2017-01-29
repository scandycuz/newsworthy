json.company do
  json.extract! @company, :id, :title, :symbol, :slug, :sentiment, :anger, :disgust, :fear, :joy, :sadness, :prev_sentiment, :prev_anger, :prev_disgust, :prev_fear, :prev_joy, :prev_sadness
  json.articles do
    json.array! @article_ids
  end
end
json.articles @articles do |article|
  json.extract! article, :id, :title, :url, :company_id, :sentiment, :anger, :disgust, :fear, :joy, :sadness
end
