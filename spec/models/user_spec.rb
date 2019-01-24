require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) } 

  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  it { is_expected.to validate_confirmation_of(:password) }
  it { is_expected.to validate_uniqueness_of(:auth_token) }

  describe '#info' do
    it 'returns email, created_at and a token' do
      user.save!
      # apenas para fixar o token retornado no teste APENAS no escopo do teste MOCK - Objeto duble
      allow(Devise).to receive(:friendly_token).and_return('acb123xyzTOKEN')

      expect(user.info).to eq("#{user.email} - #{user.created_at} - Token: #{Devise.friendly_token}")
    end
  end

  describe '#generate_authentication_token!' do

    it 'generates a unique auth token' do
      allow(Devise).to receive(:friendly_token).and_return('acb123xyzTOKEN')
      user.generate_authentication_token!

      expect(user.auth_token).to eq('acb123xyzTOKEN')

    end
    it 'generates another auth token when the current auth already has been taken' do

      allow(Devise).to receive(:friendly_token).and_return('acb123xxxTOKEN', 'acb123xxxTOKEN', 'acb123zzzTOKEN')
      existing_user = create(:user)

      user.generate_authentication_token!

      expect(user.auth_token).not_to eq(existing_user.auth_token)

    end
    # deixando o it 'texto' o rspec mostra como pendente
    # it 'this test is incomplete'


  end
end