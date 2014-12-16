require 'rails_helper'

describe UrlSaver do
  let(:form_object) { UrlForm.new(url: url) }
  subject { described_class.new(form_object) }
  
  describe '#perform' do
    context "when valid data" do
      let(:url) { 'http://www.google.pl' }
      it do
        subject.stubs(:save_data).returns(true)
        expect(subject.perform).to eq(true)
      end
    end

    context "when invalid data" do
      let(:url) { 'www.google.pl' }
      it { expect(subject.perform).to be_nil }
    end
  end

  describe '#encrypted_url' do
    let(:url) { 'http://www.google.pl' }
    it { expect(subject.encrypted_url).to eq([A9n.remote_host, subject.send(:key)].join) }
  end
end
