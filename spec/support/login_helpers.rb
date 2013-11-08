module LoginHelpers

  def login(role = nil)
    @user = User.where(roles: role).first || create(:profile).user
    @user.update_attribute(:confirmed_at, Time.now)
    @request.env["devise.mapping"] = :user
    sign_in @user
  end

  def login_with(role = nil)
    @user = User.where(roles: role).first || create(:admin_profile).user
    visit new_user_session_path
    fill_in "user_email", with: @user.email
    fill_in "user_password", with: @user.password
    click_button "Sign in"
    Thread.current[:current_user] = @user
  end
end