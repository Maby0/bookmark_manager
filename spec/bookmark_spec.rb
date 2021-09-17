require 'bookmark'
require 'database_helper'

describe Bookmark do
  describe '.all' do
    it 'returns all bookmarks' do

      bookmark = Bookmark.create(title: 'Makers', url: 'http://www.makersacademy.com')
      Bookmark.create(title: 'Destroy All Software', url: 'http://www.destroyallsoftware.com')
      Bookmark.create(title: 'Google', url: 'http://www.google.com')

      bookmarks = Bookmark.all

      expect(bookmarks.length).to eq(3)
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq(bookmark.id)
      expect(bookmarks.first.title).to eq("Makers")
      expect(bookmarks.first.url).to eq('http://www.makersacademy.com')
    end
  end

  describe '.create' do
    it 'creates a bookmark within the database' do
      bookmark = Bookmark.create(title: 'Reddit', url: 'http://www.reddit.com')
      persisted_data = persisted_data(id: bookmark.id)
      
      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.title).to eq 'Reddit'
      expect(bookmark.url).to eq 'http://www.reddit.com'
    end
  end

  describe '.delete' do
    it 'deletes a bookmark from the database' do
      bookmark = Bookmark.create(title: 'Reddit', url: 'http://www.reddit.com')

      Bookmark.delete(id: bookmark.id)
      expect(Bookmark.all.length).to eq 0
    end
  end
end
