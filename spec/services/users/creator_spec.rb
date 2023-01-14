# frozen_string_literal: true

require 'spec_helper'

describe Users::Creator do
  describe '#call' do
    let(:result)               { described_class.new(attributes:).call }
    let(:authentication_token) { 'authentication_token'                }

    before do
      expect(AuthenticationTokenGenerator)
        .to receive(:call)
        .and_return(authentication_token)
    end

    context 'when attributes are valid' do
      let(:attributes) do
        {
          email: 'test@user.com',
          password: 'test',
          password_confirmation: 'test'
        }
      end

      let(:created_user) do
        User.find(
          email: attributes[:email],
          authentication_token:
        )
      end

      it 'creates and returns User' do
        expect(result.authenticate(attributes[:password])).to eq created_user
      end

      it 'sets User authentication_token' do
        expect(result.authentication_token).to eq authentication_token
      end
    end

    context 'when attributes are invalid' do
      let(:attributes) { {} }

      it 'raises Sequel::ValidationFailed' do
        expect { result }.to raise_error(
          Sequel::ValidationFailed
        )
      end
    end
  end
end
