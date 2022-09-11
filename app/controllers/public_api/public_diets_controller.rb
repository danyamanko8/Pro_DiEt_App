module PublicApi
  class PublicDietsController < ApplicationController
    before_action :find_diet, only: :show
    def index
      @diets = Diet.without_owner
    end

    def show
      @diet = Diet.find(params[:id])
    end

    private

    def find_diet
      @diet = Diet.find(params[:id])
    end
  end
end
