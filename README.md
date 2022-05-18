# Шаблон бакалаврской ВКР

Это шаблон дипломной работы, оформленный в виде LaTeX-класса. Шаблон создавался специально для бакалаврской ВКР студентов ФКН ПИ НИУ ВШЭ, но может быть использован и при выполнении ВКР на других программах / факультетах / вузах, т.к. бОльшая часть легко настраиваема (см. опции ниже).  

Главная особенность данного шаблона в том, что автоматически генерируется всё, что только возможно - от пользователя требуется лишь указать нужные данные и написать текст.  
Что же генерируется автоматически?  
* Стили, шрифты, внешний вид и т.п. (в соответствии с ГОСТ 7.32-2017);
* Титульный лист;
* Содержание;
* Правильный порядок листов (глав, содержания, аннотаций, терминологии, приложений и т.п.);
* Текст вида "Работа состоит из 52 листов, 5 глав, 2 таблиц, 1 листинга, 3 рисунков, 2 приложений. Использовано 15 источников." в аннотациях (за подробностями см. [сюда](#counters));
* Алфавитный порядок в терминологии;
* Список источников по ГОСТу;
* Нумерация глав (числами) и приложений (кириллицей).

Шаблон поддерживает два вида работ - академические и проектные.  

# Содержание
1. [Как начать использовать](#quick-start)
    1. [Online-использование](#online-usage)
    1. [Offline-использование](#offline-usage)
2. [Описание возможностей](#features)
    1. [Список источников](#bibliography)
    2. [Терминология](#terminology)
    3. [Метки TODO](#todos)
    4. [Листинги](#listings)
    5. [Подсчёт количества используемых страниц, рисунков и т.п.](#counters)
3. [Q&A](#qna)
4. [Нашёл ошибку / Хочу помочь](#contributing)

## Как начать использовать <a name="quick-start"></a>

Для использования необходим [всего один класс](https://github.com/viafanasyev/bachelor-thesis-template/blob/master/includes/Thesis.cls). Чтобы быстро начать, можно загрузить всё содержимое репозитория и изменить то, что нужно.  

Для компиляции используйте `pdflatex`. Другие компиляторы не поддерживаются (если есть желание добавить поддержку какого-либо компилятора - см. [сюда](#contributing)).  
Корректность работы проверена на следующих версиях:
* `pdfTeX 3.14159265-2.6-1.40.18 (TeX Live 2017)`;
* `pdfTeX 3.14159265-2.6-1.40.20 (TeX Live 2019/Debian)`;
* `pdfTeX 3.14159265-2.6-1.40.21 (TeX Live 2020)`.

### Online-использование <a name="online-usage"></a>

Если вы используете ShareLaTeX или Overleaf, то ничего особенного делать не нужно - просто загрузите шаблон и выберите в качестве компилятора `pdflatex`.

При использовании Overleaf есть небольшая проблема - по умолчанию используется `TeX Live 2021`, который провоцирует ошибку компиляции (причину ошибки выяснить не удалось, так что если она вам известна, прошу [сюда](#contributing)). Чтобы обойти ошибку, выберите `TeX Live 2020` или более раннюю версию.

### Offline-использование <a name="offline-usage"></a>

Во-первых, вам потребуется загрузить несколько пакетов. Сделать это можно следующей командой:
```bash
sudo apt-get install texlive-latex-base texlive-fonts-recommended texlive-fonts-extra texlive-latex-extra texlive-formats-extra texlive-lang-cyrillic texlive-bibtex-extra biber
```

Во-вторых, нужно будет запустить компилятор несколько раз, а также `biber`:
```bash
pdflatex --shell-escape --interaction=nonstopmode main
biber main
pdflatex --shell-escape --interaction=nonstopmode main
pdflatex --shell-escape --interaction=nonstopmode main
```
Либо используйте `latexmk`:
```bash
latexmk main -pdf
```

## Описание возможностей <a name="features"></a>

Весь документ создаётся при помощи единственного окружения `thesis`.  

Параметрами окружения `thesis` являются данные, используемые на титульном листе и в аннотациях.  
Список параметров:
* `institute` - полное название вуза, написанное в шапке титульного листа. По умолчанию - "ПРАВИТЕЛЬСТВО РОССИЙСКОЙ ФЕДЕРАЦИИ ... НАЦИОНАЛЬНЫЙ ИССЛЕДОВАТЕЛЬСКИЙ УНИВЕРСИТЕТ <<ВЫСШАЯ ШКОЛА ЭКОНОМИКИ>>";
* `faculty` - факультет и департамент, в котором пишется работа. По умолчанию - "Факультет компьютерных наук Департамент программной инженерии";
* `year` - год написания работы. По умолчанию - 2022;
* `city` - город написания работы. По умолчанию - Москва;
* `title` - название работы;
* `authorGroup` - полное название учебной группы автора работы, например "БПИ182";
* `authorName` - инициалы и фамилия автора работы, например "И. И. Иванов";
* `isAuthorFemale` - является ли автор студенткой, а не студентом (используется в паре мест при написании окончаний). Можно использовать параметр как флаг (т.е. не указывать значение), либо передать значение `true` или `false`. По умолчанию - false;
* `isAcademic` - является ли работа академической, а не проектной. Можно использовать параметр как флаг (т.е. не указывать значение), либо передать значение `true` или `false`. По умолчанию - false;
* `UDC` - УДК (используется только для академических работ);
* `educationalProgram` - полное наименование образовательной программы. По умолчанию - "09.03.04 <<Программная инженерия>>";
* `academicTeacherTitle` - должность и прочие регалии научного руководителя;
* `academicTeacherName` - инициалы и фамилия научного руководителя, например "И. И. Иванов";
* `academicSupervisorTitle` - должность и прочие регалии академического руководителя образовательной программы. По умолчанию - данные В. В. Шилова, руководителя ОП ПИ;
* `academicSupervisorName` - инициалы и фамилия академического руководителя образовательной программы. По умолчанию - "В. В. Шилов";
* `hasAcademicCoteacher` - есть ли соруководитель. Можно использовать параметр как флаг (т.е. не указывать значение), либо передать значение `true` или `false`. По умолчанию - false;
* `academicaCoteacherTitle` - должность и прочие регалии соруководителя;
* `academicCoteacherName` - инициалы и фамилия соруководителя, например "И. И. Иванов";
* `hasConsultant` - есть ли консультант. Можно использовать параметр как флаг (т.е. не указывать значение), либо передать значение `true` или `false`. По умолчанию - false;
* `consultantTitle` - должность и прочие регалии консультанта;
* `consultantName` - инициалы и фамилия консультанта, например "И. И. Иванов";
* `keywordsRu` - ключевые слова для использования в русскоязычной аннотации. В качестве разделителей используйте точку с запятой;
* `keywordsEn` - ключевые слова для использования в англоязычной аннотации. В качестве разделителей используйте точку с запятой;
* `refsSorting` - схема сортировки источников. Используются опции из `biblatex` (см. в раздел [Список источников](#bibliography) для подробностей). По умолчанию - `none` (сортировка в порядке использования).

Ни один из параметров не является обязательным **для успешной компиляции**, но данные, обязательные **для указания в работе**, при отсутствии заменяются красными надписями TODO. Сделано это для того, чтобы незаконченый документ можно было успешно скомпилировать, а места, требующие доработки, не были случайно пропущены в будущем.

Внутри окружения `thesis` при помощи специальных команд нужно указать `.tex` файлы, из которых нужно брать отдельные компоненты документа (главы, аннотации, введение и т.п.).
Список команд:
* `\setAbstractResource{path/to/abstract-ru}{path/to/abstract-en}` - русскоязычная и англоязычные аннотации;
* `\setTerminologyResource{path/to/terminology}` - терминология;
* `\setIntroResource{path/to/intro}` - введение;
* `\addChapter{Название главы}{path/to/chapter}` - добавление новой главы с указанным названием;
* `\setConclusionResource{path/to/conclusion}` - заключение;
* `\addAppendix{Название приложения}{path/to/appendix}` - добавление нового приложения с указанным названием.

Порядок указания команд влияет на порядок листов только в случае с главами и приложениями, в остальных случаях порядок не имеет значения.

### Список источников <a name="bibliography"></a>

Список источников генерируется автоматически по ГОСТу. Для этого используются пакеты `biblatex` и [`biblatex-gost`](https://www.ctan.org/pkg/biblatex-gost).  

Как создать список источников:
1. Создать файл с расширением `.bib`;
2. Заполнить файл источниками в формате `biblatex`;
3. Добавить в главном файле команду `\addbibresource{имя_файла.bib}`.

Если нужно сослаться на источник в тексте, используйте команду `\cite{имя_источника}` (все ссылки кликабельны).  

По умолчанию источники сортируются в порядке использования. Это можно изменить, используя опцию `refsSorting` у глобального окружения `thesis`, в котором ожидаются опции из `biblatex`. Например, для сортировки по алфавиту можно использовать `refsSorting=nyt`.  

Внешний вид списка источников можно посмотреть [здесь](https://github.com/viafanasyev/bachelor-thesis-template/blob/master/main.pdf). Примеры использования команд можно поискать по шаблону.

### Терминология <a name="terminology"></a>

Для удобства создания списка терминов имеется окружение `terminologyList`, внутри которого можно указывать элементы при помощи команды `\term[Определение]{описание}`. Термины автоматически сортируются по алфавиту (латиница идёт перед кириллицей).  

Пример:
```latex
\begin{terminologyList}
    \term[Java]{строго типизированный объектно-ориентированный язык программирования общего назначения, разработанный компанией Sun Microsystems}
    \term[Kotlin]{статически типизированный, объектно-ориентированный язык программирования, работающий поверх Java Virtual Machine и разрабатываемый компанией JetBrains}
\end{terminologyList}
```

Внешний вид терминологии можно посмотреть [здесь](https://github.com/viafanasyev/bachelor-thesis-template/blob/master/main.pdf). Примеры использования команд можно посмотреть [здесь](https://github.com/viafanasyev/bachelor-thesis-template/blob/master/parts/terminology.tex).

### Метки TODO <a name="todos"></a>

Для удобства имеются три вида TODO меток, которыми можно пометить части документа, требующие доработки:
* `\todo{текст}` - добавляет выделенный текст с надписью TODO прямо в то место, где использована команда;
* `\todoref{подпись}` - добавляет нижний колонтитул с соответствующей подписью, а в тексте добавляет пометку со ссылкой на этот колонтитул;
* `\todoref[выделенный_текст]{подпись}` - аналог предыдущей команды, но позволяет дополнительно выделить текст, к которому добавляется пометка.

Внешний вид меток можно посмотреть [здесь](https://github.com/viafanasyev/bachelor-thesis-template/blob/master/main.pdf) в аннотациях. Примеры использования команд можно посмотреть [здесь](https://github.com/viafanasyev/bachelor-thesis-template/blob/master/parts/abstract-ru.tex).

### Листинги <a name="listings"></a>

Для листингов используйте пакет `listings` (уже подключён в классе). Основной стиль уже установлен по умолчанию, так что вам нужно лишь выбрать язык, сделать подпись и добавить метку. **Подпись у листинга обязательна! При её отсутствии она помечается красной надписью TODO.**  
Например, листинг на С может выглядеть так:
```latex
\begin{lstlisting}[language=C, caption={Какой-то пример кода на C}, label={code:1}]
#include <stdio.h>

int main() {
  printf("Hello, World!\n");
  return 0;
}
\end{lstlisting}
```

Чтобы сослаться на листинг, установите у него метку и сошлитесь на неё через `\ref{labelname}`.  

Кроме всех поддерживаемых пакетом `listings` языков, также можно использовать языки Kotlin (стиль взят [отсюда](https://github.com/cansik/kotlin-latex-listing)) и Golang (стиль взят [отсюда](https://github.com/korfuri/golang-latex-listings)).

Присутствует отдельный стиль для написания псевдокода на алгоритмическом языке - `algorithmic`. Такой листинг может выглядеть так:
```latex
\begin{lstlisting}[style=algorithmic, caption={Какой-то псевдокод}]
$i \gets 10$
if $i \geq 5$ then
    $i \gets i-1$
else
    if $i \leq 3$
        $i \gets i+2$
    end if
end if
\end{lstlisting}
```

Также присутствует возможность выделения конкретных фрагментов исходного кода. Для этого в листинге нужно добавить опцию `moredelim={**[is][\btHL]{[@}{@]}}`, а фрагмент кода выделить при помощи `[@` и `@]` (разделители можно заменить на любые другие). По умолчанию фрагмент выделяется серым прямоугольником, но есть возможность это конфигурировать, передавая команде `\btHL` опции стиля из пакета `tikz` (например, чтобы выделить оранжевым прямоугольником, можно использовать `moredelim={**[is][{\btHL[fill=orange!20]}]{[@}{@]}}`).

Примеры листингов можно посмотреть [здесь](https://github.com/viafanasyev/bachelor-thesis-template/blob/master/main.pdf) в приложении А. Примеры использования команд можно посмотреть [здесь](https://github.com/viafanasyev/bachelor-thesis-template/blob/master/parts/appendix-example-1.tex).

### Подсчёт количества используемых страниц, рисунков и т.п. <a name="counters"></a>

Шаблон умеет автоматически считать и указывать в аннотациях количество:
* страниц;
* глав;
* рисунков;
* листингов;
* таблиц;
* приложений;
* источников.

Из-за этого имеется ряд ограничений:
* Для рисунков нужно использовать исключительно окружение `figure`;
* Для листингов нужно использовать исключительно окружение `lstlisting`;
* Для таблиц нужно использовать исключительно окружение `table`.

Количеством страниц считается номер последней страницы списка источников (т.е. в количестве страниц учитывается всё, кроме приложений).

## Q&A <a name="qna"></a>

### Моя ВКР не академическая и не проектная. Есть ли возможность сгенерировать титульный лист для неё?

Нет. Титульный лист создан на основе шаблона, взятого [отсюда](https://www.hse.ru/ba/se/assessment), в котором существует лишь два вида ВКР. Если есть какой-то другой вид ВКР, о котором я не знаю - создайте [issue](https://github.com/viafanasyev/bachelor-thesis-template/issues), и я постараюсь это доработать.

### Что делать, если в параметрах для титульного листа мне нужно использовать запятую?

Заключите значение этого параметра в фигурные скобки.

### Хочу использовать листинги для языка со специфичной нумерацией (например, для JVM байткода). Можно ли поменять нумерацию?

Есть два варианта.

Вариант 1. Отключаем нумерацию у листинга опцией `numbers=none` и нумеруем каждую строку в исходном коде самостоятельно. Подход простой, но так себе, т.к. листинги будут отличаться по внешнему виду от других.

Вариант 2. Используем подход [отсюда](https://tex.stackexchange.com/questions/42054/custom-line-numbers-in-lstlisting-environment), перенумеруя каждую строку вручную. Подход трудоёмкий, но куда более элегантный.

Примеры использования обоих вариантов можно посмотреть [здесь](https://github.com/viafanasyev/bachelor-thesis-template/blob/master/parts/appendix-example-1.tex).

### В листинге для Java не выделяются аннотации

Можно включить подсветку аннотаций самостоятельно, используя подход [отсюда](https://tex.stackexchange.com/questions/115467/listings-highlight-java-annotations).

### Хочу добавить секцию "Выводы по главе"

Есть три варианта:

1. С нумерацией:

```latex
\subsection{Выводы по главе}
```

2. Без нумерации, но не включая в содержание:

```latex
\subsection*{Выводы по главе}
```

3. Без нумерации и включая в содержание:

```latex
\subsection*{Выводы по главе}
\addcontentsline{toc}{subsection}{Выводы по главе}
```

Пример использования третьего варианта можно посмотреть [здесь](https://github.com/viafanasyev/bachelor-thesis-template/blob/master/parts/chapter1.tex).

### В lstlisting не отображается текст на русском языке. Что делать?

lstlisting плохо дружит с Unicode. Можно попробовать один из подходов [отсюда](https://tex.stackexchange.com/questions/108692/listing-with-mixed-english-and-russian-symbols-in-comments), например, добавить параметр `texcl=true`:

```latex
\begin{lstlisting}[language=java, texcl=true]
public void foo() {
    System.out.println("Hello"); // Это комментарий на русском языке
}
\end{lstlisting}
```

### Кажется, электронный ресурс в списке источников оформлен не по ГОСТ

1. Если у источника не хватает записи `[Электронный ресурс]`, то это можно указать через `media={eresource}`;
2. Если не хватает даты обращения, то это можно указать через `urldate={yyyy-mm-dd}`;
3. Если смущает, что вместо `Режим доступа: http://..., свободный` написано `URL: http://...`, то такой формат тоже разрешён.

В случае чего можно ссылаться на ГОСТ 7.0.5-2008, где описан именно такой формат.

## Нашёл ошибку / Хочу помочь <a name="contributing"></a>

О всех проблемах и интересующих улучшениях можно сообщать в [issue](https://github.com/viafanasyev/bachelor-thesis-template/issues).  

Если хочется доработать шаблон, то [pull-request'ы](https://github.com/viafanasyev/bachelor-thesis-template/pulls) также приветствуются.
