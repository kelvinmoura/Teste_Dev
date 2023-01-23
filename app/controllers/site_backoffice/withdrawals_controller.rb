class SiteBackoffice::WithdrawalsController < SiteBackofficeController
    def index
    end

    def amount_value
        session[:agency_number] = params[:agency_number]
        session[:account_number] = params[:account_number]
        if params[:account_number].to_s.empty? or params[:agency_number].to_s.empty?
            redirect_to site_backoffice_withdrawals_path, notice: "Insira a conta e agencia"
        else
            if Account.where(account_number: params[:account_number]).exists? and Account.where(agency_number: params[:agency_number]).exists?
                if Account.find_by(account_number: params[:account_number], agency_number: params[:agency_number]).valid?
                    session[:amount] = params[:amount]
                    @balance = Account.find_by(account_number: params[:account_number]).balance
                    render :amount_value
                else
                    redirect_to site_backoffice_withdrawals_path, notice: "Dados incorretos!"
                end
            else
                redirect_to site_backoffice_withdrawals_path, notice: "Insira conta e agencia valida!"
            end
        end
    end

    def to_withdraw
        @account_number = session[:account_number]
        @agency_number = session[:agency_number]
        session[:amount] = params[:amount]
        amount = params[:amount].to_f
        @full_name = session[:full_name] = Account.find_by(account_number: @account_number).user.full_name
        balance = Account.find_by(account_number: @account_number).balance.to_f
        if amount < balance and !amount.nil?
            Transaction.create(transaction_type: 'Saque', amount: amount.to_f, account_id: Account.where(account_number: @account_number).ids.first)
            account = Account.find_by(account_number: @account_number).user_id
            Account.find_by(user_id: account).update(balance:  Account.find_by(user_id: account).balance - amount)
            session[:balance] = Account.find_by(account_number: @account_number).balance
            redirect_to site_backoffice_withdrawals_show_path
        else
            render :amount_value, notice: 'Verifique seu saldo'
        end
    end

    def show
        @account_number = session[:account_number]
        @agency_number = session[:agency_number]
        @amount = session[:amount]
        @full_name = session[:full_name]
        @balance = session[:balance]
    end
    

    private

    def params_account
        params.require(:account).permit(:account_number, :agency_number)
    end

    def params_transaction
        params.require(:transaction).permit(:amount)
    end
    
end
