require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/cd')

get('/') do
  @cds = Cd.all()
  @found_cds = []
  erb(:index)
end

post('/cd_info') do
  @cds = Cd.all()
  artist = params.fetch('artist1')
  album = params.fetch('album1')
  @cd = Cd.new({ :artist => artist, :album => album })
  @cd.save()
  redirect('/')
end

post('/search') do
  @cds = Cd.all()
  search_cd = params.fetch('search')
  @found_cds = Cd.find(search_cd)
  erb(:index)
end
