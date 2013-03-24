require "test/unit"
require "./mPrototype"

class TestmPrototype < Test::Unit::TestCase

    def test_instanceof
      john1 = $root.inherit
      john2 = john1.inherit
      john3 = john2.inherit
      john4 = john3.inherit

      paul1 = $root.inherit
      paul2 = paul1.inherit
      paul3 = paul2.inherit
      paul4 = paul3.inherit

      assert( john4.instanceof(john1) )
      assert( john4.instanceof($root) )
      assert_equal(false, john1.instanceof(john4) )
      assert($root.instanceof($root))
      assert_equal(false, paul4.instanceof(john1))
      assert(paul4.instanceof($root))

    end

 end


=begin
#p root


location = root.inherit
location.x = 10
location.y = 11
location.barri = :unkown


sotavent = location.inherit
sotavent.barri = :sarria
def location.lleig(param = nil)
  puts "#{barri}, #{param}"
end

print "root ", root, "\n"
print "location ", location, "\n"
print  "sotavent ", sotavent, "\n"

sotavent.lleig(:ok)
puts sotavent.x
puts sotavent.z
=end
