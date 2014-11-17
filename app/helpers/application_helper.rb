require 'json'
require 'httpclient'

API_ENDPOINT   = "https://api.tokyometroapp.jp/api/v2/"
DATAPOINTS_URL = API_ENDPOINT + "datapoints"
PLACES_URL     = API_ENDPOINT + "places"
ACCESS_TOKEN   = Rails.application.secrets.access_token

module ApplicationHelper

  def full_title(page_title)
    base_title = APP_NAME
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  # 駅毎のスタンプをイメージタグで返却
  def stamp_tag(station)
    "<img src='/images/#{METRO_STAMP[station]}' width='300' height='300' alt='#{station}' />"
  end

  # 路線別の駅アイコンをイメージタグで返却
  def station_icon(railway, id)
    id = id.gsub(/m/,'mm')
    "<img src='/images/#{railway}/#{id}.png' width='32' height='32' alt='#{id}' />"
  end

  # 現在地情報から駅訪問を判定
  def get_current_station(lat, lon, user)
    http_client = HTTPClient.new

    # テスト用に銀座駅の座標を指定
    #lat = 35.670304; lon = 139.7671173

    response = http_client.get PLACES_URL,
      { "rdf:type" => "mlit:Station",
        "lat"      => lat,
        "lon"      => lon,
        "radius"   => 300,
        "acl:consumerKey" => ACCESS_TOKEN }

    if response.code == 200
      near_stations = []
      visited_stations = []
      message = ""
      JSON.parse(response.body).each do |station|
        if station["mlit:operatorName"] == "東京地下鉄"
          # 日本語表記の駅名から英名を逆引き
          near_stations << METRO_STATION.key(station["mlit:stationName"])
        end
      end

      near_stations.each do |station|
        if METRO_STATION.keys.include?(station)
          station_id = METRO_STATION.keys.find_index(station)+1

          if user.present?
            unless user.visiting?(station_id) then
              # visit!メソッド内でset_trophyが呼ばれるため、応答をmessageに追記していく
              message << user.visit!(station_id) << " "
              visited_stations << station
            end
          end
        end
      end
      return near_stations, visited_stations, message
    else
      return false, response.code
    end

  end

  def google_analytics_tracking_code
    tracking_id = Rails.application.secrets.google_analytics_id
    if tracking_id
      return <<-EOS
        <script>
          (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
          (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
          m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
          })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

          ga('create', '#{tracking_id}', 'auto');
          ga('send', 'pageview');

        </script>
      EOS
    else
      return ""
    end
  end

  def facebook_js_code
    appID = Rails.application.secrets.facebook_api_key
    return <<-EOS
      <div id="fb-root"></div>
      <script>(function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = "//connect.facebook.net/ja_JP/sdk.js#xfbml=1&appId=#{appID}&version=v2.0";
        fjs.parentNode.insertBefore(js, fjs);
      }(document, 'script', 'facebook-jssdk'));</script>
    EOS
  end

  def facebook_facepile
    appID = Rails.application.secrets.facebook_api_key
    return <<-EOS
      <div class="fb-facepile" data-app-id="#{appID}" data-href="#{ENV["TMSR_URL"]}" data-max-rows="1" data-colorscheme="light" data-size="small" data-show-count="true"></div>
    EOS
  end

end
