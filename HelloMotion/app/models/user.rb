class User
  PROPERTIES = [:id, :name, :email, :phone]
  attr_accessor *PROPERTIES

  def initialize(properties = {})
    properties.each { |key, value| self.send("#{key}=", value) if PROPERTIES.member? key.to_sym }
  end

  def initWithCoder(decoder)
    self.init
    PROPERTIES.each do |prop|
      saved_value = decoder.decodeObjectForKey(prop.to_s)
      self.send("#{prop}=", saved_value)
    end
    self
  end

  def encodeWithCoder(encoder)
    PROPERTIES.each do |prop|
      encoder.encodeObject(self.send(prop), forKey: prop.to_s)
    end
  end


  USER_KEY = "user"
  def save
    defaults = NSUserDefaults.standardUserDefaults
    defaults[USER_KEY] = NSKeyedArchiver.archivedDataWithRootObject(self)
  end
  def self.load
    defaults = NSUserDefaults.standardUserDefaults
    data = defaults[USER_KEY]
    # protect against nil case
    NSKeyedUnarchiver.unarchiveObjectWithData(data) if data
  end
end
