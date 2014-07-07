require 'pp'
class AnalyticsController < AdminController

  def home
    @total_visits = Visitor.all.count
    @chrome = Browser.where(name:"Google Chrome").count
    @firefox = Browser.where(name:"Mozilla Firefox").count
    @safari = Browser.where(name:"Safari").count
    @ie = Browser.where(name:"Internet Explorer").count
    @other = Browser.where(name:"Other").count
  end
end
