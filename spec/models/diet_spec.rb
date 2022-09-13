require 'rails_helper'

RSpec.describe Diet, type: :model do
  describe 'table columns' do
    it { is_expected.to have_db_column(:name).of_type(:string) }
    it { is_expected.to have_db_column(:components).of_type(:text) }
    it { is_expected.to have_db_column(:description).of_type(:text) }
    it { is_expected.to have_db_column(:total_calories).of_type(:integer) }
    it { is_expected.to have_db_column(:nutrients).of_type(:jsonb) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:owner_id).of_type(:integer) }
  end

  describe 'relations' do
      it { is_expected.to belong_to(:owner).class_name('User')}
  end

  describe 'validations' do
      it { is_expected.to validate_presence_of(:name)}
      it { is_expected.to validate_presence_of(:components)}
      it { is_expected.to validate_presence_of(:description)}
  end
end
