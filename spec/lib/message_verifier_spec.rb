# frozen_string_literal: true

require 'spec_helper'

describe MessageVerifier do
  let(:data)       { 'Test message'    }
  let(:purpose)    { :test             }
  let(:expires_at) { Time.now + 60     }

  describe '.encode' do
    it 'encodes data' do
      expect(described_class.encode(data:, purpose:, expires_at:)).not_to eq data
    end
  end

  describe '.decode' do
    subject(:decode) { described_class.decode(**params) }

    let(:message) { described_class.encode(data:, expires_at:, purpose:) }
    let(:params) do
      {
        message:,
        purpose:
      }
    end

    context 'when message is valid' do
      it 'decodes data from message' do
        expect(decode).to eq data
      end
    end

    context 'when message is invalid' do
      let(:params) do
        {
          message: 'wrong message',
          purpose:
        }
      end

      it 'raise ActiveSupport::MessageVerifier::InvalidSignature' do
        expect { decode }.to raise_error(ActiveSupport::MessageVerifier::InvalidSignature)
      end
    end

    context 'when message is expired' do
      let(:expires_at) { Time.now - 10 }
      let(:message) do
        described_class.encode(data:, expires_at:, purpose:)
      end

      it 'raise ActiveSupport::MessageVerifier::InvalidSignature' do
        expect { decode }.to raise_error(ActiveSupport::MessageVerifier::InvalidSignature)
      end
    end

    context 'when purpose is invalid' do
      let(:params) do
        {
          message:,
          purpose: :invalid
        }
      end

      it 'raise ActiveSupport::MessageVerifier::InvalidSignature' do
        expect { decode }.to raise_error(ActiveSupport::MessageVerifier::InvalidSignature)
      end
    end
  end
end
