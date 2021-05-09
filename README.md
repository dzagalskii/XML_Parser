# [ENG] XML-PARSER
## Preparing to launch (Ubuntu or other linux )
### Installation of yacc (bison) и lex (flex):
```
$ sudo apt-get update
$ sudo apt-get install bison flex
```

### Building:
```
$ make
```

### Allow script:
```
$ chmod ugo+x xml-parser.sh
```

## Run:
```
$ ./xml-parser.sh
```

### Tests
The tests are located in the "test" folder.
All files are read from this folder
with the extension ".xml".

# [RU] XML-PARSER
## Подготовка к запуску
### Установка yacc (bison) и lex (flex):
```
$ sudo apt-get update
$ sudo apt-get install bison flex
```

### Сборка:
```
$ make
```

### Разрешить скрипт:
```
$ chmod ugo+x xml-parser.sh
```

## Запуск:
```
$ ./xml-parser.sh
```

### Тесты 
Тесты располагаются в папке "test".
Из этой папки считываются все файлы
с расширением ".xml". 
