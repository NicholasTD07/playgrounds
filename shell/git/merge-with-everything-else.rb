#!/usr/bin/env ruby

def main
  other_branches = local_braches.select { |b| b != current_branch }

  puts "Merge with #{other_branches.join(', ')}? y[es]/n[o]"
  do_merge = get_boolean_input

  exit unless do_merge

  merged_branches = []
  for branch in other_branches
    `git merge #{branch}`
    unless $?.success?
      failed_when_merging branch
      merged_with merged_branches
      return
    end
    merged_branches << branch
  end
end

def local_braches
  `git for-each-ref refs/heads --format='%(refname:short)'`.split
end

def current_branch
  `git rev-parse --abbrev-ref HEAD`.strip
end

def get_boolean_input
  case gets.strip.downcase
  when 'y', 'yes'
    return true
  when 'n', 'no'
    return false
  end
end

def failed_when_merging(branch)
  puts "Failed when merging with #{branch}"
end

def merged_with(branches)
  puts "Merged with #{branches.join(', ')}"
end


main

