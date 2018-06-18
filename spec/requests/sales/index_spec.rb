# frozen_literal_string: true

require 'rails_helper'

RSpec.describe 'GET /sales', type: :request do
  context 'without records' do
    it 'returns a message indicating that there are no records' do
      get '/sales'
      expect(response.body).to include('Sem resultados para a pesquisa')
    end
  end

  context 'with records' do
    before { Sale.create!(sale_attributes) }

    it 'returns the records in table' do
      get '/sales'
      expect(response.body).to include('João Silva')
    end
  end

  private

  def sale_attributes
    {
      customer: 'João Silva',
      description: 'R$10 off R$20 of food',
      unit_value: 10.0,
      quantity: 1,
      address: '987 Fake St',
      provider: "Bob's Pizza"
    }
  end
end
