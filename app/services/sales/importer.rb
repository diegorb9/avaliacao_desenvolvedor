# frozen_string_literal: true

require 'csv'

module Sales
  class Importer
    attr_reader :file

    def self.run(file)
      new(file).run
    end

    def initialize(file)
      @file = file
    end

    def run
      Sale.transaction do
        rows.each { |row| Sales::Creator.save(row) }
      rescue ActiveRecord::RecordInvalid
        response[:status] = 'fault'
        response[:error] = default_message
      end

      response
    end

    private

    def rows
      @rows ||= CSV.parse(file.read, headers: true, col_sep: "\t")
    end

    def default_message
      "Todos os campos são obrigatórios\n" \
      'Campos númericos devem ser maior que 0'
    end

    def response
      @response ||= {
        status: 'success',
        lines: rows.length
      }
    end
  end
end
