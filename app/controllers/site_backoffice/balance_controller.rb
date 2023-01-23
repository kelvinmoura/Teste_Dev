class SiteBackoffice::BalanceController < SiteBackofficeController
  def index
    params[:account] ||= {}
    if Account.where(agency_number: params[:account][:agency_number], account_number: params[:account][:account_number]).exists?
      @balance = "Saldo da conta é de R$
                 #{Account.where(agency_number: params[:account][:agency_number], account_number: params[:account][:account_number]).pluck(:balance).first}"
    end
  end

  private

  def params_account
    params.require(:account).permit(:account_number, :agency_number)
  end
  
end
