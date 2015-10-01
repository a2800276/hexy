

class Hexy
  
  VERSION = '0.2.0'

  def self.dump bytes, config={}
    Hexy.new(bytes, config).to_s
  end
  
  #
  # Constructor is passed the bytes to format as a hex dump and
  # an optinal configuration hash. Configuration parameters are:
  #
  # [:+width+]      how many bytes per line (default: 16)
  # [:+numbering+]  currently the only supported options are <tt>:hex_bytes</tt> and <tt>:none</tt>. Default is <tt>:hex_bytes</tt>
  # [:+format+]     currently supported are :+twos+ (every two hex digits are separated by a space, default), :+fours+ or :+none+
  # [:+case+]       :+upper+ or :+lower+, default :+lower+
  # [:+annotate+]   :+ascii+ or :+none+, default :+ascii+
  # [:+prefix+]     a prefix to include literally in front of each line, default ""
  # [:+indent+]     number of spaces to prefix in front of each line, default 0
  #
  # 
  #
  #
  #
  # ==Examples
  # (Width = 16, Line Numbers = :hex_bytes, Format = :twos)
  #   0000000: 00 01 03 05 1f 0a 09 62   63 64 65 66 67 68 69 6a  .......b cdefghij 
  #   0000010: 6b 6c 6d 6e 6f 70 71 72   73 74 75 76 77 78 79 7a  klmnopqr stuvwxyz 
  #   0000020: 30 31 32 33 34 35 36 37   38 39                    01234567 89
  #   
  # (Width = 16, Line Numbers = :none, Format = :fours)
  #   0001 0305 1f0a 0962 6364 6566 6768 696a  .......b cdefghij 
  #   6b6c 6d6e 6f70 7172 7374 7576 7778 797a  klmnopqr stuvwxyz 
  #   3031 3233 3435 3637 3839                 01234567 89
  #
  # ==Usage
  #
  # The examples above were generated with the following:
  #
  #   b = Hexy.new "\x00\x01\x03(...)"
  #   puts p.to_s
  #
  #   b = Hexy.new "\x00\x01\x03(...)", :numbering=>:none, :format=>:fours
  #   puts p.to_s
  #            
  def initialize bytes, config = {}
    @bytes     = bytes.force_encoding(Encoding::ASCII_8BIT)
    @width     = config[:width] || 16 
    @numbering = config[:numbering] == :none  ? :none : :hex_bytes
    @format = case config[:format]
                when :none, :fours
                  config[:format]
                else
                  :twos
              end
    @case      = config[:case]      == :upper ? :upper: :lower
    @annotate  = config[:annotate]  == :none  ? :none : :ascii
    @prefix    = config[:prefix]    ||= ""
    @indent    = config[:indent]    ||= 0
    1.upto(@indent) {@prefix += " "}
  end

  def to_s
    str = ""
    0.step(@bytes.length, @width) {|i|
      string = @bytes.byteslice(i,@width).force_encoding(Encoding::ASCII_8BIT)
      hex = string.unpack("H*")[0]
      hex.upcase! if @case == :upper
      

      if @format == :fours
        hex.gsub!(/(.{4})/) {|m|
          m+" "
        }
      elsif @format == :twos
        hex.sub!(/(.{#{@width}})/) { |m|
          m+"  "
        }
        hex.gsub!(/(\S\S)/) { |m| 
          m+" "
        }
      end

      #string.gsub!(/[\000-\040\177-\377]/, ".")
      string.gsub!(/[^\041-\176]/, ".")
      string.gsub!(/(.{#{@width/2}})/) { |m|
        m+" "
      }
      len = case @format
              when :fours 
                (@width*2)+(@width/2) 
              when :twos
                (@width * 3)+2
              else
                @width *2
            end  
      str << @prefix
      str << "%07X: " % (i) if @numbering == :hex_bytes 
      str << ("%-#{len}s" % hex)
      str << " #{string}" if @annotate == :ascii
      str << "\n" 
      
    }
    str << "\n"
  end
end

if $0 == __FILE__
  
  b = Hexy.new "abc"
  puts b.to_s
  b = Hexy.new "\000\001\003\005\037\012\011bcdefghijklmnopqrstuvwxyz0123456789"
  puts b.to_s
  b = Hexy.new "\000\001\003\005\037\012\011bcdefghijklmnopqrstuvwxyz0123456789", :format=>:none
  puts b.to_s
  b = Hexy.new "\000\001\003\005\037\012\011bcdefghijklmnopqrstuvwxyz0123456789", :annotate=>:none
  puts b.to_s
  b = Hexy.new("\000\001\003\005\037\012\011bcdefghijklmnopqrstuvwxyz0123456789", :numbering=>:none, :format=>:fours)
  puts b.to_s
  b = Hexy.new("\000\001\003\005\037\012\011bcdefghijklmnopqrstuvwxyz0123456789", :numbering=>:none, :format=>:fours, :case=>:upper)
  puts b.to_s
  b = Hexy.new("\000\001\003\005\037\012\011bcdefghijklmnopqrstuvwxyz0123456789", :format=>:fours)
  puts b.to_s
  b = Hexy.new("\000\001\003\005\037\012\011bcdefghijklmnopqrstuvwxyz0123456789", :numbering=>:none, :width=>8)
  puts b.to_s
  b = Hexy.new("\000\001\003\005\037\012\011bcdefghijklmnopqrstuvwxyz0123456789", :numbering=>:hex_bytes, :width=> 8)
  puts b.to_s
  b = Hexy.new("\000\001\003\005\037\012\011bcdefghijklmnopqrstuvwxyz0123456789", :numbering=>:hex_bytes, :width=> 8, :format=>:fours)
  puts b.to_s
  b = Hexy.new("\000\001\003\005\037\012\011bcdefghijklmnopqrstuvwxyz0123456789", :numbering=>:none, :width=>32)
  puts b.to_s
  b = Hexy.new("\000\001\003\005\037\012\011bcdefghijklmnopqrstuvwxyz0123456789", :numbering=>:hex_bytes, :width=>32)
  puts b.to_s
  b = Hexy.new("\000\001\003\005\037\012\011bcdefghijklmnopqrstuvwxyz0123456789", :numbering=>:hex_bytes, :width=>32, :format=>:fours)
  puts b.to_s
end
