require "rails_helper"

RSpec.describe Product, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:subcategory) }

  it { should belong_to(:user) }
  it { should belong_to(:subcategory) }

  it { is_expected.to have_many(:orders) }
  it { is_expected.to have_many(:reviews) }

  context 'validation' do
    describe '#content_validation' do
      let(:product) { described_class.new }
      it 'should fail if all content blanc' do
        product.valid?
        expect(product.errors.full_messages).to include("Fields can't be null")
      end
      it 'should pass if text present' do
        product.title = 'Fuck you self'
        product.valid?
        expect(product.errors.full_messages).to include("Fields can't be null")
      end
    end
  end



end
