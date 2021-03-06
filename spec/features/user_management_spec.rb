feature 'User sign up' do

  let(:user) do
    build(:user)
  end

  scenario 'I can sign up as a new user' do
    expect { sign_up(user) }.to change(User, :count).by(1)
    expect(page).to have_content("Welcome, #{user.email}")
    expect(User.first.email).to eq("#{user.email}")
  end

  # def sign_up(email: 'alice@example.com', password: 'oranges!')
  #   visit '/users/new'
  #   expect(page.status_code).to eq(200)
  #   fill_in :email, with: email
  #   fill_in :password, with: password
  #   click_button 'Sign up'
  # end
  # NOT NEEDED

  scenario 'requires a matching confirmation password' do
    user = build(:user, password_confirmation: "wrong")
    expect { sign_up(user) }.not_to change(User, :count)
    expect(current_path).to eq('/users') # current_path is a helper provided by Capybara
    expect(page).to have_content('Please refer to the following errors below:')
  end

  # def sign_up(user)
  # # sign_up(email: 'alice@example.com',
  # #             password: '12345678',
  # #             password_confirmation: '12345678')
  #   visit '/users/new'
  #   fill_in :email, with: user.email
  #   fill_in :password, with: user.password
  #   fill_in :password_confirmation, with: user.password_confirmation
  #   click_button 'Sign up'
  # end

  scenario 'with an email that is already registered' do
    sign_up(user)
    expect { sign_up(user) }.to change(User, :count).by(0)
    expect(page).to have_content('This email is already taken')
  end
end
