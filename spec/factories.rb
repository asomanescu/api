FactoryGirl.define do
  factory :episode do
    series ""
    name "MyString"
    release_date "2016-04-17"
    season 1
    episode_number 1
    overview "MyText"
    rating 1.5
  end
  factory :series do
    name "MyString"
    rating 1.5
    status "MyString"
    first_aired "2016-04-17 00:18:15"
    fan_art "MyString"
    overview "MyText"
    genre "MyString"
    banner "MyString"
    imdb_id "MyString"
  end
end
