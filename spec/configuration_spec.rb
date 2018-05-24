# encoding: UTF-8
require 'spec_helper'

describe HL7::Configuration do
  context 'by default' do
    it 'allows to read configuration' do
      HL7.configuration.should(eq(enable_data_type: false))
    end
  end

  context 'when setting enable_data_type' do
    before(:all) do
      HL7.configure do |config|
        config.enable_data_type = true
      end
    end

    it 'allows to read configuration' do
      HL7.configuration.should(eq(enable_data_type: true))
    end
  end
end
