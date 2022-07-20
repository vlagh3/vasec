---
tags: 🥷
url: https://tryhackme.com/room/committed
---

# Committed

- since we're given access to the machine I got `commited.zip`  through python's http server: 
	- ubuntu: `python -m http.server` 
	- my machine: `wget http://ip-addr/commited.zip`
- once we `unzip commited.zip` we get 2 files
	- ![[Pasted image 20220720032707.png]]
- no credential leaks here, but we see that a `.git` dir is present => we can see the git commit log
	 - ![[Pasted image 20220720032834.png]]
	 - or by manually looking in the dir
	 - ![[Pasted image 20220720032948.png]]
	 > **NOTE**: by default `git log` only shows us commits from the `master` branch while the other gives us all the commits from all branches *(i.e `dbint`)*. However we can see the full commit log with the `--reflog` 
	 - the commit that catched my eye was the one with the msh `Oops`
- but how can we see the commit changes from past branches? well with `git log -p -<line_nr>` *(have a look @ the manual page `git log --help`)* or with `git show <commit-id>`
	- ![[Pasted image 20220720033940.png]]


## Refs
- https://git-scm.com/book/en/v2/Git-Basics-Viewing-the-Commit-History
- https://stackoverflow.com/questions/4786972/get-a-list-of-all-git-commits-including-the-lost-ones
- https://stackoverflow.com/questions/17563726/how-can-i-see-the-changes-in-a-git-commit

## See Also
[Git Happens](https://tryhackme.com/room/githappens)
[Git & Crumpets](https://tryhackme.com/room/gitandcrumpets)