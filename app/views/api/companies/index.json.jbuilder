json.companies @companies do |company|
  json.extract! company, :id, :title, :symbol, :slug, :sentiment, :anger, :disgust, :fear, :joy, :sadness, :prev_sentiment, :prev_anger, :prev_disgust, :prev_fear, :prev_joy, :prev_sadness
end
