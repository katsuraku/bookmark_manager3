FactoryGirl.define do
  factory :user do #FactoryGirl will assume that the parent model of a factory named ":user" is "User"

    email 'foo@bar.com'
    password 'secret1234'
    password_confirmation 'secret1234'
  end

end

# NOW IN TESTS TO REFER TO THIS USER, WRITE :USER
