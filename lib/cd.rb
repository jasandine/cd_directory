class Cd
  @@cds = []

  define_method(:initialize) do |attributes|
    @artist = attributes.fetch(:artist)
    @album = attributes.fetch(:album)
    @id = @@cds.length().+(1)
  end

  define_method(:artist) do
    @artist
  end

  define_method(:album) do
    @album
  end

  define_method(:save) do
    @@cds.push(self)
  end

  define_singleton_method(:clear) do
    @@cds = []
  end

  define_singleton_method(:all) do
    @@cds
  end

  # define_method(:all_artists) do |artist|
  #   @artist.push(self)
  # end

  define_singleton_method(:find) do |identification|
    found_cds = []
    @@cds.each() do |cd|
      if cd.artist().eql?(identification)
        found_cds.push(cd)
      end
    end

     found_cds
  end
end
