# frozen_string_literal:true

class BaseService
  def initialize(opts = {})
    opts.each do |name, value|
      instance_variable_set("@#{name}", value)
      self.class.send(:attr_reader, name)
    end
  end
end
