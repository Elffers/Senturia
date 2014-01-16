class Visitor < ActiveRecord::Base
  
  def self.total_pageviews
    # self.sum { |visitor| visitor.pageview_visits }
    self.sum(:pageview_visits)
  end

  def self.total_visits
    # self.sum { |visitor| visitor.visit_count }
    self.sum(:visit_count)
  end

end
