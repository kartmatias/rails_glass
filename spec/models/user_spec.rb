require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  it { is_expected.to validade_presence_of(:email) }
  it { is_expected.to validade_uniqueness_of(:email).case_insensitive }
  it { is_expected.to validade_presence_of(:encrypted_password) }

end