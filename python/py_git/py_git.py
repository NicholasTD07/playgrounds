from subprocess import check_output as _check_output


def _debug(logging): pass


class Profile:
    def __init__(user_name, user_email):
        self.user_name = user_name
        self.user_email = user_email


class Git:
    def _run_shell_command(func) -> str:
        def wrapper(*args, **kwargs):
            args = func(*args, **kwargs).split()
            _debug('args: {}'.format(args))
            return _check_output(args).decode().strip()
        return wrapper

    @property
    @_run_shell_command
    def user_name(self):
        return 'git config user.name'

    @user_name.setter
    @_run_shell_command
    def user_name(self, name: str):
        return 'git config user.name {}'.format(name)


if __name__ == '__main__':
    git = Git()
    print('user name: {}'.format(git.user_name))
    user_name = git.user_name
    git.user_name = 'tada'
    print('user name: {}'.format(git.user_name))
    git.user_name = user_name
    print('changed user name back to: {}'.format(git.user_name))
