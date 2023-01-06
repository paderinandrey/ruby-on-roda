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
    let(:message) { described_class.encode(data:, expires_at:, purpose:) }

    context 'when message is valid' do
      it 'decodes data from message' do
        expect(described_class.decode(message:, purpose:)).to eq data
      end
    end

    context 'when message is invalid' do
      it 'raise ActiveSupport::MessageVerifier::InvalidSignature' do
        expect do
          described_class.decode(
            message: 'wrong message',
            purpose:
          )
        end.to raise_error(ActiveSupport::MessageVerifier::InvalidSignature)
      end
    end

    context 'when message is expired' do
      let(:expires_at) { Time.now - 10 }
      let(:message) do
        described_class.encode(data:, expires_at:, purpose:)
      end

      it 'raise ActiveSupport::MessageVerifier::InvalidSignature' do
        expect do
          described_class.decode(message:, purpose:)
        end.to raise_error(ActiveSupport::MessageVerifier::InvalidSignature)
      end
    end

    context 'when purpose is invalid' do
      it 'raise ActiveSupport::MessageVerifier::InvalidSignature' do
        expect do
          described_class.decode(message:, purpose: :invalid)
        end.to raise_error(ActiveSupport::MessageVerifier::InvalidSignature)
      end
    end
  end
end
