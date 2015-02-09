#!/usr/bin/env ruby

def local_braches
  `git for-each-ref refs/heads --format='%(refname:short)'`.split
end

def current_branch
  `git rev-parse --abbrev-ref HEAD`.strip
end

other_branches = local_braches.select { |b| b != current_branch }

puts "Merge with #{other_branches.join(', ')}? y[es]/n[o]"

case gets.strip.downcase
when 'y', 'yes'
  do_merge = true
when 'n', 'no'
  do_merge = false
end

exit unless do_merge

for branch in other_branches
  `git merge #{branch}`
  exit unless $?.success?
  puts "Merged with #{branch}"
end

