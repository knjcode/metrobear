require 'json'
require 'httpclient'

API_ENDPOINT   = "https://api.tokyometroapp.jp/api/v2/"
DATAPOINTS_URL = API_ENDPOINT + "datapoints"
PLACES_URL     = API_ENDPOINT + "places"
ACCESS_TOKEN   = Rails.application.secrets.access_token

module ApplicationHelper

  def full_title(page_title)
    base_title = "Tokyometro Stamp Rally"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def get_current_station(lat, lon, accuracy, user)
    http_client = HTTPClient.new

    # テスト用に銀座駅の座標を指定
    #lat = 35.670304; lon = 139.7671173; accuracy = 100

    # 誤差が大きすぎる場合は補正する
    if accuracy.to_i > 100
      accuracy = 100
    end

    response = http_client.get PLACES_URL,
      { "rdf:type" => "mlit:Station",
        "lat"      => lat,
        "lon"      => lon,
        "radius"   => accuracy,
        "acl:consumerKey" => ACCESS_TOKEN }

    near_stations = []
    visited_stations = []
    JSON.parse(response.body).each do |station|
      if station["mlit:operatorName"] == "東京地下鉄"
        # 日本語表記の駅名から英名を逆引き
        near_stations << METRO_STATION.key(station["mlit:stationName"])
      end
    end

    near_stations.each do |station|
      if Station.exists?(name: station)
        station_id = Station.find_by(name: station).id

        if user
          unless user.visiting?(station_id) then
            user.visitings.create(station_id: station_id)
            visited_stations << METRO_STATION[station]
          end
        end
      end
    end

    return near_stations, visited_stations
  end

end
