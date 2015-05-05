from subprocess import check_output as _check_output

import pytest

from py_git import Git


def git_user_name():
    return _check_output('git config user.name'.split()).decode().strip()


def setup_module(module):
    """
    * save current git user name
    """
    module.current_git_user_name = git_user_name()


def teardown_module(module):
    """
    * restore git user name
    """
    _check_output('git config user.name {}'.format(module.current_git_user_name).split())
    assert git_user_name() == module.current_git_user_name


@pytest.fixture
def git():
    'provide an istance of Git as fixture'
    return Git()


@pytest.fixture
def git_test_user_name():
    return 'git test user name'.split()



def test_git_user_name(git):
    assert git.user_name == git_user_name()


def test_set_git_user_name(git, git_test_user_name):
    user_name = '_'.join(git_test_user_name)
    git.user_name = user_name
    assert git.user_name == user_name

def test_set_git_user_name_with_spaces(git, git_test_user_name):
    user_name = ' '.join(git_test_user_name)
    git.user_name = user_name
    assert git.user_name == user_name
