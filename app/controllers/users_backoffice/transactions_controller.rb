class UsersBackoffice::TransactionsController < UsersBackofficeController
  def index
    @account = current_user.account
  end

  def transfer
      ActiveRecord::Base.transaction do
        if current_user.account.balance >= params[:amount].to_f and !params[:amount].empty? and Account.where(account_number: params[:account_number]).exists?
            Account.where(user_id: current_user.id).update(balance: current_user.account.balance - params[:amount].to_f)
            Account.where(account_number: params[:account_number]).update(balance:  Account.find_by(account_number: params[:account_number]).balance + params[:amount].to_f)
            Transaction.create(account_id: current_user.account.id, amount: "#{params[:amount]}", transaction_type: "Tranferência")
            Transaction.create(account_id: Account.where(account_number: params[:account_number]).ids.first, amount: "#{params[:amount]}", transaction_type: "Tranferência/#{current_user.full_name}")
            redirect_to users_backoffice_welcome_index_path, notice: "Transferencia de #{current_user.full_name} para #{} feito com sucesso!"
        else
            render :index
            return
        end
      end
  end

  private

  def params_account
    params.require(:account).permit(:account_number)
  end

  def params_exterior
    params.permit(:current_user, :amount)
  end
  
end
