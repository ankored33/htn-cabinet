require "json"
require "open-uri"
require "nokogiri"
require 'cgi'

class Election
  @@opt = {"User-Agent" => "Opera/9.80 (Windows NT 5.1; U; ja) Presto/2.7.62 Version/11.01 "}

  def initialize(url)
    @url = url
  end

  def collect_entry
    entry = "http://b.hatena.ne.jp/hotentry/20171115"
    charset = nil
    html = open(entry, @@opt) do |f|
        charset = f.charset
        f.read
    end
    doc = Nokogiri::HTML.parse(html, nil, charset)
    doc.css('.entry-link').each do |node|
      p node["href"]
    end
  end

  def calc_score
    uri = "http://b.hatena.ne.jp/entry/jsonlite/?url=#{@url}" 
    io = open(uri, @@opt)
    bkm = JSON.load(io)["bookmarks"]
    score = {}
    bkm.each {|var|
      if score[var["user"]] == nil
        score[var["user"]] = var["comment"].length if var["comment"].length > 0
      else
        score[var["user"]] += var["comment"].length
      end
    }   
    puts score
  end
end

aaa = Election.new("http%3A%2F%2Fkyoumoe%2Ehatenablog%2Ecom%2Fentry%2F20171102%2F1509614165")
aaa.collect_entry

#var["icon"] = "http://www.hatena.com/users/#{user[0,2]}/#{user}/profile.gif"
#var["comment"] = CGI.escapeHTML(var["comment"])
