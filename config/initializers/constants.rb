METRO_RAILWAY = YAML.load_file("#{Rails.root}/config/metro_railwayDict.yaml")
METRO_STATION = YAML.load_file("#{Rails.root}/config/metro_stationDict.yaml")
METRO_RAILSTA = YAML.load_file("#{Rails.root}/config/metro_railwaystationDict.yaml")
METRO_STAMP   = YAML.load_file("#{Rails.root}/config/metro_stampDict.yaml")
METRO_TROPHY  = YAML.load_file("#{Rails.root}/config/metro_trophyDict.yaml")

APP_NAME = "めとろべあ"

# wikimedia file url hash
WH = {
  "Ginza"=>"e/ee",
  "Marunouchi"=>"a/a5",
  "Hibiya"=>"1/1a",
  "Tozai"=>"e/e4",
  "Chiyoda"=>"f/f7",
  "Yurakucho"=>"0/04",
  "Hanzomon"=>"7/71",
  "Namboku"=>"7/74",
  "Fukutoshin"=>"8/8b"
}

# Tokyometro color schemes
CS = {
  "Ginza"=>"#f39700",
  "Marunouchi"=>"#e60012",
  "Hibiya"=>"#9caeb7",
  "Tozai"=>"#00a7db",
  "Chiyoda"=>"#009944",
  "Yurakucho"=>"#d7c447",
  "Hanzomon"=>"#9b7cb6",
  "Namboku"=>"#00ada9",
  "Fukutoshin"=>"#bb641d"
}
