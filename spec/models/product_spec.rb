require "rails_helper"

RSpec.describe Product, type: :model do

  it { should belong_to(:user) }
  it { should belong_to(:subcategory) }
  it { should belong_to(:user) }
  it { should belong_to(:subcategory) }
  it { should have_many(:orders) }
  it { should have_many(:reviews) }

  context 'validation' do
    describe '#content_validation' do
      let(:product) { described_class.new }

      before(:all) do
        @user = create(:user)
        @category = create(:category)
        @subcategory = create(:subcategory)
      end

      before do
        product.valid?
      end

      it 'should fail if all content blanc' do
        expect(product.errors.full_messages).to include("User must exist", "Subcategory must exist")
      end

      context 'when subcategory present' do
        let(:product) { build(:product, subcategory: nil ) }
        it 'should pass if subcategory present' do
          expect(product.errors.full_messages).to include("Subcategory must exist")
        end
      end

      context 'when user present' do
        let(:product) { build(:product, user: nil ) }
        it 'should pass if user present' do
          expect(product.errors.full_messages).to include("User must exist")
        end
      end

      context 'when title present' do
        let(:product) { build(:product, title: nil ) }
        it 'should pass if title present' do
          expect(product.errors.full_messages).to include("Field cannot be blank")
        end
      end

      context 'when body present' do
        let(:product) { build(:product, body: nil ) }
        it 'should pass if body present' do
          expect(product.errors.full_messages).to include("Field cannot be blank")
        end
      end

      context 'when price present' do
        let(:product) { build(:product, price: nil ) }
        it 'should pass if price present' do
          expect(product.errors.full_messages).to include("Field cannot be blank")
        end
      end

      context 'when quantity present' do
        let(:product) { build(:product, quantity: nil ) }
        it 'should pass if quantity present' do
          expect(product.errors.full_messages).to include("Field cannot be blank")
        end
      end

    end
  end
end

context 'callback' do
  context 'after_save' do
    describe '#touch_object' do
      let(:product) {build(:product)}
    end

  end

end