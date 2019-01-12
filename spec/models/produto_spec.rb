require 'rails_helper'

RSpec.describe Produto, type: :model do
  let(:produto) { build(:produto) }

  it { is_expected.to validate_presence_of(:referencia) }
  it { is_expected.to validate_uniqueness_of(:referencia).case_insensitive }
  it { is_expected.to validate_presence_of(:descricao) }
end
