shared_examples 'a liquid model' do |attribute|
  describe '#to_liquid' do
    it 'returns a stringify version of attributes' do
      result = subject.to_liquid
      expect(result.fetch(attribute.to_s)).to eq subject.send(attribute)
    end
  end
end
