describe User do

  let!(:user) do
    create(:user)
  end

  it 'authenticates when given a valid email address and password' do
    authenticated_user = User.authenticate(email: user.email, password: user.password)
    expect(authenticated_user).to eq user
  end

  it 'does not authenticate when given an incorrect password' do
    expect(User.authenticate(email: user.email, password: 'wrong_stupid_password')).to be_nil
  end

end
