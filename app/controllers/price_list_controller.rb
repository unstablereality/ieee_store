class PriceListController < ApplicationController
  def index
    @parts = Part.where(:deprecated => false).order("name, description")
    @parts_kits = PartsKit.where(:deprecated => false).order("name")
  end
end
