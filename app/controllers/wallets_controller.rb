class WalletsController < ApplicationController
  def new
    @wallet = Wallet.new
  end

end
