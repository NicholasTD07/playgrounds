def local_braches
  `git for-each-ref refs/heads --format='%(refname:short)'`.split
end

def is_ancestor(ancestor, child)
  `git merge-base --is-ancestor #{ancestor} #{child}`
  $?.success?
end

p is_ancestor('master', 'shell-git')
p local_braches

for branch in local_braches
  if is_ancestor 'master', branch
    p "#{branch} is up to date with master"
  else
    `git checkout #{branch}`
    `git merge master`
    exit unless $?.success?
    p "Merged #{branch} with master"
  end
end

