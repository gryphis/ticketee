#! /usr/bin/env ruby
#
# outputs mysql create database, user and grand commands

user = "ttee"
host = "localhost"
db   = %w(dev test prod)

drop = []
db.each do |d|
  u_d  = user+"_"+d
  ud   = user + d
  udh  = ud+"@"+host
  puts "create database "+u_d+";"
  puts "create user "+udh+" identified by '"+ud+"';"
  puts "grant alter, create, delete, drop, index, insert, lock tables, select, update on "+u_d+".* to "+udh+";"
  drop.push "drop database "+u_d+";"
  drop.push "drop user "+udh+";"
end
puts
puts "show databases;"
puts "select user,host from mysql.user;"
puts
puts drop