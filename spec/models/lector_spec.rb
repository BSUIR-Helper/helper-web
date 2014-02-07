require 'spec_helper'

describe Lector do
  describe 'Validation' do
    subject do
      Lector.new(attrs)
    end

    context 'when no fields set' do
      let(:attrs) { {} }

      it { should be_invalid }

      it 'has error on name field' do
        subject.valid?
        expect(subject).to have(1).errors_on(:name)
      end
    end

    context "when name is a blank string" do
      let(:attrs) { {name: ''} }

      it { should be_invalid }
    end

    context 'when name is set' do
      let(:attrs) { {name: 'Kurt Donald Cobain'} }

      it { should be_valid }
    end

    context 'when a lector with the same name exists' do
      let(:attrs) { {name: 'Kurt Donald Cobain'} }
      before do
        Lector.create!(:name => 'Kurt Donald Cobain')
      end

      it { should be_invalid }

      it 'has error on name field' do
        subject.valid?
        expect(subject).to have(1).errors_on(:name)
      end
    end

  end
end
