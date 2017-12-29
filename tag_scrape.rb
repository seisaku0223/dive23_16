
require 'nokogiri'
require 'open-uri'
require 'open_uri_redirections'


url = 'https://ja.stackoverflow.com/tags?page=3&tab=popular'

  charset = nil

tags =[]
    html = open(url, :allow_redirections => :all) do |f|
        charset = f.charset
        f.read
    end

    doc = Nokogiri::HTML.parse(html, nil, charset)
    doc.xpath('//td[@class="tag-cell"]//div[@class="excerpt"]').each do |node|
      tag = node.text
      tags.push(tag)
    end
   tags

# 複数のページのスクレイピング用
  #   urls = %w(
  #   https://ja.stackoverflow.com/tagshttps://ja.stackoverflow.com/tags?page=2&tab=popularhttps://ja.stackoverflow.com/tags?page=3&tab=popular
  # )
  # urls.each do |url|
  # charset = nil
  #
  # tags =[]
  #     html = open(url, :allow_redirections => :all) do |f|
  #         charset = f.charset
  #         f.read
  #     end
  #
  #     doc = Nokogiri::HTML.parse(html, nil, charset)
  #     doc.xpath('//td[@class="tag-cell"]//div[@class="excerpt"]').each do |node|
  #       tag = node.text
  #       tags.push(tag)
  #     end
  #    tags
  #

#csvファイルとして、スクレイピンしたものを同じディレクトリに作成
  require "csv"
  CSV.open("stackoverflow_tags.csv", "w") do |csv|
   csv << tags
  end
