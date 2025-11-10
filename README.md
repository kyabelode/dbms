# wow
Easily download and install your **SQL practicals** from the GitHub repo
[`Sarthakzzzzz/exams`](https://github.com/Sarthakzzzzz/exams).

Works on both **Windows** 🪟 and **Ubuntu/Linux** 🐧.

---

## 🚀 For Windows (PowerShell)

Run this command in **PowerShell**:

```powershell
iwr -useb https://raw.githubusercontent.com/Sarthakzzzzz/exams/main/install.ps1 | iex
```

Files will be installed in:

```
C:\Users\<YourName>\Documents\home
```

---

## 🐧 For Ubuntu/Linux (Bash)

Run this command in your **terminal**:

```bash
curl -sSL https://raw.githubusercontent.com/Sarthakzzzzz/exams/main/install.sh | bash
```

Files will be installed in:

```
~/Documents/doc
```

If `Documents` doesn’t exist, they’ll go to:

```
~/Pictures/images
```

---

## ⚙️ Options (Linux only)

Example with custom path:

```bash
curl -sSL https://raw.githubusercontent.com/Sarthakzzzzz/exams/main/install.sh | bash -s -- --prefix ~/Downloads/sql_practicals --force
```

Options:

* `--prefix DIR` → custom directory
* `--force` → overwrite existing files
* `--quiet` → silent mode

---

## 🧼 Uninstall

**Windows:**

```powershell
Remove-Item -Recurse -Force "$HOME\Documents\home"
```

**Ubuntu/Linux:**

```bash
rm -rf ~/Documents/doc ~/Pictures/images
```

---

**Made by [Sarthak](https://github.com/Sarthakzzzzz)** ❤️
