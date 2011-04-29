# Setup

Install Ruby 1.9.2:
http://www.ruby-lang.org/en/downloads/

Download, and unzip into a directory:
(see download link above)

# Usage

The script takes a two column input file in either tab or comma separated format. The first column is a unique identifier for each row while the second is the value to be hashed. If you would like to hash a multi-column record like a street address, the address should be normalized and concatenated into a single field.

This script is not case sensitive, and removes leading and trailing whitespace from inputs. It is sensitive to whitespace inside fields, special characters, and punctuation. 

`ruby match.rb --input myfile.tsv`
will print the output of hashing the file myfile.tsv to the screen. It's best to try the script this way first to make sure the output is well formatted. 

`ruby match.rb --input myfile.tsv > output.tsv` 
will save the output to a file. 

`ruby match.rb`
will print detailed usage instructions. 

# Notes

This script has only been tested on OS X running ruby 1.9.2.


