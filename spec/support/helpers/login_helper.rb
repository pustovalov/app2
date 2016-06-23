module LoginHelper
  def login(email, password)
    find(".ac-dropdown-toggler").click
    find(".ac-login-toggler").click
    fill_in 'email', with: email
    fill_in 'password', with: password
    find(".ac-login-button").click
  end

  def register(email, password, password_confirmation, action)
    visit new_user_path
    fill_in 'user[email]', with: email
    fill_in 'user[password]', with: password
    fill_in 'user[password_confirmation]', with: password_confirmation
    click_button action
  end
end
