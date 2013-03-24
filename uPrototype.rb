require 'ostruct'

$unique_symbol = 'rogersm'
def gensym
  $unique_symbol.succ!.to_sym
end

def nop(*args)

end

class Prototype < OpenStruct

  def clone
    n = Prototype.new(self.to_h)
    n.oid = gensym
    return n
  end

  def inherit
    n = self.clone
    n.ako = self
    return n
  end

  def instanceof (other)

    if self.oid == 0 and other.oid == 0
        return true
    end

    parent = self.ako

    while parent != other && parent.oid != 0
        parent = parent.ako # climb the ladder
    end

    if parent == other
      return true
    end

    return false

  end

  def method_missing(name, *args, &block)
    if '=' == name[-1,1] #if we're setting data, delegate to OpenStruct
      super
    else # if we're getting data, send it to our parent (ako)
      if 0 == self.ako # unless we're the root object, then we ignore any messages
        return nil
      else
        self.ako.public_send( name, *args )
      end
    end
  end
end


$root = Prototype.new(:oid => 0, :ako => 0)

