require 'rails_helper'
require 'factory_girl_rails'

RSpec.describe User, type: :model do
  before { @user = FactoryGirl.build(:user) }

  it { expect(@user).to respond_to(:email)}
  it { expect(@user).to respond_to(:encrypted_password)}

end
