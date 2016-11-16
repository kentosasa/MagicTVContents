let entries = require('./news.json')
let count = 0
for(let entry of entries) {
  $("#contents").append("<div id='" + count + "' class='item'><div class='card card-block'>"+
    "<h4 class='card-title'>" + entry["title"] + "</h4>" +
    "<p class='card-text'>" + entry["text"] + "</p>" +
    "</div></div class='item'>"
    );
  count++
}
count = 0
let slide = function() {
  if (count == entries.length-1) {
    $(".item").removeClass("hide")
    count = 0
  }
  let id = "#"+count
  $(id).addClass("hide")
  count++
}
setInterval(slide, 20000)