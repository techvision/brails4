module ControllerMacros

  def login(role = nil)
    before(:each) do
      @user = User.where(roles: [role]).first || create(:user, roles: [role])
      @user.update_attribute(:confirmed_at, Time.now)
      @request.env["devise.mapping"] = :user
      sign_in @user
    end
  end
end