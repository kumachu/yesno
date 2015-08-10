json.array!(@mngs) do |mng|
  json.extract! mng, :id, :question, :yes, :no
  json.url mng_url(mng, format: :json)
end
