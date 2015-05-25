json.array!(@editorials) do |editorial|
  json.extract! editorial, :id, :name, :address, :phone, :email
  json.url editorial_url(editorial, format: :json)
end
