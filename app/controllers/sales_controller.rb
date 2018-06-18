# frozen_string_literal: true

class SalesController < ApplicationController
  def index
    @sales = Sale.order(id: :asc)
  end

  def import
    @import = Sales::Importer.run(params[:file])
    respond_with @import
  end
end
