require 'spec_helper'

describe Post do
  describe 'Validation' do
    subject do
      Post.new(attrs)
    end

    context 'when no fields set' do
      let(:attrs) { {} }

      it { should be_invalid }

      it 'has error on title field' do
        subject.valid?
        expect(subject).to have(1).errors_on(:title)
      end

      it 'has error on discipline field' do
        subject.valid?
        expect(subject).to have(1).errors_on(:discipline)
      end
    end

    context 'when title is not set' do
      let(:attrs) { { :discipline => Fabricate(:discipline) } }

      it { should be_invalid }
    end

    context 'when discipline is not set' do
      let(:attrs) { { :title => 'The title' } }

      it { should be_invalid }
    end

    context 'when title and discipline are set' do
      let(:attrs) { { :title => 'The title', :discipline => Fabricate(:discipline)} }

      it { should be_valid }
    end
  end
end
