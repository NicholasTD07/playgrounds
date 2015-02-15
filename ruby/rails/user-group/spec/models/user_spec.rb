require_relative '../rails_helper'

describe User do
  let(:bob) { FactoryGirl.create(:user) }
  let(:alice) { FactoryGirl.create(:user) }
  it 'has people added to its relationships' do
    bob.relationships << Relationship.new(name: 'friends',
                                      user_id: bob.id,
                                      other_user_id: alice.id)

    expect(bob.related_people).to include alice
  end

  it 'maybe this should be in Relationship?'
end
