# how to setup

# ~/.git_config
# [init]
#     templatedir = ~/.git_template

# ~/.git_template/hooks/pre-commit
# ruby /path/to/this/file

# chmod +x ~/.git_template/hooks/pre-commit

# for initialized project
# `git init` # again

GitUser = Struct.new(:name, :email)

def main
  set_git_user_for_work_if_wrong Dir.pwd
end

def set_git_user_for_work_if_wrong(path)
  nick = GitUser.new('Nick', 'nick@example.com')
  if in_work_dir path
    if git_user_not_set_for_work? nick
      debug 'current user name: ' + git_user_name
      debug 'current user email: ' + git_user_email
      set_git_user_for_work nick
    end
  end
end

def in_work_dir(path)
  path.start_with? work_path
end

def work_path
  File.expand_path '~/work/2rk'
end

def git_user_not_set_for_work?(git_user)
  wrong_name(git_user.name) or wrong_email(git_user.email)
end

def wrong_name(name)
  git_user_name != name
end

def wrong_email(email)
  git_user_email != email
end

class Git
  attr_accessor :user_name, :user_email
  def user_name
    `git config user.name`.strip
  end

  def user_email
    `git config user.email`.strip
  end

  def set_user_as(user)
    user_name = user.name
    user_email = user.email
  end

  def user_name=(name)
    debug "set user name to: " + name
    `git config user.name "#{name}"`
  end

  def user_email=(email)
    debug "set user email to: " + email
    `git config user.email "#{email}"`
  end
end

def debug(*args)
  puts args
end

main
