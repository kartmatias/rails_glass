require 'rails_helper'

RSpec.describe Produto, type: :model do
  before { @produto = FactoryGirl.build(:produto) }
  it { expect(@produto).to respond_to(:referencia)}
  it { expect(@produto).to respond_to(:descricao)}
end
