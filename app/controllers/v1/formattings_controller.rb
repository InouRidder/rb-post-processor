# frozen_string_literal: true

module V1
  # Controller in charge of formatting incoming ruby code snippets
  class FormattingsController < ApplicationController
    def create
      render json: {
        result: Rufo.format(formatting_params)
      }, status: :ok
    end

    private

    def formatting_params
      params.require(:code)
    end
  end
end
