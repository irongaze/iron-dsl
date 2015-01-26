describe Class do

  context 'when using dsl_accessor' do
    class MyBuilder < DslBuilder
      dsl_accessor :process
    end
    
    before do
      @builder = MyBuilder.new
    end
    
    it 'should set via =' do
      @builder.process.should be_nil
      @builder.process = 5
      @builder.process.should == 5
    end
    
    it 'should set via call' do
      @builder.process.should be_nil
      @builder.process 5
      @builder.process.should == 5
    end
    
    it 'should capture blocks' do
      @builder.process do 
        puts 'foo'
      end
      @builder.process.should be_a Proc
    end
    
  end
  
end