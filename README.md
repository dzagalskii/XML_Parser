## Подготовка к запуску
### Установка yacc (bison) и lex (flex):
```
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
