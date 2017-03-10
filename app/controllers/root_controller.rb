class RootController < ApplicationController
  def index
    @account = Account.new
  end
end
