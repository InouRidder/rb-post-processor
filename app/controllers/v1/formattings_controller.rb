# frozen_string_literal: true

module V1
  # Controller in charge of formatting incoming ruby code snippets
  class FormattingsController < ApplicationController
    def create
      render json: {
        result: format!
      }, status: :ok
    end

    private

    def formatting_params
      params.require(:code)
    end

    def format!
      Rufo.format(formatting_params)
    rescue Rufo::SyntaxError
      'formatting error'
    end
  end
end
