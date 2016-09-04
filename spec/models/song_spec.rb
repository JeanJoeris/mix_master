require 'rails_helper'

RSpec.describe Song, type: :model do

  context "given correct data" do
    it  "has all the right attributes" do
      title = "Friday"
      song = Song.new(title: title)

      expect(song.title).to eq(title)
    end
  end

  context "given partial data" do
    it "requires a title" do
      song = Song.new()

      expect(song).to be_invalid
    end
  end
end
