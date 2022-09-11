require 'rails_helper'

RSpec.describe Meal, type: :model do
  describe 'table columns' do
    it { is_expected.to have_db_column(:title).of_type(:string) }
    it { is_expected.to have_db_column(:calories).of_type(:integer) }
    it { is_expected.to have_db_column(:nutrients).of_type(:jsonb) }
    it { is_expected.to have_db_column(:eat_time).of_type(:datetime) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:user_id).of_type(:integer) }
    it { is_expected.to have_db_column(:grams).of_type(:float) }
    it { is_expected.to have_db_column(:components).of_type(:string) }
  end

  describe 'indexes' do
    it { is_expected.to have_db_index(:user_id) }
  end

  # describe 'relations' do
  #     it { is_expected.to have_one(:user)}
  # end

  describe 'validations' do
      it { is_expected.to validate_presence_of(:title)}
  end
end
