class SiteBackoffice::DepositsController < SiteBackofficeController

  def new
      @transaction = Transaction.new
  end

  def create
      @transaction = Transaction.new(params_transaction)
      @transaction.transaction_type = "Deposito"
      if @transaction.save
          Account.find_by(user_id: current_user.id).update(balance:  Account.find_by(user_id: current_user.id).balance + @transaction.amount)
          redirect_to users_backoffice_welcome_index_path, notice: "Deposito de #{@transaction.amount} feito com sucesso!"
      else
          render :new
      end
  end

  private

  def params_transaction
      params.require(:transaction).permit(:account_id, :amount)
  end

end

