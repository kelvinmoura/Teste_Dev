class SiteController < ApplicationController
    before_action :status_check
    layout 'site'
    
    private

    def status_check
        if user_signed_in?
            if current_user.status == "pendente"
                session.destroy
                redirect_to new_user_session_path, notice: 'Sua solicitação está em analise, por favor aguarde 24hrs'
            else
                # layout: 'users_backoffice'
            end
        end
    end
end
