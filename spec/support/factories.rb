FactoryGirl.define do
  factory :artist do
    name
    image_path  "http://www.virginemirecords.com/wp-content/uploads/2015/10/QUEEN.jpg"
  end

  sequence :name do |n|
    "#{n} Artist"
  end

  # sequence :playlist_name do |n|
  #   "#{n} playlist"
  # end

  sequence :title, ["A", "B", "C"].cycle do |n|
    "#{n} Title"
  end

  factory :song do
    title
    artist
  end

  factory :playlist do
    name
  end

  factory :playlist_song do
    playlist
    song
  end
end
