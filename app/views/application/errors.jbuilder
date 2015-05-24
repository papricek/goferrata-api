json.errors do
  json.array! @errors do |error|
    json.title error[:title]
    json.status error[:status]
  end
end
