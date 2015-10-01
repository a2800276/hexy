[![Build Status](https://travis-ci.org/a2800276/hexy.svg?branch=master)](https://travis-ci.org/a2800276/hexy)

# hexy -- utility to create hex dumps 

`hexy` is a ruby library that's easy to use to create hex dumps from 
within your ruby scripts. It contains a number of options to configure
how the hex dumb will end up looking.

It should create a pleasant looking hex dumb by default:

   b = Hexy.new "\000\001\003\005\037\012\011bcdefghijklmnopqrstuvwxyz0123456789"
   puts b.to_s

results in this dump:

	0000000: 00 01 03 05 1f 0a 09 62   63 64 65 66 67 68 69 6a  .......b cdefghij 
	0000010: 6b 6c 6d 6e 6f 70 71 72   73 74 75 76 77 78 79 7a  klmnopqr stuvwxyz 
	0000020: 30 31 32 33 34 35 36 37   38 39                    01234567 89

but it's also possible to configure:

* Line numbering
* Line width
* Format
* Case of hex decimals
* Presence of the ASCII annotation in the right column.

This mean you can do exciting dumps like:

	0000000: 0001 0305 1f0a 0962  .... ...b 
	0000008: 6364 6566 6768 696a  cdef ghij 
	0000010: 6b6c 6d6e 6f70 7172  klmn opqr 
	0000018: 7374 7576 7778 797a  stuv wxyz 
	0000020: 3031 3233 3435 3637  0123 4567 
	0000028: 3839                 89

or even:

	0000000: 00 01 03 05 1f 0a 09 62   63 64 65 66 67 68 69 6a 
	0000010: 6b 6c 6d 6e 6f 70 71 72   73 74 75 76 77 78 79 7a 
	0000020: 30 31 32 33 34 35 36 37   38 39

with hexy!
   

## Installing

Having a "Installing" section is a bit of a chicken or egg question.
Someone reading this README has, in all likelyhood already installed the
package. 

 You can install the +hexy+ package by executing:

	gem install hexy 



## Mail

In case you discover bugs, spelling errors, offer suggestions for
improvements or would like to help out with the project, you can contact
me directly (tim@kuriositaet.de).	















=
