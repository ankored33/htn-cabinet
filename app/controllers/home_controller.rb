class HomeController < ApplicationController
  def top
    @ministers = ["内閣総理大臣", "総務大臣", "法務大臣", "外務大臣", "財務大臣", "文部科学大臣", "厚生労働大臣", "農林水産大臣", "経済産業大臣", "国土交通大臣", "環境大臣", "防衛大臣", "内閣官房長官", "国家公安委員会委員長", "内閣府特命担当大臣"]
  end
end
