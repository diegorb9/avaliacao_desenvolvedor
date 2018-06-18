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
      end

      response
    end

    private

    def rows
      @rows ||= CSV.parse(
        file.read.force_encoding('UTF-8'),
        headers: true,
        col_sep: "\t"
      )
    end

    def response
      @response ||= {
        status: 'success',
        lines: rows.length,
        total: total
      }
    end

    def total
      rows.sum { |r| r['Quantidade'].to_i * r['Preço Unitário'].to_f }
    end
  end
end
