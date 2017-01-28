json.company do
  json.extract! @company, :id, :title, :symbol, :slug, :sentiment, :anger, :disgust, :fear, :joy, :sadness, :prev_sentiment, :prev_anger, :prev_disgust, :prev_fear, :prev_joy, :prev_sadness

  json.articles @article do |article|
    json.extract! article, :id, :title, :url, :sentiment, :anger, :disgust, :fear, :joy, :sadness
  end
end
