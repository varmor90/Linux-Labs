# Module 3 – System Access and File System

## ✅ Topics

- **Accessing Linux** (GUI, CLI, PuTTY)
- **File system basics**
- **Navigation** (`cd`, `ls`, `pwd`)
- **File/directory creation** (`touch`, `mkdir`)
- **File location** (`find`, `locate`)
- **File content tools** (`cat`, `cut`, `less`, `head`)
- **Wildcards** (`*`, `?`)
- **Paths** (absolute vs relative)
- **Soft and hard links**

---

## 🛠️ Basics to Remember

- Linux is **case-sensitive**
- Everything is treated as a **file**
- Root `/` is the **top** of the file system
- Home directories are in `/home/username`

---

## 📁 File System Structure

| Directory | Purpose                          |
|----------|----------------------------------|
| `/`      | Root                             |
| `/home`  | User home directories            |
| `/etc`   | Configuration files              |
| `/var`   | Logs, variable data              |
| `/tmp`   | Temporary files                  |
| `/usr`   | User binaries                    |

---

## 💻 Common Commands

```bash
cd /path/to/dir         # Change directory
ls -la                  # List with details
pwd                     # Show current path
mkdir test              # Create new dir
touch file.txt          # Create empty file
find / -name 'file.txt' # Search for file
cat file.txt            # View file content
cut -c1-4 file.txt      # Show first 4 characters per line
ln -s original link     # Soft link
ln original hardlink    # Hard link


🧪 File Tasks
-Create dirs & files: mkdir, touch
-View files: cat, less, head, tail
-Combine / split: cat, cut
-Use wildcards: *, ?
-Search: find, locate
-Create links: ln, ln -s
