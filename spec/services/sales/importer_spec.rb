# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Sales::Importer, type: :service do
  subject(:importer) { described_class.run(file) }

  context 'when successful' do
    let(:file) { File.open("#{fixture_path}/valid_file.txt") }

    it 'returns import response' do
      expect(importer).to eql(lines: 4, status: 'success')
    end

    it 'creates the records' do
      importer

      expect(Sale.all.length).to eq(4)
    end
  end

  context 'when failed' do
    let(:file) { File.open("#{fixture_path}/invalid_file.txt") }
    let(:error_message) do
      "Todos os campos são obrigatórios\nCampos númericos devem ser maior que 0"
    end

    it 'returns import response' do
      expect(importer).to eql(lines: 1, status: 'fault', error: error_message)
    end

    it 'does not create the records' do
      importer
      expect(Sale.all.length).to eq(0)
    end
  end
end
