# The Fuck settings file
#
# The rules are defined as in the example bellow:
#
# rules = ['cd_parent', 'git_push', 'python_command', 'sudo']
#
# The default values are as follows. Uncomment and change to fit your needs.
# See https://github.com/nvbn/thefuck#settings for more information.
#

# rules = [<const: All rules enabled>]
# exclude_rules = []
# wait_command = 3
# require_confirmation = True
# no_colors = False
# debug = False
# priority = {}
# history_limit = None
# alter_history = True
# wait_slow_command = 15
# slow_commands = ['lein', 'react-native', 'gradle', './gradlew', 'vagrant']
# repeat = False
# instant_mode = False
# num_close_matches = 3
# env = {'LC_ALL': 'C', 'LANG': 'C', 'GIT_TRACE': '1'}
excluded_search_path_prefixes = ['/mnt/']

# Keep corrections useful without silently changing commands.
require_confirmation = True
no_colors = False
wait_command = 3
wait_slow_command = 10
history_limit = 10
num_close_matches = 5
alter_history = True
instant_mode = False
