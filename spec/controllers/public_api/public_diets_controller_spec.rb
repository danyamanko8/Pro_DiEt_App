RSpec.describe PublicDietsController, type: :controller do
  it 'has correct parent' do
    expect(controller).to be_a_kind_of(ApplicationController)
  end

  describe "GET #index" do
    context "when the diet has no owner" do
      diet = Diet.without_owner
    end
  end

  describe "GET #show" do
  end

  describe "GET #find_diet" do
  end
end
