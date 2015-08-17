#! /usr/bin/python

import platform, os.path, shutil


def swap_string_in_file(filename, old_string, new_string):
        s = open(filename).read()
        if old_string in s:
                s = s.replace(old_string, new_string)
                f = open(filename, 'w')
                f.write(s)
                f.flush()
                f.close()
        else:
                print '"{old_string}" found. What have you done!'.format(**locals())


def setup_gitconfig():
	if os.path.isfile("../.gitconfig"):
		print "An existing .gitconfig exist please delete it and relaunch"
		return

	if platform.system() not in ['Darwin', 'Linux']: 
		print "What are you doing? don't work with your system ..."
		return

	shutil.copyfile("./git/.gitconfig", "../.gitconfig")
	shutil.copyfile("./git/.gitignore", "../.gitignore")

	if platform.system() == "Darwin":
		swap_string_in_file("../.gitconfig", "#CREDENTIAL#", "/usr/local/bin/git-credential-osxkeychain")
	elif platform.system() == "Linux":
		swap_string_in_file("../.gitconfig", "#CREDENTIAL#", "cache")
	

setup_gitconfig()
