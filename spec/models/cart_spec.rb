# require 'rails_helper'

# RSpec.describe Cart, :type => :model do
#   it 'has a valid factory' do
#     expect(build(:cart)).to be_an_instance_of(Cart)
#   end

#   let(:cart) { build(:cart) }

#   describe 'instance methods' do
#     context 'responds to its methods' do
#       it { expect(cart).to respond_to(:items) }
#       it { expect(cart).to respond_to(:items_total) }
#       it { expect(cart).to respond_to(:delete_scumbag) }
#       it { expect(cart).to respond_to(:contents) }
#       it { expect(cart).to respond_to(:total_count) }
#       it { expect(cart).to respond_to(:add_item) }
#       it { expect(cart).to respond_to(:count_of) }
#       it { expect(cart).to respond_to(:update_quantity) }
#     end

#     context 'executes methods properly' do
#       context '#items' do
#         it 'returns an array of CartItems with the object and quantity' do
#           scumbag = create(:scumbag)
#           expect(cart.items).to be_an_instance_of(Array)
#           expect(cart.items.first).to be_an_instance_of(CartItem)
#           expect(cart.items.first.scumbag).to eq(scumbag)
#         end

#         it 'returns multiple CartItems' do
#           scumbag_1 = create(:scumbag)
#           scumbag_2 = create(:scumbag)
#           cart = build(:cart, initial_contents: ({'1' => 1, '2' => 1}))
#           expect(cart.items.count).to eq(2)
#         end
#       end

#       context '#items_total' do
#         it 'returns zero if cart it empty' do
#           cart = build(:cart, initial_contents: ({}))
#           expect(cart.items_total).to eq(0)
#         end

#         it 'returns total price of items in cart' do
#           scumbag = create(:scumbag)
#           expect(cart.items_total).to eq(scumbag.price)
#         end

#         it 'works with more than one item' do
#           scumbag_1 = create(:scumbag)
#           scumbag_2 = create(:scumbag)
#           cart = build(:cart, initial_contents: ({'1' => 2, '2' => 1}))

#           expect(cart.items_total).to eq((scumbag_1.price * 2) + scumbag_2.price)
#         end
#       end

#       context '#delete_scumbag' do
#         it 'removes that scumbag from cart' do
#           scumbag = create(:scumbag)
#           cart.delete_scumbag('1')
#           expect(cart.contents).to be_empty
#         end

#         it 'deletes all if quantity of an item is greater than one' do
#           scumbag = create(:scumbag)
#           cart = build(:cart, initial_contents: ({'1' => 2}))
#           cart.delete_scumbag('1')
#           expect(cart.contents).to be_empty
#         end
#       end

#       context '#total_count' do
#         it 'returns total number of item s in cart' do
#           cart = build(:cart, initial_contents: ({'1' => 2, '2' => 3}))
#           expect(cart.total_count).to eq(5)
#         end
#       end

#       context '#add_item' do
#         it 'adds that item to the cart' do
#           cart.add_item('2')
#           expect(cart.contents).to eq({'1' => 1, '2' => 1})
#         end
#       end

#       context '#count_of' do
#         it 'returns the count for one item in the cart' do
#           cart = build(:cart, initial_contents: ({'1' => 5}))
#           expect(cart.count_of('1')).to eq(5)
#         end
#       end

#       context '#update_quantity' do
#         it 'changes the quantity for that item do' do
#           cart.update_quantity(5, '1')
#           expect(cart.contents).to eq({'1' => 5})
#         end
#       end
#     end
#   end
# end
