class AnalyticsController < ApplicationController
  http_basic_authenticate_with name: "Emilarr", password: "papillon1904"

  def home
  end
end
