# unit tests
require 'rspec'
require 'album'
require 'pry'

describe '#Album' do

  before(:each) do
    Album.clear()
  end

  describe('#update') do
    it('updates an album by id') do
      album = Album.new('Giant Steps', nil)
      album.save()
      album.update('A Love Supreme')
      expect(album.name).to(eq('A Love Supreme'))
    end
  end

  describe('#save') do
    it("saves an album") do
      album = Album.new("Giant Steps", nil)
      album.save()
      album2 = Album.new("Blue", nil)
      album2.save()
      expect(Album.all).to(eq([album, album2]))
    end
  end

  describe('.all') do
    it("returns an empty array when there are no albums") do
      expect(Album.all).to(eq([]))
    end
  end

  describe('#==') do
    it("is the same album if it has the same attributes as another album") do
      album = Album.new("Blue", nil)
      album2 = Album.new("Blue", nil)
      expect(album).to(eq(album2))
    end
  end

  describe('.find') do
    it("finds an album by id") do
      album = Album.new("Giant Steps", nil)
      album.save()
      album2 = Album.new("Blue", nil)
      album2.save()
      expect(Album.find(album.id)).to(eq(album))
    end
  end

  describe('#update') do
    it("updates an album by id") do
      album = Album.new("Giant Steps", nil)
      album.save()
      album.update("A Love Supreme")
      expect(album.name).to(eq("A Love Supreme"))
    end
  end

  describe('#delete') do
    it("deletes an album by id") do
      album = Album.new("Giant Steps", nil)
      album.save()
      album2 = Album.new("Blue", nil)
      album2.save()
      album.delete()
      expect(Album.all).to(eq([album2]))
    end
  end

  describe('.search') do
    it("searches for an album by name") do
      album = Album.new("Giant Steps", nil)
      album.save()
      expect(Album.search(album.name)).to(eq([album]))
    end
  end

  describe('.sort') do
    it("sorts the albums by name") do
      album = Album.new("Giant Step", nil)
      album.save()
      album2 = Album.new("Blue", nil)
      album2.save()
      album.sort()
      expect(Album.sort(album.name)).to(eq([]))
    end
  end
end