json.companies @companies do |company|
  json.extract! company, :id, :title, :symbol, :rating, :slug
end
