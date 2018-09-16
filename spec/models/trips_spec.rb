require 'rails_helper'

describe Trip, type: :model do
  describe 'validations' do
    it { should validate_presence_of :start_date }
    it { should validate_presence_of :name }
    it { should validate_presence_of :end_date }
  end
  describe 'relationships' do
    it { should have_many :trip_trails}
    it { should have_many :trails}
  end
end
