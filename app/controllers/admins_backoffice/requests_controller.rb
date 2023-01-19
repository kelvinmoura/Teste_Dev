class AdminsBackoffice::RequestsController < AdminsBackofficeController
  before_action :set_request, only: %i[update_status]

  def index
    @users = User.where(status: :pendente)
  end

  def update_status
    unless Account.joins(:user).where(users: { identification: @user.identification }).exists?
      if @user.update(request_params)
        if @user.status == 'aprovado'
          Account.create!(user_id: @user.id, bank_id: 1, account_number: rand(10000..99999), agency_number: 32325, balance: 0)
          redirect_to admins_backoffice_requests_path, notice: "Usuário #{@user.status}"
        end
      end
    else
      redirect_to admins_backoffice_requests_path
    end
  end
  
  private
  
  def request_params
    params.permit(:status)
  end

  def set_request
    @user = User.find(params[:id])
  end
  
end
