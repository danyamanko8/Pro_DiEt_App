RSpec.describe PrivateDietsController, type: :controller do
  it 'has correct parent' do
    expect(controller).to be_a_kind_of(PrivateApiController)
  end
end
