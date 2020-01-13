# frozen_string_literal: true

require 'rails_helper'
require_relative '../../support/code_examples'

def request(code)
  post(
    v1_formattings_path,
    headers: { format: :json },
    params: {
      code: code
    }
  )
end

RSpec.describe 'Formattings API', type: :request do
  describe 'POST #create' do
    CodeExamples::EXAMPLES.each_with_index do |example, index|
      it "returns http success for example #{index + 1}" do
        request(example[:input])
        expect(response).to have_http_status(:success)
      end

      it "responds with JSON body containing expected format for example #{index + 1}" do
        request(example[:input])
        expect do
          json.with_indifferent_access
        end.not_to raise_exception
        expect(json.keys).to match_array(%w[result])
        expect(json['result']).to match(example[:output])
      end
    end

    it 'returns formatting error for broken code' do
      request(CodeExamples.syntax_error)
      expect(json['result']).to match('formatting error')
    end

    it 'returns http bad_request for broken code' do
      request(CodeExamples.syntax_error)
      expect(response).to have_http_status(:bad_request)
    end
  end
end
