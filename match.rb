#!/usr/bin/env ruby

require 'rubygems'
require 'optparse'
require "csv"
require 'digest/md5'


class WrongNumberColumns < Exception ; end

options = {:separator => "\t"}
optparse = OptionParser.new do |opts|
  opts.banner = "Usage: match.rb"
  opts.on("-i", "--input FILE", "the input file with two columns.") do | input |
    options[:input] = input
  end
  
  opts.on("-s", "--separator KIND", "either comma or tab - the input column separator. tab is the default.") do | sep |
    options[:separator] = case sep
    when "tab"
      "\t"
    when "comma"
      ","
    end
  end
end

begin 
  optparse.parse!

  mandatory = [:input]
  
  missing = mandatory.select{ |param| options[param].nil? }
  if missing.any?
    puts "Missing options: #{missing.join(', ')}"
    puts optparse
    exit
  end

rescue OptionParser::InvalidOption, OptionParser::MissingArgument
  puts $!.to_s
  puts optparse 
  exit
end

begin 
  CSV.foreach(options[:input], :headers => true, :col_sep => options[:separator]) do |row|
    raise WrongNumberColumns if row.size != 2
    digest = Digest::MD5.hexdigest(row[1])
    puts "#{row[0]}\t#{digest}"
  end
rescue WrongNumberColumns
  puts "The input file must have two columns."
end
