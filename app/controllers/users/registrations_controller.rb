class Users::RegistrationsController < Devise::RegistrationsController
  def create
    member = Member.find_by(hashed_id: params[:user][:member_id])
    if !member.present?
      redirect_to new_user_registration_path, alert: "不正なシリアルコードです。"
      return
    else
      params[:user][:member_id] = member.id
    end
    super
  end
  
end