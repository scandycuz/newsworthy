json.article do
  json.extract! @article, :id, :title, :url, :sentiment, :anger, :disgust, :fear, :joy, :sadness, :company_id
end
