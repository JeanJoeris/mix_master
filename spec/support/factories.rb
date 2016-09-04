FactoryGirl.define do
  factory :artist do
    name
    image_path  "http://www.virginemirecords.com/wp-content/uploads/2015/10/QUEEN.jpg"
  end

  sequence :name do |n|
    "#{n} Artist"
  end

  sequence :playlist_name do |n|
    "Playlist #{n}"
  end


  factory :song do
    title
    artist
  end

  sequence :title, ["A", "B", "C"].cycle do |n|
    "#{n} Title"
  end

  factory :playlist do
    name { generate(:playlist_name) }
    factory :playlist_with_songs do
      songs { create_list(:song, 3) }
    end
  end
end
