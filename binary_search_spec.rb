require_relative 'binary_search'

RSpec.describe BinarySearch do
  let(:binary_odd) { BinarySearch.new([1,2,3,4,5]) }
  let(:binary_even) { BinarySearch.new([1,2,3,4,5,6]) }

  let(:binary_odd_5) { BinarySearch.new([5,6,7,8,9]) }
  let(:binary_even_5) { BinarySearch.new([5,6,7,8,9,10]) }

  describe 'new' do
    it 'give an instance' do
      expect(binary_odd).to_not eq(nil)
    end

    it 'raise ArgumentError if list is not sorted' do
      expect{BinarySearch.new([1,2,3,5,4])}.to raise_exception(ArgumentError)
    end
  end

  describe 'list' do
    it 'give the list' do
      expect(binary_odd.list).to eq([1,2,3,4,5])
    end
  end

  describe 'middle' do
    it 'give middle index on odd list' do
      expect(binary_odd.middle).to eq(2)
    end

    it 'give middle index on even list' do
      expect(binary_even.middle).to eq(3)
    end
  end

  describe 'search_for' do
    describe 'found on the middle' do
      it 'found on odd list' do
        expect(binary_odd_5.search_for(7)).to eq(2)
      end

      it 'found on even list' do
        expect(binary_even_5.search_for(8)).to eq(3)
      end
    end

    describe 'found on the first half' do
      it 'found odd list' do
        expect(binary_odd_5.search_for(6)).to eq(1)
      end

      it 'found even list' do
        expect(binary_even_5.search_for(5)).to eq(0)
      end
    end

    describe 'found on the second half' do
      it 'found odd list' do
        expect(binary_odd_5.search_for(9)).to eq(4)
      end

      it 'found odd list' do
        expect(binary_even_5.search_for(9)).to eq(4)
      end
    end

    describe 'not found' do
      it 'raise StandardError exception' do
        expect{binary_even_5.search_for(15)}.to raise_exception(StandardError)
      end
    end
  end

  describe 'sublist' do
    describe 'found on first half' do
      it 'found on odd list' do
        expect(binary_odd_5.sublist(6)).to eq([5,6])
      end

      it 'found on even list' do
        expect(binary_even_5.sublist(6)).to eq([5,6,7])
      end
    end

    describe 'found on second half' do
      it 'found on odd list' do
        expect(binary_odd_5.sublist(8)).to eq([7,8,9])
      end

      it 'found on even list' do
        expect(binary_even_5.sublist(9)).to eq([8,9,10])
      end
    end
  end
end
