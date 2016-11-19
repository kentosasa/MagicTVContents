let entries = require('./topic.json')
let count = 0
for(let entry of entries) {
  $("#contents").append("<div id='" + count + "' class='item'><div class='card card-block'>"+
    "<h4 class='card-title'>" + entry["title"] + "</h4>" +
    "<p class='card-text'>" + entry["text"].replace(/\n/g,'<br>') + "</p>" +
    "</div></div class='item'>"
    );
  count++
}
count = 0

speechSynthesis.cancel()
let synthesis = new SpeechSynthesisUtterance()
synthesis.lang = 'ja-JP'
synthesis.rate = 1.5

// synthesis.addEventListener('end', function () {
//   slide()
//   play(entries[count])
// })

synthesis.onend = function (event) {
  console.log("end")
  slide()
  play(entries[count])
}

let play = (entry) => {
  synthesis.text = entry["title"] + "\n\n" + entry["text"]
  speechSynthesis.speak(synthesis)
}

let slide = function() {
  if (count == entries.length-1) {
    $(".item").removeClass("hide")
    count = 0
  }
  let id = "#"+count
  $(id).addClass("hide")
  count++
}
play(entries[0])