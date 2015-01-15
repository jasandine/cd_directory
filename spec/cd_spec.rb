require('rspec')
require('cd')

describe(Cd) do
  before() do
    Cd.clear()
  end

  describe("#artist") do
    it("returns the name of the artist(key)") do
    test_cd1 = Cd.new({ :artist => "pink floyd", :album => "animals" })
    expect(test_cd1.artist()).to(eq("pink floyd"))
  end
end

  describe("#album") do
    it("returns the name of the album(value)") do
      test_cd1 = Cd.new({ :artist => "pink floyd", :album => "animals" })
      expect(test_cd1.album()).to(eq("animals"))
    end
  end

  describe(".clear") do
    it("empties out all of the saved cds") do
      Cd.new({ :artist => "pink floyd", :album => "animals" }).save()
      Cd.clear()
      expect(Cd.all()).to(eq([]))
    end
  end

  describe(".all") do
    it("returns the array of cds") do
      test_cd1 = Cd.new({ :artist => "pink floyd", :album => "animals" })
      test_cd1.save()
      test_cd2 = Cd.new({ :artist => "johnny cash", :album => "the man in black" })
      test_cd2.save()
      expect(Cd.all()).to(eq([test_cd1, test_cd2]))
    end
  end

  describe(".find") do
    it("returns a CD by the artist name") do
      test_cd1 = Cd.new({ :artist => "pink floyd", :album => "animals" })
      test_cd1.save()
      test_cd2 = Cd.new({ :artist => "johnny cash", :album => "the man in black" })
      test_cd2.save()
      expect(Cd.find("pink floyd")).to(eq([test_cd1]))
    end
  end
end
