class Users::RegistrationsController < Devise::RegistrationsController
  def create
    member = Member.where(hashed_id: params[:user][:member_id])
    if !member.present?
      redirect_to new_user_registration_path, alert: "不正なシリアルコードです。"
      return
    end
    super
  end
  
end