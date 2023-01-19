class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #validates :identification, :full_name, :birth_date, :uf, presence: true

  has_one :account

  enum uf: ["RO","DF","AC","AM","RR","PA","AP","TO","MA","PI","CE","RN","PB","PE",
            "AL","SE","BA","ES","MG","RJ","SP","PR","SC","RS","MS","MT","GO"]
  
end
