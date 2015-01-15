require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/cd')

get('/') do
  @cds = Cd.all()
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
  @cds = CD.all()
  @found_cd = nil
  search_cd = params.fetch('search')
  @cds.each() do |cd|
    if cd.artist() == search_cd
      @found_cd = cd
    end
    @found_cd
  end
  erb(:index)
end
