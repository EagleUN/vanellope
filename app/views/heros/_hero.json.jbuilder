json.extract! hero, :id, :info, :name, :age, :salary, :created_at, :updated_at
json.url hero_url(hero, format: :json)
