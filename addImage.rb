require 'json'
require 'pry'

def add_type(json)
  # if json["children"]
  #   json["type"] = "menu"
  # else
  #   json["type"] = "web"
  # end
  json["image"] = ARGV[1]
  return json
end

def has_children(jsons)
  return unless jsons["children"]
  jsons["children"].each do |json|
    add_type(json)
    has_children(json)
  end
  jsons["children"]
end

json_file_path = ARGV[0]

# 読み込んで
json_data = open(json_file_path) do |io|
  JSON.load(io)
end

jsons = json_data["children"]

# 更新して
jsons.each do |json|
  add_type(json)
  has_children(json)
end

json_data["children"] = jsons

# 保存する
open(json_file_path, 'w') do |io|
  JSON.dump(json_data, io)
end