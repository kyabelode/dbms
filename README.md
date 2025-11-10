# wow Installer

A simple way to download SQL practical files from the **Sarthakzzzzz/exams** repository.

---

## For Linux / Ubuntu

Run this command in the terminal:

```bash
curl -sSL https://raw.githubusercontent.com/kyabelode/dbms/main/install.sh | bash
```

To install in a custom folder (example: Downloads):

```bash
curl -sSL https://raw.githubusercontent.com/kyabelode/dbms/main/install.sh | bash -s -- --prefix ~/Downloads/sql_practicals --force
```

This will automatically:

* Download files from **Sarthakzzzzz/exams/sql**
* Extract and copy them to your local directory

---

## For Windows (PowerShell)

Run this command in PowerShell:

```powershell
powershell -ExecutionPolicy Bypass -Command "iwr -useb https://raw.githubusercontent.com/kyabelode/dbms/main/install.ps1 | iex"
```

This will:

* Download files from **Sarthakzzzzz/exams/sql**
* Save them to `Documents\home`

---

### Repositories

* Source: [Sarthakzzzzz/exams](https://github.com/Sarthakzzzzz/exams)
* Installer: [kyabelode/dbms](https://github.com/kyabelode/dbms)

---

**Author:** Sarthak
