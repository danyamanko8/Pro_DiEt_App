require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'table columns' do
    it { is_expected.to have_db_column(:email).of_type(:string) }
    it { is_expected.to have_db_column(:encrypted_password).of_type(:string) }
    it { is_expected.to have_db_column(:reset_password_token).of_type(:string) }
    it { is_expected.to have_db_column(:reset_password_sent_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:remember_created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:confirmation_token).of_type(:string) }
    it { is_expected.to have_db_column(:confirmation_sent_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:unconfirmed_email).of_type(:string) }
    it { is_expected.to have_db_column(:failed_attempts).of_type(:integer) }
    it { is_expected.to have_db_column(:unlock_token).of_type(:string) }
    it { is_expected.to have_db_column(:locked_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:created_at).of_type(:datetime) }
    it { is_expected.to have_db_column(:updated_at).of_type(:datetime) }
  end

  describe 'indexes' do
    it { is_expected.to have_db_index(:confirmation_token) }
    it { is_expected.to have_db_index(:email) }
    it { is_expected.to have_db_index(:reset_password_token) }
    it { is_expected.to have_db_index(:unlock_token) }
  end

  describe 'relations' do
      it { is_expected.to have_many(:meals)}
      it { is_expected.to have_many(:diets).through(:diet_user_assignments) }
  end

  describe 'validations' do
      it { is_expected.to validate_presence_of(:email)}
      it { is_expected.to validate_presence_of(:password)}
  end
end
