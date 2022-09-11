RSpec.describe HomeController, type: :controller do
  it 'has correct parent' do
    expect(controller).to be_a_kind_of(ApplicationController)
  end
end
