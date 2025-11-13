# Exam Practicals Installer

A simple way to download exam practical files from the **Sarthakzzzzz/exams** repository.

---

## For Linux / Ubuntu

Run this command in the terminal:

```bash
curl -sSL https://raw.githubusercontent.com/kyabelode/dbms/main/install.sh | bash
```

To install in a custom folder (example: Downloads):

```bash
curl -sSL https://raw.githubusercontent.com/kyabelode/dbms/main/install.sh | bash -s -- --prefix ~/Downloads/exam_practicals --force
```

This will automatically:

* Download files from **Sarthakzzzzz/exams** (ds and spos directories)
* Extract and copy them to your local directory

---

## For Windows (PowerShell)

Run this command in PowerShell:

```powershell
powershell -ExecutionPolicy Bypass -Command "iwr -useb https://raw.githubusercontent.com/kyabelode/dbms/main/install.ps1 | iex"
```

This will:

* Download files from **Sarthakzzzzz/exams** (ds and spos directories)
* Save them to `Documents\home`

---

## For Windows (Command Prompt)

Run this command in **Command Prompt (CMD)**:

```cmd
curl -O https://raw.githubusercontent.com/kyabelode/dbms/main/install.cmd
install.cmd
```

This runs the same PowerShell installer from CMD.

---

### Repositories

* Source: [Sarthakzzzzz/exams](https://github.com/Sarthakzzzzz/exams)
* Installer: [kyabelode/dbms](https://github.com/kyabelode/dbms)

---

**Author:** Sarthak
