# frozen_string_literal: true

# frozen_literal_string: true

require 'rails_helper'

RSpec.describe Sale, type: :model do
  it { is_expected.to validate_presence_of(:customer) }
  it { is_expected.to validate_presence_of(:description) }
  it { is_expected.to validate_presence_of(:address) }
  it { is_expected.to validate_presence_of(:provider) }
  it { is_expected.to validate_numericality_of(:unit_value) }
  it { is_expected.to validate_numericality_of(:quantity) }
end
