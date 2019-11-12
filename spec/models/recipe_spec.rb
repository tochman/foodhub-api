# frozen_string_literal: true

RSpec.describe Recipe, type: :model do
  it 'should have valid Factory' do
    expect(create(:recipe)).to be_valid
  end
  describe 'DB columns' do
    it { is_expected.to have_db_column :title }
    it { is_expected.to have_db_column :ingredients }
    it { is_expected.to have_db_column :directions }
  end
  describe 'validations' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :ingredients }
    it { is_expected.to validate_presence_of :directions }
    it { is_expected.to validate_length_of(:ingredients).is_at_most(500)}
    it { is_expected.to validate_length_of(:directions).is_at_most(5000)}

  end
end