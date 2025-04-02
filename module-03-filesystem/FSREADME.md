# Module 3 – System Access and File System

## ✅ Topics

- Accessing Linux (GUI, CLI, PuTTY)
- File system basics
- Navigation (`cd`, `ls`, `pwd`)
- File/directory creation (`touch`, `mkdir`)
- File location (`find`, `locate`)
- File content tools (`cat`, `cut`, `less`, `head`)
- Wildcards (`*`, `?`)
- Paths (absolute vs relative)
- Soft and hard links

---

## 🧭 Common Commands

```bash
cd /path/to/dir         # change directory
ls -la                  # list with details
pwd                     # show current path
mkdir test              # make new dir
touch file.txt          # create empty file
find / -name 'file.txt' # search file
cat file.txt            # view file content
cut -c1-4 file.txt      # show first 4 characters per line
ln -s original link     # soft link
ln original hardlink    # hard link
