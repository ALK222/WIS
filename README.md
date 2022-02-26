# WIS (Windows Install Script)

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

Script using winget for easy windows setup

## Add new programs to existing categories

To add a new program you have to add a new entry to the array inside its JSON file.

Said object must follow this model

```json
{
  "mode": "ID or NAME",
  "identifier": "Name or ID of the program",
  "source": "winget or msstore",
  "scope": "user or machine"
}
```

Depending on whether it comes from winget or the Microsoft Store, you should put "winget" or "msstore" on the source field.

Some programs as Netflix can only be installed for the current user, others like Steam can only be installed machine-wide.

## How to create new categories

To create a new category you only have to add a new JSON file to [./json](./json). This files will be an array of programs, so you have to use an array syntax inside the file. Open the file with a square bracket, open and close a new program with curly brackets, and use a coma to separate programs:

```json
[
    {
        ONE Program
    },
    {
        OTHER PROGRAM
    }
]
```
