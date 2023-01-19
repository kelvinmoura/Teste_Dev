class Banks::WelcomeController < ApplicationController
    def index
        @banks = Bank.all
    end
    
    def new
        @bank = Bank.new
    end
    
    def create
        @bank = Bank.new(params_bank)
    if @bank.save
        redirect_to admins_backoffice_admins_path, notice: "Administrador criado com sucesso."
    else
        render :new 
    end
    end
    

    def edit
    end

    def update
    if @bank.update(params_bank)
        redirect_to admins_backoffice_admins_path, notice: "Administrador atualizado com sucesso."
    else
        render :edit 
    end
    end
    
    def destroy
    if  @bank.destroy
        redirect_to admins_backoffice_admins_path, notice: "Administrador Excluido com sucesso!"
    else
        render :index
    end
    end
    
    private

    def params_bank
        params.require(:bank).permit(:description, :compe, :image)
    end

    def set_bank
        @bank = Bank.find(params[:id])
    end
end
