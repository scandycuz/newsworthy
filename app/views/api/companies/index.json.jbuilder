json.companies @companies do |company|
  json.extract! company, :id, :title, :symbol, :slug, :sentiment, :anger, :disgust, :fear, :joy, :sadness 
end
