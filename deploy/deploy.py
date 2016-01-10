import os
import os.path
from optparse import OptionParser


usage = "usage: %prog [options] user inventory version"
parser = OptionParser(usage=usage)


if __name__ == '__main__':
    (options, args) = parser.parse_args()
    if len(args) != 3:
        parser.print_help()
        exit(1)

    user = args[0]
    inventory = args[1]
    inventory_abspath = os.path.abspath(inventory)
    version = args[2]

    script_dir = os.path.dirname(__file__)

    library_symlink = os.path.join(script_dir, 'library')
    if not os.path.islink(library_symlink):
        os.symlink(os.path.join('shared', 'library'), os.path.join(script_dir, 'library'))

    cmd_args = ['ansible-playbook', '-i', inventory, '-u', user, '-k',
            '-e', "'version={0} vars_file=\"{1}-vars.yml\"'".format(version, inventory_abspath),
            '--ask-vault-pass', os.path.join(script_dir, 'jedurp-db.yml')]
    cmd = ' '.join(cmd_args)
    print(cmd)
    exit_code = os.system(cmd)
    exit(1 if exit_code else 0)     # cygwin returns 32512 which is too large when command not found
