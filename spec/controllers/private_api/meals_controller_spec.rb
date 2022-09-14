require 'rails_helper'
RSpec.describe PrivateApi::MealsController, type: :controller do
  it 'has correct parent' do
    expect(controller).to be_a_kind_of(PrivateApiController)
  end

  let!(:meal) { create(:meal) }
  let(:meal_id) { meal.id }

  describe 'GET /meals/id' do
    context 'when the record exists' do
      before { get "/meals/#{meal_id}" }
      it 'render :show template' do
        expect(response).to render_template(:show)
      end
      it 'returns status code 200' do
        expect(response).to have_http_status(:ok)
      end
      it 'returns found id' do
        expect(response.body).to match(meal_id.to_s)
      end
    end
  end
end
