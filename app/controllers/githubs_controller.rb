class GithubsController < ApplicationController
  require "open-uri"
  require "nokogiri"

  def index
    url = open("https://github.com/trending")
    doc = Nokogiri::HTML.parse(url, nil, "UTF-8")
    puts doc.xpath('//h1').css('a')
    @contents = doc.xpath('//h1').css('a')
    @stars = doc.xpath('//span[@class="d-inline-block float-sm-right"]')
  end

  def show
    @url = "https://github.com" + params[:repo]
    doc = Nokogiri::HTML(open(@url))
    @title = params[:title]
    @detail = doc.xpath('//div[@class="js-repo-meta-container"]').css('span')
    @tags = doc.xpath('//div[@class="js-repo-meta-container"]').css('a')
    @article = doc.xpath('//article')[0]
  end

  def developers
    url = "https://github.com/trending/developers"
    doc = Nokogiri::HTML(open(url))
    @contents = doc.xpath('//h1').css('a')
    @images = doc.xpath('//img[@class="avatar mb-1"]')
  end

end
