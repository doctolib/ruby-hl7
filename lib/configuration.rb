class HL7::Configuration
  ALLOWED_CONFIGURATION_KEYS = [
    { name: :enable_data_type, default: false }
  ]

  def initialize
    @configuration = {}
    ALLOWED_CONFIGURATION_KEYS.each do |configuration_key|
      @configuration[configuration_key[:name]] = configuration_key[:default]
    end
  end

  def to_h
    @configuration
  end

  ALLOWED_CONFIGURATION_KEYS.each do |configuration_key|
    define_method(:"#{configuration_key[:name]}=") do |value|
      @configuration[configuration_key[:name]] = value
    end
  end
end