require 'pg'

feature 'viewing bookmarks' do
  scenario 'user is able to see their bookmarks' do

    Bookmark.create(title: 'Makers', url: 'http://www.makersacademy.com')
    Bookmark.create(title: 'Destroy All Software', url: 'http://www.destroyallsoftware.com')
    Bookmark.create(title: 'Google', url: 'http://www.google.com')
 
    visit('/bookmarks')
    
    expect(page).to have_link 'Makers', href: 'http://www.makersacademy.com'
    expect(page).to have_link 'Destroy All Software', href: 'http://www.destroyallsoftware.com'
    expect(page).to have_link 'Google', href: 'http://www.google.com'
  end
end
