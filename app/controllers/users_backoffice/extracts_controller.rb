class UsersBackoffice::ExtractsController < UsersBackofficeController
    def index
        @extracts = Transaction.where(account_id: current_user.account).order(created_at: :desc).page(params[:page]).per(15)
        if params[:start_date].present?
            @extracts = @extracts.where(created_at: params[:start_date]..params[:end_date]).page(params[:page]).per(15)
        end
    end
end
