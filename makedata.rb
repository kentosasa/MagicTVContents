require 'json'
require 'pry'
 urls = [
  "Music/music.json",
  "Tv/tv.json",
  "Hue/hue.json",
  "Door/door.json",
  "Light/light.json",
  "Comic/comic.json",
  "Streaming/streaming.json",
  "Ted/ted.json",
  "Movie/movie.json"
 ]
 data = {}
 data["menu"] = []
 json_file_path = "data.json"

# 読み込む
def read(path)
  json_data = open(path) do |io|
    JSON.load(io)
  end
  return json_data
end

# 更新して
urls.each do |json|
  data["menu"].push(read(json))
end

# 保存する
open(json_file_path, 'w') do |io|
  io.puts(data.to_json)
end