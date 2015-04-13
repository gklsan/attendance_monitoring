json.array!(@emptests) do |emptest|
  json.extract! emptest, :id, :ecode, :name, :shift, :sintime, :aintime
  json.url emptest_url(emptest, format: :json)
end
