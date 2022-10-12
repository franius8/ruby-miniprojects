require './lib/calculator'

describe Calculator do
    describe '#add' do
        it 'retourns the sum of two number' do
            calculator = Calculator.new
            expect(calculator.add(5,2)).to eql(7)
        end
    end
end