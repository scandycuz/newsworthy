json.companies @companies do |company|
  json.extract! company, :id, :title, :rating, :slug
end
