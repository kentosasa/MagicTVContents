require 'rss'
require 'pry'
require 'json'
# URLにアクセスするためのライブラリの読み込み
require 'open-uri'
# Nokogiriライブラリの読み込み
require 'nokogiri'
json_file_path = 'news.json'

def read_text(url)
  charset = 'utf-8'
  html = open(url) do |f|
    charset = f.charset # 文字種別を取得
    f.read # htmlを読み込んで変数htmlに渡す
  end

  # htmlをパース(解析)してオブジェクトを生成
  doc = Nokogiri::HTML.parse(html, nil, charset)
  doc.search('br').each do |br|
    br.replace("\n")
  end
  return doc.css('.articleBody span').first.text.strip
end

entries = []

rss = RSS::Parser.parse("http://news.livedoor.com/topics/rss/top.xml")
rss.items.each{|item|
  entry = {}
  entry["title"] = item.title
  entry["link"] = item.link
  entry["text"] = read_text(item.link)
  entries << entry
}

open(json_file_path, 'w') do |io|
  io.puts(entries.to_json)
end
