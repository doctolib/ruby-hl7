require 'pry'
require 'spec_helper'

describe 'enforce encoding' do
  before :all do
    @gen = <<~HL7.tr("\n", "\r").chop
      MSH|^~\\&|Doctolib||Doctolib||20160720182415||SIU^S12|a40e0c06-4101-4f60-9|P|2.5.1|||||FRA|UTF-8
      SCH||369016^DXPLANNING||||APT|||||1^MIN^15^201602250945|^CHANTELOUP^ELISE||||jdelon^DELON^Jeremie||||jdelon^DELON^Jeremie||||393923^DXPLANNING
      PID|||DXP738874^^^DX_TEMPORY^PI~DX0738874^^^DX_TEMPORY^PI||TEST^SIMONE^^^^^D~MAIDEN NAME^SIMONE^^^^^L||19900201|F|||38 RUE GERMAIN ET ROGER LEFEVRE^^PARAY VIEILLE POSTE^^91550||C^^^simone.test@gma.com~C0655554444|C0199998888||||
      RGS|1
      AIS|1|A|ANGAS^CS GASTRO ANCIEN^1|201602250945|201602250945||15|MIN|||1^I^L
      AIL|1|A|GASTRO^^^00001^^D|E
      AIP|1|A|1196^MARTY^Olivier|M
    HL7
  end
  context 'general' do
    it do
      msg = HL7::Message.new(@gen)

      msg.enforce_encoding!

      expect(msg.encoding.name).to eql(msg[:MSH.charset])
    end
  end
end
