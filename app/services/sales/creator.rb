# frozen_string_literal: true

module Sales
  class Creator
    attr_reader :params

    def self.save(params)
      new(params).save
    end

    def initialize(params)
      @params = params
    end

    def save
      Sale.new.tap do |sale|
        sale.customer = params['Comprador']
        sale.description = params['Descrição']
        sale.unit_value = unit_price
        sale.quantity = quantity
        sale.address = params['Endereço']
        sale.provider = params['Fornecedor']
        sale.save!
      end
    end

    private

    def quantity
      @quantity ||= params['Quantidade'].to_i
    end

    def unit_price
      @unit_price ||= params['Preço Unitário'].to_f
    end
  end
end
