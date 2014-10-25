// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require_tree .

// 位置情報を取得できた場合のコールバック。隠しエレメントに緯度経度誤差を格納する。
function success(position) {
  document.getElementById("lat").value = position.coords.latitude;
  document.getElementById("lon").value = position.coords.longitude;
  document.getElementById("accuracy").value = position.coords.accuracy;
  document.getElementById("position_msg").innerHTML
    = "<i class='fa fa-refresh fa-spin'></i>　位置情報を判定しています";
  document.location.submit();
}

// 位置情報を再取得する際に緯度経度誤差とテキストをクリア
function reset_element() {
  document.getElementById("lat").value = "";
  document.getElementById("lon").value = "";
  document.getElementById("accuracy").value = "";
  document.getElementById("position_msg").innerHTML
    = "<i class='fa fa-refresh fa-spin'></i>　位置情報を取得しています";
}

// 位置情報を取得できなかった場合のコールバック
function error(error) {
  var error_msg = "";
  switch(error.code)
  {
    case error.PERMISSION_DENIED:
      error_msg = "位置情報の利用を有効にしてください";
      break;
    case error.POSITION_UNAVAILABLE:
      error_msg = "位置情報を取得できませんでした";
      break;
    case error.TIMEOUT:
      error_msg = "位置情報の取得にタイムアウトしました";
      break;
  }
  document.getElementById("position_msg").innerHTML = error_msg;
  document.getElementById("retry").style.display = "";
}
