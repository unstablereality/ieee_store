class StudentViewController < ApplicationController
  def index
    @parts = Part.where(:deprecated => false).order("name, description").all
    @parts_kits = PartsKit.where(:deprecated => false).order("name").all
  end
end
