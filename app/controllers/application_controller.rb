class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  POSITIONS = {
    sori: "内閣総理大臣", 
    somu: "総務大臣", 
    homu: "法務大臣", 
    gaimu: "外務大臣",
    zaimu: "財務大臣",
    monbukagaku: "文部科学大臣",
    koseirodo: "厚生労働大臣",
    norinsuisan: "農林水産大臣",
    keizaisangyo: "経済産業大臣",
    kokudokotsu: "国土交通大臣", 
    kankyo: "環境大臣", 
    boei: "防衛大臣", 
    kanbo: "内閣官房長官", 
    koan: "国家公安委員会委員長", 
    tokumei_masuda: "増田担当大臣"
    }
end



