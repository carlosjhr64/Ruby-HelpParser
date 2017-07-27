module HelpParser
  def self.k2t(specs)
    k2t = NoDupHash.new
    tokens = specs.select{|k,v| !(k==TYPES)}.values.flatten.select{|v|v.include?('=')}
    tokens.each do |token|
      if match = VARIABLE.match(token) || LONG.match(token)
        name, type = match["k"], match["t"]
        k2t[name] = type if !k2t.has_key?(name)
        raise HelpError, "Inconsistent use of variable: #{name}" unless type==k2t[name]
      else
        # Expected these to be caught earlier...
        raise SoftwareError, "Unexpected string in help text: #{token}"
      end
    end
    return k2t
  end

  def self.t2r(specs)
    if types = specs[TYPES]
      t2r = NoDupHash.new
      types.each do |pair|
        type, pattern = *pair
        begin
          t2r[type] = Regexp.new(pattern[1..-2])
        rescue
          raise HelpError, "Bad regex for #{type}: #{pattern}"
        end
      end
      return t2r
    end
    return nil
  end
end
