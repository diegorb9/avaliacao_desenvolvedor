# frozen_string_literal: true

# frozen_literal_string: true

require 'rails_helper'

RSpec.describe 'POST /sales/import', type: :request do
  context 'when successful' do
    let(:file) do
      Rack::Test::UploadedFile.new(
        File.open("#{fixture_path}/valid_file.txt")
      )
    end

    it 'renders a success message' do
      post '/sales/import', { format: 'js', file: file }, xhr: true

      expect(response.body).to include('Importação finalizada com sucesso!')
    end

    it 'renders the number of records' do
      post '/sales/import', { format: 'js', file: file }, xhr: true

      expect(response.body).to include('Registros: 4')
    end

    it 'renders the total of imported sales' do
      post '/sales/import', { format: 'js', file: file }, xhr: true

      expect(response.body).to include('Total: R$ 70,00')
    end
  end

  context 'when failed' do
    let(:file) do
      Rack::Test::UploadedFile.new(
        File.open("#{fixture_path}/invalid_file.txt")
      )
    end

    it 'renders an error message' do
      post '/sales/import', { format: 'js', file: file }, xhr: true

      expect(response.body).to include('Não foi possível importar os registros')
    end

    it 'renders the number of records' do
      post '/sales/import', { format: 'js', file: file }, xhr: true

      expect(response.body).to include('Registros: 1')
    end
  end
end
