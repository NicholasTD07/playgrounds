from subprocess import check_output as _check_output

def _debug(logging): pass


class Profile:
    def __init__(user_name, user_email):
        self.user_name = user_name
        self.user_email = user_email


class Git:
    def _run_shell_command(func) -> str:
        # todo:
        #  waiting for pep 484
        #    i would like to write parameters as
        #    `func: Callable[..., list]`
        def wrapper(*args, **kwargs):
            args = func(*args, **kwargs)
            _debug('args: {}'.format(args))
            return _check_output(args).decode().strip()
        return wrapper

    @property
    @_run_shell_command
    def user_name(self) -> list:
        return 'git config user.name'.split()

    @user_name.setter
    @_run_shell_command
    def user_name(self, name: str) -> list:
        args = 'git config user.name'.split()
        args.append(name)
        return args
        # todo: anything more elegant than this?
