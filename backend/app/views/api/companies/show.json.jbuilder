json.company do
  json.extract! @company, :id, :title, :symbol, :rating, :slug
end
