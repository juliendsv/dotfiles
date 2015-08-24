#! /usr/bin/python

import platform, os.path, shutil, subprocess


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

def install_packages():
	if platform.system() not in ['Darwin', 'Linux']: 
		print "What are you doing? don't work with your system ..."
		return

	if platform.system() == "Linux":
        	subprocess.call(['./linux/apt.sh'])

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
	

def setup_vim():
	if os.path.isdir("../.vim/") == False:
       		subprocess.call(['./vim/pathogen.sh'])

	if os.path.isdir("../.vim/bundle/vim-colors-solarized") == False:
		subprocess.call(['./vim/themes.sh'])

        if os.path.isdir("../.vim/bundle/vim-go") == False:
               subprocess.call(['./vim/vim-go.sh'])
	       subprocess.call(['./vim/neocomplete.sh'])

	shutil.copyfile("./vim/.vimrc", "../.vimrc")


install_packages()
setup_gitconfig()
setup_vim()

