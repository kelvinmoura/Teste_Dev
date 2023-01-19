class UsersBackoffice::WithdrawalsController < UsersBackofficeController

    def new
        @withdraw = Transaction.new
    end

    def create
        @withdraw = Transaction.new(params_withdraw)
        unless @withdraw.amount > current_user.account.balance
            @withdraw.transaction_type = "Saque"
            @withdraw.save
            Account.find_by(user_id: current_user.id).update(balance:  Account.find_by(user_id: current_user.id).balance - @withdraw.amount)
            redirect_to users_backoffice_welcome_index_path, notice: "Saque de #{@withdraw.amount} feito com sucesso!"
        else
            render :new
        end
    end

    private

    def params_withdraw
        params.require(:transaction).permit(:account_id, :amount)
    end
end
