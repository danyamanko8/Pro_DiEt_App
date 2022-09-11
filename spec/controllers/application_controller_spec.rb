RSpec.describe ApplicationController, type: :controller do
  it 'has correct parent' do
    expect(controller).to be_a_kind_of(ApplicationController::Base)
  end
end
