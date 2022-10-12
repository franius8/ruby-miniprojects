require './lib/calculator'

describe Calculator do
    describe '#add' do
        it 'returns the sum of two numbers' do
            calculator = Calculator.new
            expect(calculator.add(5,2)).to eql(7)
        end

        it 'returns the sum of more than two numbers' do
            calculator = Calculator.new
            expect(calculator.add(5,2, 6, 7)).to eql(20)
        end

        it 'returns the number if only one argument is given' do
            calculator = Calculator.new
            expect(calculator.add(1)).to eql(1)
        end

        it 'returns nil with no arguments' do
            calculator = Calculator.new
            expect(calculator.add).to eql(nil)
        end
    end

    describe '#subtract' do
        it 'returns the subtraction of two numbers' do
            calculator = Calculator.new
            expect(calculator.subtract(3,2)).to eql(1)
        end

        it 'returns the subtraction of more than two numbers' do
            calculator = Calculator.new
            expect(calculator.subtract(7,2,1)).to eql(4)
        end

        it 'returns the number if only one argument is given' do
            calculator = Calculator.new
            expect(calculator.subtract(1)).to eql(1)
        end

        it 'returns nil with no arguments' do
            calculator = Calculator.new
            expect(calculator.subtract).to eql(nil)
        end
    end
end