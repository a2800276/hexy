require "./lib/hexy.rb"

  b = Hexy.new "abc"
  puts 'b = Hexy.new "abc"'
  puts "assert %Q(#{b.to_s}) == b.to_s"
  
  b = Hexy.new "\000\001\003\005\037\012\011bcdefghijklmnopqrstuvwxyz0123456789"
  puts 'b = Hexy.new "\000\001\003\005\037\012\011bcdefghijklmnopqrstuvwxyz0123456789"'
  puts "assert %Q(#{b.to_s}) == b.to_s"
  
  b = Hexy.new "\000\001\003\005\037\012\011bcdefghijklmnopqrstuvwxyz0123456789", :format=>:none
  puts 'b = Hexy.new "\000\001\003\005\037\012\011bcdefghijklmnopqrstuvwxyz0123456789", :format=>:none'
  puts "assert %Q(#{b.to_s}) == b.to_s"
  
  b = Hexy.new "\000\001\003\005\037\012\011bcdefghijklmnopqrstuvwxyz0123456789", :annotate=>:none
  puts 'b = Hexy.new "\000\001\003\005\037\012\011bcdefghijklmnopqrstuvwxyz0123456789", :annotate=>:none'
  puts "assert %Q(#{b.to_s}) == b.to_s"

  b = Hexy.new("\000\001\003\005\037\012\011bcdefghijklmnopqrstuvwxyz0123456789", :numbering=>:none, :format=>:fours)
  puts 'b = Hexy.new("\000\001\003\005\037\012\011bcdefghijklmnopqrstuvwxyz0123456789", :numbering=>:none, :format=>:fours)'
  puts "assert %Q(#{b.to_s}) == b.to_s"

  b = Hexy.new("\000\001\003\005\037\012\011bcdefghijklmnopqrstuvwxyz0123456789", :numbering=>:none, :format=>:fours, :case=>:upper)
  puts 'b = Hexy.new("\000\001\003\005\037\012\011bcdefghijklmnopqrstuvwxyz0123456789", :numbering=>:none, :format=>:fours, :case=>:upper)'
  puts "assert %Q(#{b.to_s}) == b.to_s"
  
  b = Hexy.new("\000\001\003\005\037\012\011bcdefghijklmnopqrstuvwxyz0123456789", :format=>:fours)
  puts 'b = Hexy.new("\000\001\003\005\037\012\011bcdefghijklmnopqrstuvwxyz0123456789", :format=>:fours)'
  puts "assert %Q(#{b.to_s}) == b.to_s"
  
  b = Hexy.new("\000\001\003\005\037\012\011bcdefghijklmnopqrstuvwxyz0123456789", :numbering=>:none, :width=>8)
  puts 'b = Hexy.new("\000\001\003\005\037\012\011bcdefghijklmnopqrstuvwxyz0123456789", :numbering=>:none, :width=>8)'
  puts "assert %Q(#{b.to_s}) == b.to_s"
  
  b = Hexy.new("\000\001\003\005\037\012\011bcdefghijklmnopqrstuvwxyz0123456789", :numbering=>:hex_bytes, :width=> 8)
  puts 'b = Hexy.new("\000\001\003\005\037\012\011bcdefghijklmnopqrstuvwxyz0123456789", :numbering=>:hex_bytes, :width=> 8)'
  puts "assert %Q(#{b.to_s}) == b.to_s"
  
  b = Hexy.new("\000\001\003\005\037\012\011bcdefghijklmnopqrstuvwxyz0123456789", :numbering=>:hex_bytes, :width=> 8, :format=>:fours)
  puts 'b = Hexy.new("\000\001\003\005\037\012\011bcdefghijklmnopqrstuvwxyz0123456789", :numbering=>:hex_bytes, :width=> 8, :format=>:fours)'
  puts "assert %Q(#{b.to_s}) == b.to_s"
  
  b = Hexy.new("\000\001\003\005\037\012\011bcdefghijklmnopqrstuvwxyz0123456789", :numbering=>:none, :width=>32)
  puts 'b = Hexy.new("\000\001\003\005\037\012\011bcdefghijklmnopqrstuvwxyz0123456789", :numbering=>:none, :width=>32)'
  puts "assert %Q(#{b.to_s}) == b.to_s"
  
  b = Hexy.new("\000\001\003\005\037\012\011bcdefghijklmnopqrstuvwxyz0123456789", :numbering=>:hex_bytes, :width=>32)
  puts 'b = Hexy.new("\000\001\003\005\037\012\011bcdefghijklmnopqrstuvwxyz0123456789", :numbering=>:hex_bytes, :width=>32)'
  puts "assert %Q(#{b.to_s}) == b.to_s"
  
  b = Hexy.new("\000\001\003\005\037\012\011bcdefghijklmnopqrstuvwxyz0123456789", :numbering=>:hex_bytes, :width=>32, :format=>:fours)
  puts 'b = Hexy.new("\000\001\003\005\037\012\011bcdefghijklmnopqrstuvwxyz0123456789", :numbering=>:hex_bytes, :width=>32, :format=>:fours)'
  puts "assert %Q(#{b.to_s}) == b.to_s"
  
