require 'spec_helper'

describe ProductsController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'form'" do
    it "returns http success" do
      get 'form'
      response.should be_success
    end
  end

end
