class StaticPagesController < ApplicationController
  def home
    @navform = true
  end

  def help
    @navform = true
  end
end
