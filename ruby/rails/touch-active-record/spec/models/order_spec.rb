require 'rails_helper'

describe Order do
  let!(:customer) { Customer.create! }
  let!(:order) { customer.orders.create! }

  it { expect(customer.orders).to include order }

  context 'should touch associated Customer' do
    it 'when being created' do
      expect { customer.orders.create! }.to change { customer.updated_at }
    end

    it 'when being destroyed' do
      expect { customer.orders.first.destroy! }.to change { customer.updated_at }
    end

    it 'when being changed and also saved' do
      expect do
        order.price = 10
        order.save!
      end.to change { customer.updated_at }
    end

    it 'when being touched' do
      expect { order.touch }.to change { customer.updated_at }
    end
  end
end
