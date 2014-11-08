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
  "Ginza"=>"#ff9500",
  "Marunouchi"=>"#f62e36",
  "Hibiya"=>"#b5b5ac",
  "Tozai"=>"#009bbf",
  "Chiyoda"=>"#00bb85",
  "Yurakucho"=>"#c1a470",
  "Hanzomon"=>"#8f76d6",
  "Namboku"=>"#00ac9b",
  "Fukutoshin"=>"#9c5e31"
}
