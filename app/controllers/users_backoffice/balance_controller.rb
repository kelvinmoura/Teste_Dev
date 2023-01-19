class UsersBackoffice::BalanceController < UsersBackofficeController
  def index
    @balance = current_user
  end
end
