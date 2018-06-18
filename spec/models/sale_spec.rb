# frozen_literal_string: true

require 'rails_helper'

RSpec.describe Sale, type: :model do
  it { should validate_presence_of(:customer) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:address) }
  it { should validate_presence_of(:provider) }
  it { should validate_numericality_of(:unit_value) }
  it { should validate_numericality_of(:quantity) }
end
