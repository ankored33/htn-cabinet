require "json"
require "open-uri"
require "nokogiri"
require 'cgi'
require 'uri'

class Election
  @@opt = {"User-Agent" => "Opera/9.80 (Windows NT 5.1; U; ja) Presto/2.7.62 Version/11.01 "}

  def initialize
    @entries = []
    @score = {}
    @target_dates = []
    @category = ["", "general", "social", "economics", "life", "knowledge", "it", "fun", "entertainment", "game"]
    for num in 1..3 do
      d = Date.today - num
      @target_dates << d.strftime("%Y%m%d")
    end
  end

  def collect_entry_for_three_days
    @target_dates.each do |target_date|
      self.collect_entry(target_date)
    end
    return @entries
  end

  def collect_entry(target_date)
    hot_entry = "http://b.hatena.ne.jp/hotentry/#{@category}#{target_date}"
    charset = nil
    html = open(hot_entry, @@opt) do |f|
        charset = f.charset
        f.read
    end
    doc = Nokogiri::HTML.parse(html, nil, charset)
    doc.css('.entry-link').each do |node|
      @entries << CGI.escape(node["href"])
    end
  end

  def collect_bkm(url)
    uri = "http://b.hatena.ne.jp/entry/jsonlite/?url=#{url}" 
    io = open(uri, @@opt)
    bkm = JSON.load(io)["bookmarks"]
    bkm.each {|var|
      var["comment"].slice!(/[“‟].*?[””]/)
      comment = var["comment"]
      next if comment == ""
      p comment
      if @score[var["user"]] == nil
        @score[var["user"]] = comment.length
      else
        @score[var["user"]] += comment.length
      end
    }   
  end

  def calc_score
    self.collect_entry_for_three_days.each do |url| 
      self.collect_bkm(url)
      p url
      sleep 0.5
    end
    top = @score.sort {|(k1, v1), (k2, v2)| v2 <=> v1 }
    puts "大臣：" + top[0, 10].sample[0]
  end
end

aaa = Election.new
aaa.calc_score

#var["icon"] = "http://www.hatena.com/users/#{user[0,2]}/#{user}/profile.gif"
#var["comment"] = CGI.escapeHTML(var["comment"])
