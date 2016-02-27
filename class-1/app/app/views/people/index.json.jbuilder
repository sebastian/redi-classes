json.array!(@people) do |person|
  json.extract! person, :id, :name, :balance
  json.url person_url(person, format: :json)
end
