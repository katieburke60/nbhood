class RootController < ApplicationController
  def index

    @account = Account.new
    @business_account = BusinessAccount.new
  end
end
