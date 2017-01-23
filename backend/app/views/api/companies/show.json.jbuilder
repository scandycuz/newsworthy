json.company do
  json.extract! @company, :id, :title, :rating, :slug
end
