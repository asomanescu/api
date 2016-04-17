series = [
  "Suits",
  "Gotham",
  "Vikings",
  "Sherlock",
  "Hannibal",
  "Walking dead",
  "The Musketeers",
  "Game of Thrones",
  "Big Bang Theory",
  "Star Wars Rebels",
  "The Flash (2014)",
  "Da Vinci's Demons",
  "Marvel's Agents of",
  "Strike Back (2011)",
  "House of cards (US)",
  "Marvel's Agent Carter",
  "Orange is the new black",
  "How to get away with murder"
].freeze

series.each do |s|
  Series.find_or_create_by(name: s)
end
