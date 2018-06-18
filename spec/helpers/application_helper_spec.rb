# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationHelper do
  describe '#flash_class' do
    it "returns 'success'" do
      expect(helper.flash_class(:notice)).to eq('success')
    end

    it "returns 'warning'" do
      expect(helper.flash_class(:alert)).to eq('warning')
    end

    it "returns 'default'" do
      expect(helper.flash_class(nil)).to eq('default')
    end
  end
end
