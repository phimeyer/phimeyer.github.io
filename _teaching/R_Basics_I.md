Einführung in `R`: Datentypen und Funktionen
================
Philipp Meyer, Institut für Politikwissenschaft
14.04.2021, Seminar: Quantitative Textanalyse

-   [1. Einleitung](#einleitung)
-   [2. Datentypen](#datentypen)
    -   [2.1. Numeric](#numeric)
    -   [2.2. Character](#character)
    -   [2.3. Zusätzliche Datentypen](#zusätzliche-datentypen)
-   [3. Datenstrukturen](#datenstrukturen)
    -   [3.1. Vektor](#vektor)
    -   [3.2. Data.frame / Datensätze](#data.frame-datensätze)
    -   [3.3. Subsetting/Unterteilen, Hinzufügen und Ändern von Daten](#subsettingunterteilen-hinzufügen-und-ändern-von-daten)
    -   [3.4. Andere gängige Datenstrukturen](#andere-gängige-datenstrukturen)
-   [4. Funktionen](#funktionen)
-   [4. Zusätzliche Anweisungen](#zusätzliche-anweisungen)
    -   [4.1. Zusätzliche Datentypen](#zusätzliche-datentypen-1)
-   [5. Methoden und generische Funktionen](#methoden-und-generische-funktionen)
    -   [Ein Hinweis zu 'Methoden' und 'generischen Funktionen'](#ein-hinweis-zu-methoden-und-generischen-funktionen)
-   [6. Weitere Lektüre](#weitere-lektüre)
-   [7. Hinweis](#hinweis)

# 1. Einleitung

Im ersten Tutorial solltet ihr ganz bewusst überfordert werden. Ihr habt dort bereits erste Einblicke in fortgeschrittene Funktionen und spezialisierten Pakete zur Durchführung von Textanalysen bekommen.

Es gibt unzählige Pakete, die zur Lösung von ebenso unzähligen Problemen oder auch einfach zur Vereinfachung des täglichen *work flows* programmiert wurden. Die meisten Pakete enhalten detallierte Anleitungen, so genannte Vignetten (siehe z.B. die Vignette zu quanteda: <https://cran.r-project.org/web/packages/quanteda/vignettes/quickstart.html>. Oder auch die drei Vignetten zu ggplot2: <https://cran.r-project.org/web/packages/ggplot2/vignettes/>), die euch Schritt für Schritt zeigen, wie die Pakete zu benutzen sind.

Oft genug bietet aber keines der existierenden Pakete eine geeignete Lösung für ein spezielles Problem. Oder aber ihr müsst eure Daten für eure Analysen bereinigen und aufbereiten. Es ist daher wichtig, dass ihr die Grundlagen von `R` kennenlernt.

In diesem zweiten Teil unserer Einführung in `R` lernt ihr die grundlegenden `R`-Datentypen, Datenstrukturen und die Logik von Funktionen kennen. Zur praktischen Übung der hier diskutierten Aspekte findet ihr ein `R`-Skript mit Aufgaben.

# 2. Datentypen

Einzelwerte in `R` können verschiedene Datentypen einnehmen. Die grundlegendsten Datentypen in `R` sind:

-   numerisch - *numeric* (Zahlen)
-   Buchstaben - *character* (Text)
-   Faktoren - *factors* (kategorische Daten, die die Einteilung in mehrere Klassen ermöglichen)
-   logisch - *logic* (Wahr oder Falsch, Größer oder Kleiner, Gleich oder Ungleich)

Darüber hinaus gibt es spezielle Typen z.B. für Datums-/Uhrzeitwerte:

-   Datum (Kalenderdaten) oder POSIXlt (Kalenderdaten und Uhrzeiten)

**Achtung**: Im folgenden werde ich die englischen Begriffe verwenden. Das wird euch die Suche nach Problemlösungen im Internet deutlich erleichtern, da die `R`-Alltagssprache Englisch ist.

### 2.1. Numeric

Zahlen. Nicht mehr und nicht weniger. Zahlen sind vor allem für mathematische Prozesse notwendig.

``` r
x <- 51       # ordne eine Nummer dem Namen x zu
class(x)     # kontrolliere den Datentyp von x
```

    ## [1] "numeric"

``` r
x + 3        
```

    ## [1] 54

``` r
x / 2
```

    ## [1] 25.5

``` r
log(x)      # Logarithmus von x
```

    ## [1] 3.931826

``` r
sqrt(x)     # Wurzel von x
```

    ## [1] 7.141428

### 2.2. Character

Der Character-Datentyp umfasst einzelne Buchstaben, Wörter oder sogar ganze Texte (Bücher, Aufsätze, Gerichtsurteile, Pressemitteilungen, Gesetzestexte, Parteiprogramme you name it).

``` r
x <- "Politikwissenschaft in Hannover"  # Ordne Wörter dem Namen x zu
class(x)         #  kontrolliere den Datentyp/die Klasse von x
```

    ## [1] "character"

Es ist wichtig, den Unterschied zwischen character und numeric zu erkennen. Im Allgemeinen ist es von großer Bedeutung, dass ihr die Datentypen mit denen ihr arbeitet immer kontrolliert. Falsch zugeordnete Datentypen haben schon die Arbeit an der ein oder anderen Analyse um Stunden verlängert.Im obigen Beispiel ist x der Name, dem der Text "Politikwissenschaft in Hannover" zugeordnet wurde. Ob ein Wort ein Name oder ein Zeichenwert ist, wird mit Anführungszeichen angegeben.

``` r
x       # der Wert der dem Namen x zugeordnet wurde
```

    ## [1] "Politikwissenschaft in Hannover"

``` r
"x"     # der Text/der Buchstabe "x"
```

    ## [1] "x"

Mit Textdaten kann man natürlich keine mathematischen Formlen berechnen. Die Kombination eines falschen Datentyps mit einer Funktion führt im Allgemeinen zu einer Fehlermeldung:

``` r
sum(x)       # berechne die Summe von x
```

`## [1] Error in sum(x): invalid 'type' (character) of argument`

Spoiler alert: Fehlermeldungen gehören zum "`R`-Feeling"! Ihr werdet Momente der Verzweiflung deswegen erleben. Aber keine Angst! `R` ist **open-source** und deswegen hat die `R`-Community eigentlich für alle Probleme eine Antwort, ihr müsst nur im Internet danach suchen.

Es ist wichtig, diese Art von Fehlern zu erkennen, denn, wie gesagt, Fehlermeldungen werden euch euer ganzes `R`-Leben lang begleiten. Möglicherweise wurden Daten importiert, in denen eine Spalte ein Wort enthält, die eigentlich eine Zahl enthalten soll. In diesem Fall betrachtet `R` die Spalte als Spalte mit *character*.

Achtung: Ihr könnt auch Zahlen als *character* ausdrücken! Dafür verwendet ihr lediglich Anführungszeichen, z.B. "23". Andererseits könnt ihr *numerics* also Zahlen nicht als *character*ausdrücken! Das Umwandeln von einem Datentyp in einen anderen geschieht mit der as.-Methode:

``` r
x <- "999"
x <- as.numeric(x)     # transformiert character in numeric
x
```

    ## [1] 999

``` r
y <- 999
y <- as.character(y)   # transformiert numeric in character
y
```

    ## [1] "999"

``` r
z <- "Nein! Das funktioniert nicht"
z <- as.numeric(z)     # versucht character in numeric zu transformiert
z      
```

    ## [1] NA

### 2.3. Zusätzliche Datentypen

Zusätzliche Hinweise für die Arbeit mit Faktoren (*factor*), logischen Werten (*logic*) und Daten und Uhrzeiten (*date*) findet ihr am Ende dieses Dokuments.

# 3. Datenstrukturen

In SPSS oder Excel werden Daten immer in einem Datensatz organisiert, wobei die Zellen in Reihen und Spalten angeordnet sind. Typischerweise stellen die Reihen dann Fälle dar (z.B. Befragte, Teilnehmer, Zeitungsartikel) und die Spalten stellen Variablen dar (z.B. Alter, Geschlecht, Datum, Medium). Für die meisten Analysen mit `R` ist das auch das empfohlene Datenformat. Hierfür existiert in `R` die `data.frame`-Struktur.

Ein wichtiger Unterschied besteht jedoch darin, dass es in `R` möglich und oft auch sinnvoll ist, verschiedene Datenstrukturen/ Datenformate zu kombinieren. Um zu verstehen, wie ein `data.frame` in `R` funktioniert, ist es unerlässloch zu verstehen, dass ein `data.frame` eine Sammlung von Vektoren ist.

Im folgenden werden wir kurz auf Vektoren eingehen und diese erklären. Anschließend werden wir uns den `data.frames` zuwenden. Zusätzlich werden wir uns auch mit Matrizen und Listen beschäftigen.

### 3.1. Vektor

Ein Vektor in `R` ist eine Folge von einem oder mehreren Werten desselben Datentyps. Aus sozialwissenschaftlicher Sicht ist als ein Vektor dem, was wir als Variable bezeichnen, sehr ähnlich.

Ihr könnt einen Vektor in `R` mit c(...) benennen, wobei zwischen den Klammern die Werte, durch Kommata getrennt werden. Die Anzahl der Werte bestimmt die Länge des Vektors. Ein Vektor kann jeden der oben besprochenen Datentypen haben (*numeric*, *character*, *factor*, *logic*, *date*).

``` r
v1 <- c(1, 2, 10, 15)   # ein numericher Vektor mit einer Länge von 4 
v2 <- c("a", "b", "b")   # character Vektor mit einer Länge von 3
v3 <- 1:10               ## ein numericher Vektor mit einer Länge von 10 mit den Werten von 1 bis 10 (der Doppelpunkt gibt R den Befehl Zahlen im von euch definierten Bereich von X bis zu X verwenden.)
```

``` r
v1
```

    ## [1]  1  2 10 15

``` r
v2
```

    ## [1] "a" "b" "b"

``` r
v3
```

    ##  [1]  1  2  3  4  5  6  7  8  9 10

Kombiniert ihr verschiedene Datentypen in einem Vektor, verwendet `R` immer den Typen mit dem kleinsten gemeinsamen Nenner. Das wird als impliziter Zwang (implicit coercion) bezeichnet und `R` folgt grundsätzlich der folgenden Reihenfolge:

-   logical `->` integer `->` numeric `->` complex `->` character

Beispielsweise haben wir vorhin gesehen, dass eine Zahl als *character* ausgedrückt werden kann, ein Text jedoch nicht als *numeric*. Wenn wir also beide Typen in einem Vektor kombinieren, wandelt `R` *numerics* in *character* um.

``` r
v1 <- c(1, 2, "c")  # Ein character vector mit einer Länge von 3
class(v1)
```

    ## [1] "character"

Da Vektoren nur einen Datentyp haben können, können wir mit ihnen auch nur typspezifische Operationen durchführen. Wir können mit ihnen also im Grunde auf die gleiche Weise arbeiten wie mit Einzelwerten. Tatsächlich sind Einzelwerte eigentlich nur Vektoren mit einer Länge von 1. Wenn wir zum Beispiel einen *numeric* Vektor haben, der von `R` auch als *numeric* Vektor bezeichnet/erkannt wird, können wir Berechnungen durchführen.

``` r
x <- c( 1, 2, 3, 4, 5) 
y <- c(10,20,30,40,50)
x + y     # für 2 Vektoren mit der selben Länge berechnet R paarweise (1 + 10, 2 + 20, etc.)
```

    ## [1] 11 22 33 44 55

``` r
x + 10    # für einen Vektor und einen Einzelwert wird letzterer immer wieder für die Rechnung verwendet (1 + 10, 2 + 10, etc.)
```

    ## [1] 11 12 13 14 15

#### 3.1.1. Auswählen von Elementen aus Vektoren

Es gibt zwei gängige Methoden, um ein bestimmtes Element oder einen Bereich von Elementen aus einem Vektor auszuwählen. Die eine besteht darin, die Indizes (Positionen) der Elemente in eckigen Klammern hinter dem Vektornamen anzugeben. Beachtet bitte, dass die Indizes selbst als numerischer Vektor angegeben werden.

``` r
x <- c('a','b','c','d','e','f','g')  # ein character Vektor mit einer Länge von 7
x[5]            # das fünfte Element auswählen
```

    ## [1] "e"

``` r
x[c(1,3)]       # das erste und dritte Element auswählen 
```

    ## [1] "a" "c"

``` r
x[2:5]          # die Elemente zwei bis fünf auswählen
```

    ## [1] "b" "c" "d" "e"

Ihr bestimmt die Reihenfolge in der ihr eure Indizes auswählt. Natürlich könnt ihr die Auswahl von Indizes auch wiederholen, was z.B. zum sortieren von Daten nützlich sein kann.

``` r
x[5:1]          #  Elemente in den Positionen 5 bis 1 auswählen
```

    ## [1] "e" "d" "c" "b" "a"

``` r
x[c(5,5,5)]     # das fünfte Elemnt mehrmals auswählen
```

    ## [1] "e" "e" "e"

Ihr könnt auch eine negative Auswahl treffen, um so alles außer den angegebenen Elementen auszuwählen.

``` r
x[-5]            #  jedes Element außer dem fünften auswählen
```

    ## [1] "a" "b" "c" "d" "f" "g"

``` r
x[-c(1,3)]       # jedes Element mit Ausnahme des ersten und dritten auswählen
```

    ## [1] "b" "d" "e" "f" "g"

Die zweite Möglichkeit ist die Verwendung eines logischen Vektors. Weitere Informationen über logische Vektoren findet ihr am Ende dieses Dokuments. Hier geht es vor allem darum, zu verstehen, dass ein logischer Vektor nur die Werte FALSE und TRUE hat.

Verwenden wir einen logischen Vektor um Werte auszuwählen, dann müssen beide die gleiche Länge haben. Alle Werte, für die der logische Vektor WAHR ist, werden dann ausgewählt. In diesem Beispiel sind die ersten drei Werte WAHR, und so werden die ersten drei Werte aus dem Vektor x ausgewählt

``` r
x[c(TRUE, TRUE, TRUE, FALSE, FALSE, FALSE, FALSE)]
```

    ## [1] "a" "b" "c"

Warum ist das nützlich? Diese spezielle Art Elemente auszwählen werdet ihr wahrscheinlich **nie** nutzen. **Aber** dieses Beispiel soll euch dabei helfen zu verstehen, wie ihr Vergleiche nutzen könnt. Ihr könnt Werte vergleichen, um einen logischen Vektor zu erstellen (mehr zu Vergleichen am Ende dieses Dokuments).

Beispielsweise können wir alle Werte in einem Vektor mit einem einzigen Wert vergleichen. Hier erstellen wir einen Vektor mit dem Namen "jahre" und vergleichen die Werte dieses Vektors mit dem Wert 2018. Wir verwenden `==` also logischen Operator.

``` r
jahre <- c(2017,2034,2018,2020,2012,2025,2030,2014,2033)
jahre == 2018
```

    ## [1] FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE

Wir können auch &gt; für einen Größer-als-Vergleich oder &gt;= für einen Größer-Gleich-Vergleich verwenden.

``` r
jahre > 2018
```

    ## [1] FALSE  TRUE FALSE  TRUE FALSE  TRUE  TRUE FALSE  TRUE

``` r
jahre >= 2018
```

    ## [1] FALSE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE FALSE  TRUE

Jetzt können wir den logischen Vektor (TRUE / FALSE) zur Auswahl von Werten verwenden.

``` r
auswahl <- jahre >= 2018   # der Vergleich generiert einen logischen Vektor (Größer-Gleich)
jahre[auswahl]          # wählt Werte mit Hilfe des logischen Vektors in "auswahl" aus
```

    ## [1] 2034 2018 2020 2025 2030 2033

Es ist nicht notwendig dem logischen Vektor zunächst einen Namen zu geben (im Beispiel war es der Name "auswahl"). Wir können den Vergleich direkt zur Wertauswahl verwenden.

``` r
jahre[jahre >= 2018]          # selber Effekt, aber effektiver da weniger Code 
```

    ## [1] 2034 2018 2020 2025 2030 2033

### 3.2. Data.frame / Datensätze

Ein `data.frame` isteine Sammlung von Vektoren mit **gleicher Länge** (!!), die als Spalten miteinander verbunden sind.

Um einen `data.frame` zu erstellen, verwenden wir die Funktion `data.frame()`. Wir geben die Vektoren im folgenden Format ein: `column_name = Vektor` **,** `column_name = Vektor` **,** `column_name = Vektor` (die Kommata sind für eine erfolgreiche Erstellung eines Datensatzes in `R` zentral!). Hier erstellen wir einen `data.frame` für Daten aus einem fiktiven Experiment.

``` r
d <- data.frame(id =        1:10,
               bedingung = c("E", "E", "C", "C", "C", "E", "E", "E", "C", "C"),
               geschlecht =    c("M", "M", "W", "M", "W", "W", "W", "M", "M", "W"),
               alter =       c( 17,  19,  22,  18,  16,  21,  18,  17,  26,  18),
               wert_t1 =  c(8.0, 6.0, 7.5, 6.8, 8.0, 6.4, 6.0, 3.2, 7.3, 6.8),
               wert_t2 =  c(8.3, 6.4, 7.7, 6.3, 7.5, 6.4, 6.2, 3.6, 7.0, 6.5))
d
```

    ##    id bedingung geschlecht alter wert_t1 wert_t2
    ## 1   1         E          M    17     8.0     8.3
    ## 2   2         E          M    19     6.0     6.4
    ## 3   3         C          W    22     7.5     7.7
    ## 4   4         C          M    18     6.8     6.3
    ## 5   5         C          W    16     8.0     7.5
    ## 6   6         E          W    21     6.4     6.4
    ## 7   7         E          W    18     6.0     6.2
    ## 8   8         E          M    17     3.2     3.6
    ## 9   9         C          M    26     7.3     7.0
    ## 10 10         C          W    18     6.8     6.5

Die Datenstruktur zeigt, dass es eine Beziehung zwischen den Elementen in den Spaltenvektoren gibt. Mit anderen Worten: jede Reihe stellt einen Fall dar. In unserem Beispiel sind diese Fälle TeilnehmerInnen, und die Spalten repräsentieren:

-   die Identifikationsnummer für jede\_n TeilnehmerIn (*id*)
-   die Versuchsbedingung (*bedinung*) (E = Versuchsbedingung, C = Kontrollgruppe)
-   demographische Variablen: *Geschlecht* und *Alter*.
-   Testergebnisse zu zwei Zeitpunkten: *wert\_t1* und *wert\_t2*

#### 3.2.1. Auswählen von Reihen, Spalten und Elementen

Da `data.frames` sowohl Reihen als auch Spalten haben, können wir beide zur Datenauswahl verwenden. Ähnlich wie bei der Auswahl in Vektoren verwenden wir eckige Klammern. Der Unterschied besteht darin, dass bei `data.frames` die eckigen Klammern aus zwei Teilen bestehen, die durch ein Komma getrennt sind.

| Syntax   | Bedeutung                                        |
|----------|--------------------------------------------------|
| d\[i,j\] | Reihe (i) und Spalten (j) auswählen              |
| d\[i, \] | nur Reihe (i) auswählen aber alle Spalten nutzen |
| d\[ ,j\] | nur Spalte (j) auswählen aber alle Reihen nutzen |

Die Auswahl für Reihe (i) und Spalten (j) funktioniert genauso wie die Auswahl von Vektoren. Ihr könnt entwender *numeric* oder *logic* Vektorentypen verwenden. Entsprechend könnt ihr auch Vergleiche verwenden.

Darüber hinaus gibt es zwei spezielle Möglichkeiten, Spalten zu selektieren. Die eine ist, dass j ein Reihennvektor mit Spaltennamen sein kann. Die andere verwendet das Dollarzeichen (`$`).

<table>
<colgroup>
<col width="40%" />
<col width="59%" />
</colgroup>
<thead>
<tr class="header">
<th>Syntax</th>
<th>Bedeutung</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>d[ ,c(“alter”, “wert_t1”)]</td>
<td>Spalten mit den Namen “alter” and “wert_t1” auswählen</td>
</tr>
<tr class="even">
<td>d$id</td>
<td>die Spalte mit den Namen &quot;id&quot; auswählen</td>
</tr>
</tbody>
</table>

#### Die Auswahl von Spalten

Schauen wir uns das mal an unserem Beispiel an:

``` r
# Das Auswählen einer einzelnen Spalte liefert einen Vektor
d[,1]             # die erste Spalte nach Index auswählen 
```

    ##  [1]  1  2  3  4  5  6  7  8  9 10

``` r
d[,"id"]          # die id-Spalte auswählen
```

    ##  [1]  1  2  3  4  5  6  7  8  9 10

``` r
d$id              # mit dem Dollarzeichen die id-Spalte auswählen 
```

    ##  [1]  1  2  3  4  5  6  7  8  9 10

``` r
# Die Auswahl mehrerer Spalten gibt einen data.frame zurück
d[,1:2]           #  die ersten beiden Spalten nach Indizes auswählen
```

    ##    id bedingung
    ## 1   1         E
    ## 2   2         E
    ## 3   3         C
    ## 4   4         C
    ## 5   5         C
    ## 6   6         E
    ## 7   7         E
    ## 8   8         E
    ## 9   9         C
    ## 10 10         C

``` r
d[,c("id","alter")] # die Spalten "id" und "Alter" mit ihren Namen auswählen
```

    ##    id alter
    ## 1   1    17
    ## 2   2    19
    ## 3   3    22
    ## 4   4    18
    ## 5   5    16
    ## 6   6    21
    ## 7   7    18
    ## 8   8    17
    ## 9   9    26
    ## 10 10    18

``` r
d[,-1]            # jede Spalte außer der ersten auswählen 
```

    ##    bedingung geschlecht alter wert_t1 wert_t2
    ## 1          E          M    17     8.0     8.3
    ## 2          E          M    19     6.0     6.4
    ## 3          C          W    22     7.5     7.7
    ## 4          C          M    18     6.8     6.3
    ## 5          C          W    16     8.0     7.5
    ## 6          E          W    21     6.4     6.4
    ## 7          E          W    18     6.0     6.2
    ## 8          E          M    17     3.2     3.6
    ## 9          C          M    26     7.3     7.0
    ## 10         C          W    18     6.8     6.5

Wie bereits erwähnt, können wir die Auswahl von Spalten auch mittels eines logischen Vektors durchführen. Aber dazu später mehr!

#### Die Auswahl von Reihen

Das Auswählen von Reihen ist praktisch identisch mit dem Auswählen von Elementen aus Vektoren.

``` r
d[1:5,]    # die ersten fünf Reihen des Datensatzes
```

    ##   id bedingung geschlecht alter wert_t1 wert_t2
    ## 1  1         E          M    17     8.0     8.3
    ## 2  2         E          M    19     6.0     6.4
    ## 3  3         C          W    22     7.5     7.7
    ## 4  4         C          M    18     6.8     6.3
    ## 5  5         C          W    16     8.0     7.5

Ein sehr nützlicher Trick ist, dass man alle Spalten für Vergleiche verwenden kann. So können wir zum Beispiel in der Spalte "Geschlecht" alle Elemente nachschlagen, die den Wert "M" (männlich) haben und diese zur Auswahl von Reihen verwenden.

``` r
d[d$geschlecht == "M", ]  
```

    ##   id bedingung geschlecht alter wert_t1 wert_t2
    ## 1  1         E          M    17     8.0     8.3
    ## 2  2         E          M    19     6.0     6.4
    ## 4  4         C          M    18     6.8     6.3
    ## 8  8         E          M    17     3.2     3.6
    ## 9  9         C          M    26     7.3     7.0

Wir können auch logische Operatoren kombinieren, um so eine Auswahl über mehrere Spalten vorzunehmen. Aber dazu später mehr ;-). Im Moment ist es für euch nur wichtig, dass wir den Operator & (AND) verwenden können, um `R` anzuzeigen, das zwei Vergleiche aufeinmal WAHR sein können (`d$geschlecht == "W" AND d$alter == 21`).

``` r
d[d$geschlecht == "W" & d$alter == 21, ]    # Teilnehmerinnen die 21 Jahre alt sind
```

    ##   id bedingung geschlecht alter wert_t1 wert_t2
    ## 6  6         E          W    21     6.4     6.4

``` r
d[d$wert_t1 < d$wert_t2,]         # TeilnehmerInnen die einen höhren Wert zum zweiten Messzeitpunkt erreicht haben
```

    ##   id bedingung geschlecht alter wert_t1 wert_t2
    ## 1  1         E          M    17     8.0     8.3
    ## 2  2         E          M    19     6.0     6.4
    ## 3  3         C          W    22     7.5     7.7
    ## 7  7         E          W    18     6.0     6.2
    ## 8  8         E          M    17     3.2     3.6

#### Auswahl von Reihen **und** Spalten

Wir können die Reihen- und Spaltenauswahl kombinieren. Gleiches gilt natürlich auch für die verschiedenen Auswahlmethoden.

``` r
d[d$geschlecht == "W", "wert_t1"]    # Spalte "wert_t1" für weibliche Teilnehmerinnen
```

    ## [1] 7.5 8.0 6.4 6.0 6.8

``` r
d[d$geschlecht == "W",]$wert_t1      # identisch, aber hier wird im ersten Schritt der Datensatz unterteilt (subset) und dann wird die Reihe ausgewählt
```

    ## [1] 7.5 8.0 6.4 6.0 6.8

``` r
d$wert_t1[d$geschlecht == "W"]       # identisch, aber erst wird die Spalte ausgewählt und dann der Datensatz unterteilt 
```

    ## [1] 7.5 8.0 6.4 6.0 6.8

### 3.3. Subsetting/Unterteilen, Hinzufügen und Ändern von Daten

Mit den Auswahltechniken haben wir jetzt gelernt, wie wir eine Teilmenge der Daten auswählen können (subsetting). Dieser Teilmenge können wir natürlich auch eigene Namen zuweisen.

``` r
experimentelle_gruppe <- d[d$bedingung == "E",] # wir wählen nur die Beobachtungen aus, welche die Versuchsbedingung E aufweisen
experimentelle_gruppe
```

    ##   id bedingung geschlecht alter wert_t1 wert_t2
    ## 1  1         E          M    17     8.0     8.3
    ## 2  2         E          M    19     6.0     6.4
    ## 6  6         E          W    21     6.4     6.4
    ## 7  7         E          W    18     6.0     6.2
    ## 8  8         E          M    17     3.2     3.6

``` r
demographie <- d[, c('id','geschlecht','alter')] # wir schauen uns nur die demographischen Variablen in unserem Datensatz an
demographie
```

    ##    id geschlecht alter
    ## 1   1          M    17
    ## 2   2          M    19
    ## 3   3          W    22
    ## 4   4          M    18
    ## 5   5          W    16
    ## 6   6          W    21
    ## 7   7          W    18
    ## 8   8          M    17
    ## 9   9          M    26
    ## 10 10          W    18

Wir können jetzt auch weitere Spalten hinzufügen, indem wir die im ersten Schritt nicht ausgewählte Spalte "auswählen" und einen Vektor zuweisen. Wenn es sich um einen einzelnen Wert handelt, wird der Wert für die gesamte Spalte wiederholt. Zum Beispiel fügen wir eine Dummy-Variable für männlich hinzu, die wir zunächst auf 0 setzen.

``` r
d$männlich = 0
d
```

    ##    id bedingung geschlecht alter wert_t1 wert_t2 männlich
    ## 1   1         E          M    17     8.0     8.3        0
    ## 2   2         E          M    19     6.0     6.4        0
    ## 3   3         C          W    22     7.5     7.7        0
    ## 4   4         C          M    18     6.8     6.3        0
    ## 5   5         C          W    16     8.0     7.5        0
    ## 6   6         E          W    21     6.4     6.4        0
    ## 7   7         E          W    18     6.0     6.2        0
    ## 8   8         E          M    17     3.2     3.6        0
    ## 9   9         C          M    26     7.3     7.0        0
    ## 10 10         C          W    18     6.8     6.5        0

Wenn wir nun diesen Wert für alle männlichen Teilnehmer auf 1 ändern wollen, können wir einfach die Auswahl verwenden, um diese Spalte nur für männliche Teilnehmer zu erhalten, und dann dieser Auswahl 1 zuweisen.

``` r
d$männlich[d$geschlecht == "M"] = 1
d
```

    ##    id bedingung geschlecht alter wert_t1 wert_t2 männlich
    ## 1   1         E          M    17     8.0     8.3        1
    ## 2   2         E          M    19     6.0     6.4        1
    ## 3   3         C          W    22     7.5     7.7        0
    ## 4   4         C          M    18     6.8     6.3        1
    ## 5   5         C          W    16     8.0     7.5        0
    ## 6   6         E          W    21     6.4     6.4        0
    ## 7   7         E          W    18     6.0     6.2        0
    ## 8   8         E          M    17     3.2     3.6        1
    ## 9   9         C          M    26     7.3     7.0        1
    ## 10 10         C          W    18     6.8     6.5        0

Wir können Berechnungen mit den Spalten eines Datensatzes durchführen und so die vorhandenen Spalten überschreiben. Nehmen wir zum Beispiel an, dass wir die Werte für die zweit Untersuchungszeitpunkte auf einer Skala von 1 bis 100 haben wollen. Wir können die Spalten einfach mit 10 multiplizieren.

``` r
d$wert_t1 <- d$wert_t1 * 10 # beachtet bei diesem Befehl, dass wir den Datensatz (d) nennen und die gewünschte Variable (wert_t1 bzw. wert_t2) mittels des Dollarzeichen ansteuern
d$wert_t2 <- d$wert_t2 * 10
d
```

    ##    id bedingung geschlecht alter wert_t1 wert_t2 männlich
    ## 1   1         E          M    17      80      83        1
    ## 2   2         E          M    19      60      64        1
    ## 3   3         C          W    22      75      77        0
    ## 4   4         C          M    18      68      63        1
    ## 5   5         C          W    16      80      75        0
    ## 6   6         E          W    21      64      64        0
    ## 7   7         E          W    18      60      62        0
    ## 8   8         E          M    17      32      36        1
    ## 9   9         C          M    26      73      70        1
    ## 10 10         C          W    18      68      65        0

Natürlich können wir auch neue Variablen erstellen, um so die Ursprungswerte für wert\_t1 bzw. \_t2 zu behalten und die transformierten Werte in einer zweiten Variable zu speicher.

``` r
d$wert_t1 <- d$wert_t1 / 10 # erst stellen wir die Ursprungswerte wieder her
d$wert_t2 <- d$wert_t2 / 10

d$wert_t1_trans <- d$wert_t1 * 10 # in diesem Fall nehmen wir einen neuen Namen für unsere Variable (wert_t1_trans), kopieren die Werte von wert_t1 und multiplizieren diese mit 10
d$wert_t2_trans_trans <- d$wert_t2 * 10
d
```

    ##    id bedingung geschlecht alter wert_t1 wert_t2 männlich wert_t1_trans
    ## 1   1         E          M    17     8.0     8.3        1            80
    ## 2   2         E          M    19     6.0     6.4        1            60
    ## 3   3         C          W    22     7.5     7.7        0            75
    ## 4   4         C          M    18     6.8     6.3        1            68
    ## 5   5         C          W    16     8.0     7.5        0            80
    ## 6   6         E          W    21     6.4     6.4        0            64
    ## 7   7         E          W    18     6.0     6.2        0            60
    ## 8   8         E          M    17     3.2     3.6        1            32
    ## 9   9         C          M    26     7.3     7.0        1            73
    ## 10 10         C          W    18     6.8     6.5        0            68
    ##    wert_t2_trans_trans
    ## 1                   83
    ## 2                   64
    ## 3                   77
    ## 4                   63
    ## 5                   75
    ## 6                   64
    ## 7                   62
    ## 8                   36
    ## 9                   70
    ## 10                  65

### 3.4. Andere gängige Datenstrukturen

Es gibt weitere gängige Datenstrukturen, wie z. B. eine Matrix und eine Liste. Pakete können auch neue Klassen zum Organisieren und Manipulieren von Daten bereitstellen, wie z. B. die Dokument-Featur-Matrix (dfm) von Quanteda, welche wir im ersten Tutorial kurz kennengelernt haben.

# 4. Funktionen

Machen wir jetzt den nächsten Schritt und gehen zu Funktionen mit mehreren Argumenten über. Schauen wir uns als Beispiel die euch bereits bekannte Funktion `dfm()` aus dem quanteda-Paket an. Damit wir auf diese Funktion zugreifen können, müssen wir zunächst `library(quanteda)` ausführen. Damit teilen wir `R` mit, dass das Paket und die dort programmierten Funktionen jetzt nutzen möchten. **Achtung**: Ihr müsst das Paket natürlich vorher installiert haben. Falls das noch nicht geschehen ist oder ihr inzwischen den Computer gewechselt habt, dann müsst ihr zuerst `install.packages("quanteda")` ausführen.

Führt jetzt bitte den folgenden Code in eurem `R`-Skript aus. Dann wird sich automatisch unten rechts eine Hilfestellung mit Beschreibungen der Funktion öffnen.

``` r
library(quanteda)
?dfm
```

Der Titel und die Beschreibung fassen die Aufgaben der Funktion bereits treffend zusammen:

"Create a document-feature matrix

Description

Construct a sparse document-feature matrix, from a character, corpus, tokens, or even other dfm object."

Sehen wir uns jetzt den Abschnitt "Usage" an. Hier sehen wir, dass zwischen den Klammern mehrere Argumente angegeben werden. Diese Argumente werden im Abschnitt "Arguments" detalliert erklärt. Diese Beschreibungen findet ihr auch im Internet, zum Beispiel hier: <https://www.rdocumentation.org/packages/quanteda/versions/2.1.2/topics/dfm>.

Beachtet bitte, dass allen Argumenten (mit Ausnahme der Variable x, die euer Input in die Funktion darstellt) ein Wert in der Form `argument = value` zugewiesen ist. Das Argument `tolower` hat den Wert TRUE, `stem` hat den Wert FALSE, usw. Das sind die Standardwerte für diese Argumente, die verwendet werden, wenn der Benutzer sie nicht angibt. Auf diese Weise können wir die Funktion `dfm()` mit den Standardeinstellungen verwenden, indem wir nur das Argument x eingeben.

``` r
beispiel_text = c("Ich studiere", "PoWi in Hannover")
dfm(x = beispiel_text)
```

    ## Document-feature matrix of: 2 documents, 5 features (50.0% sparse).
    ##        features
    ## docs    ich studiere powi in hannover
    ##   text1   1        1    0  0        0
    ##   text2   0        0    1  1        1

Wenn wir diese zwei Zeilen Code ausführen, gibt sie eine Matrix mit den Häufigkeiten der einzelnen Wörter für jeden Text zurück. Beachtet bitte zwei Sachen. Erstens, `c("Ich studiere", "PoWi in Hannover")` kreiert zwei *character* Vektoren, die quanteda dann als zwei Texte ansieht, Zweitens. Die Wörter "Ich", "PoWi" und "Hannover" werden in der Document-Feature-Matrix kleingeschrieben. Das ist der Fall, weil das Argument `tolower` (dessen Aufgabe mit "convert all features to lowercase" beschrieben wird) standardmäßig TRUE ist.

Argumente, die keinen Standardwert haben, wie z. B. x in der Funktion `dfm()`, sind obligatorisch. Wenn ihr jetzt die folgende Codezeile ausführt, dann erhaltet ihr die Fehlermeldung, dass das Argument "x" fehlt und keinen Standardwert hat.

``` r
dfm()
```

In den meisten Fällen werdet ihr zusätzlich zu den obligatorischen Argumenten noch bestimmte Argumente verändern bzw. angeben um ein gewünschtes Ergebniss zu erzielen. Hierfür gibt es zwei Möglichkeiten:

-   Ihr verwendet die gleiche Reihenfolge, wie sie auf der Help-Seite (?dfm) angegeben ist
-   Ihr nutzt die Eigennamen der Argumente (hierbei ist die Reihenfolge egal, mit Ausnahme von x das immer am Anfang stehen muss)

-   Möglichkeit 1:

``` r
dfm(x = beispiel_text, FALSE, TRUE)
```

    ## Document-feature matrix of: 2 documents, 5 features (50.0% sparse).
    ##        features
    ## docs    Ich studier PoWi in Hannov
    ##   text1   1       1    0  0      0
    ##   text2   0       0    1  1      1

In der Ausgabe sehen wir die Wörter "Ich", "studier", "PoWi", "in" und "Hannov". "studier" und "Hannov" sehen deswegen so komisch aus, weil wir das Argument `stem` mit einem TRUE versehen haben. Stemming bricht die Wörter auf seine Wortstämme runter, um so die Anzahl der möglichen Wortvarienten mit gleicher Bedeutung zu reduzieren. Was sehen wir noch? Wir sehen das die Wörter Großbuchstaben haben. Das rührt daher, dass wir das `tolower` Argument auf FALSE gesetzt haben. Die Großbuchstaben wurden also nicht mehr in Kleinbuchstaben umgewandelt.

Dieser Weg ist erstens, anfällig für Fehler und zweitens, verringert er die Chance zur Replizierbarkeit eures Codes durch Dritte. Wer merkt sich schon die Reihenfolge von Funktions-Argumenten?

Daher ist es empfehlenswert, dass ihr Befehle namentlich an die Argumente gebt.

-   Möglichkeit 2:

``` r
dfm(x = beispiel_text, tolower = FALSE, stem= TRUE)
```

    ## Document-feature matrix of: 2 documents, 5 features (50.0% sparse).
    ##        features
    ## docs    Ich studier PoWi in Hannov
    ##   text1   1       1    0  0      0
    ##   text2   0       0    1  1      1

Dieser Weg - namentliche Nennung der Argumente - ist expliziter und sicherer. Andererseits kann es aber auch unnötig langatmig sein, alle Argumente anzugeben. Zum Beispiel `x = beispiel_text`. Daher können wir beide Ansätze kombinieren, indem wir die Argumente auf der linken Seite (d. h. die ersten und oft obligatorischen Argumente) der Reihe nach übergeben und die Argumente auf der rechten Seite namentlich benennen.

``` r
dfm(beispiel_text, tolower = FALSE, stem= TRUE)
```

    ## Document-feature matrix of: 2 documents, 5 features (50.0% sparse).
    ##        features
    ## docs    Ich studier PoWi in Hannov
    ##   text1   1       1    0  0      0
    ##   text2   0       0    1  1      1

Welchen Ansatz ihr auch folgt, es ist wichtig das ihr eine gewisse Konsistenz in eurem Code habt. Ich müsst auch immer im Hinterkopf haben, dass euer Code von anderen gelesen und verstanden werden muss. Eine gute allgemeine Regel ist, obligatorische Argumente (wie x in der dfm-Funktion) ohne Namen zu übergeben, aber alle optionalen Argumente (die eine Voreinstellung haben, wie `tolower` und `stem`) namentlich anzusteuern. Ein zweiter grundsätzlicher Hinweis, der das Verständis eures Codes erheblich vereinfacht, ist, dass ihr alle eure Schritte kurz und bündig kommentiert. Das macht ihr mit dem `#-Zeichen (`R`erkennt alles nach einem`\#\` nicht als Code bzw. Befehl an):

``` r
dfm(beispiel_text, tolower = TRUE, stem= FALSE) # dfm mit bespiel_text bilden; alle buchstaben in kleinbuchstaben verwandeln, kein stemming 
```

    ## Document-feature matrix of: 2 documents, 5 features (50.0% sparse).
    ##        features
    ## docs    ich studiere powi in hannover
    ##   text1   1        1    0  0        0
    ##   text2   0        0    1  1        1

# 4. Zusätzliche Anweisungen

Jetzt wenden wir uns noch einigen zusätzlichen Datentypen, Strukturen und Funktionen zu. Hier wird es jetzt auch etwas komplizierter. Ihr solltet daher vor allem den ersten Teil dieses Tutoriums wirklich gut verstehen.

### 4.1. Zusätzliche Datentypen

#### Faktoren

Ein Faktor in `R` ist eine Reihe von beschrifteten Zahlen. Das ist vor allem für kategoriale Variablen nützlich, wie z.B. den Bildungsgrad (Fachhochschulreife, Hochschulreife) oder den Medientyp (Wochenzeitung, Tageszeitung).

``` r
x <- c("Die Zeit", "Die Welt", "die tageszeitung", "Süddeutsche Zeitung"
       ,"die tageszeitung", "Die Zeit",  "Süddeutsche Zeitung")
x
```

    ## [1] "Die Zeit"            "Die Welt"            "die tageszeitung"   
    ## [4] "Süddeutsche Zeitung" "die tageszeitung"    "Die Zeit"           
    ## [7] "Süddeutsche Zeitung"

Wir haben nun eine Folge von *character* Werten. Das Besondere ist, dass sich einige Werte wiederholen. In diesem Fall ist es am besten, wenn ihr euch die einzelnen Werte ("Die Zeit", "Die Welt" etc.) als Etikett vorstellt. Das wird klarer, wenn wir x in einen *factor* Wert transformieren.

``` r
x <- factor(x)
x
```

    ## [1] Die Zeit            Die Welt            die tageszeitung   
    ## [4] Süddeutsche Zeitung die tageszeitung    Die Zeit           
    ## [7] Süddeutsche Zeitung
    ## Levels: die tageszeitung Die Welt Die Zeit Süddeutsche Zeitung

Zwei Dinge haben sich geändert. Erstens sehen wir, dass es jetzt eine Zeile gibt, auf der "Levels: ..." steht, in der die eindeutige Bezeichnungen angezeigt werden. Zweitens, die Anführungszeichen sind verschwunden. Das liegt daran, dass es sich nicht mehr um *character* sondern um *factor* Werte handelt.

Das bedeutet: x ist jetzt eine Folge von Zahlen geworden und jede Zahl verweist auf eine Beschriftung.

``` r
as.numeric(x) # Anzeige der Nummer
```

    ## [1] 3 2 1 4 1 3 4

``` r
levels(x)     # Anzeige der Level / Label
```

    ## [1] "die tageszeitung"    "Die Welt"            "Die Zeit"           
    ## [4] "Süddeutsche Zeitung"

Wenn euch das verwirrt, dann ist das zum jetzigen Zeitpunkt ganz normal!

Die Vorteile von Faktoren werden später deutlicher. Vor allem wenn ihr damit anfangt, mit bestimmten Arten von Analysen und Visualisierungen zu arbeiten, und wenn ihr sehr große Daten verwendet (numerische Werte benötigen weniger Speicher als Zeichenwerte, was der Vorteil von *factor* Werten ist).

Es ist auch vollkommen legitim, wenn ihr zu dem Schluss gekommen seid, dass ihr Faktoren lästig findet und zukünftig einfach bei *character* Werten bleiben werdet. Das Problem ist aber, dass `R` die Neigung hat seinen Benutzern *factor* Werte aufzuzwingen. Zum Beispiel denkt `R` beim importieren von externen Datensätzen, dass klassische *character* Spalten mit Volltexten von Gerichtsurteilen besser als *factor* geeinigt ist.

Solltet ihr dennoch einmal Probleme mit Faktoren haben und wirklich lieber *character* Werte verwenden, könnt ihr einfach `as.character()` verwenden.

``` r
x <- as.character(x)
x
```

    ## [1] "Die Zeit"            "Die Welt"            "die tageszeitung"   
    ## [4] "Süddeutsche Zeitung" "die tageszeitung"    "Die Zeit"           
    ## [7] "Süddeutsche Zeitung"

#### Logische Daten

Logische Datentypen haben nur zwei Werte: TRUE und FALSE (die mit T und F abgekürzt werden können). Ihr werdet in euren Daten selten auf logische Werte stoßen, aber ihr werdet logischer Operatoren nutzen um eure Daten zu unterteilen und zu transformieren.

Ich empfehle euch, dass ihr die folgende Seite besucht, durchlest und mit eigenen Code nachverfolgt:

-   <https://towardsdatascience.com/the-complete-guide-to-logical-operators-in-r-9eacb5fd9abd>

#### Datum/Uhrzeit

Daten gehören nicht zu den grundlegenden Datentypen in `R`, aber in der sozialwissenschaftlichen Forschung arbeiten wir natürlich oft mit Kalenderdaten und Uhrzeiten. Dies erfordert einen speziellen Datentyp, denn es gibt viele Einschränkungen und Probleme, wenn wir versuchen, Datums- und Zeitangaben als Zeichen- oder numerische Werte auszudrücken. Zwei der gebräuchlichsten Datumsklassen in `basic R` (d. h. ohne zusätzliche Pakete) sind `Date`, das nur Kalenderdaten verarbeitet, und `POSIXlt`, das sowohl Kalenderdaten als auch Uhrzeiten verarbeitet.

Da sich der grundlegende Umgang mit den unterschiedlichen Daten- und Zeittypen in `R` ähnelt, fokussieren wir uns im Folgenden auf `POSIXlt`.

Generall brauchen wir nur zwei Funktionen um die meisten Daten/Zeit-Aufgaben zu bewältigen (two functions to rule them all): `strptime()` und `strftime()`.

-   strptime (string parse time) erzeugt einen Datums-/Zeitwert aus einem Zeichenwert
-   strftime (string format time) extrahiert Teile eines Datums/einer Uhrzeit aus einem Datums-/Zeitwert

Im Wesentlichen handelt es sich um einen String (*character* Werte). Dieser String enthält das Datumsformat, wobei spezielle Platzhalter verwendet werden, um bestimmte Teile des Datums anzugeben. Diese Platzhalter sind immer ein Prozentzeichen `%`, gefolgt von einem Buchstaben. Die am häufigsten verwendeten Platzhalter sind:

| Platzhalter | Datums Aspekt                                            |
|-------------|----------------------------------------------------------|
| %Y          | Jahr mit Jahrhundert (2001, 2010)                        |
| %m          | Monat als Dezimalzahl (01, 02,..., 06,..., 12)           |
| %d          | Tag als Dezimalzahl (01, 02, 03, 04,..., 11, 12)         |
| %H          | Stunde als Dezimalzahl (00, 01, 03, 04,..., 22, 23, 24)  |
| %M          | Minute als Dezimalzahl (01, 02, 03, 04,..., 57, 58, 59)  |
| %S          | Sekunde als Dezimalzahl (01, 02, 03, 04,..., 57, 58, 59) |

Mit diesen Platzhaltern können wir verschiedene Datumsformate beschreiben.

Zum Beispiel können wir mit der Funktion `strptime` ein Datum in einen Datumstyp (POSIXlt) transformieren (*parsen*).

``` r
strptime('2010-01-01 20:00:00', format = '%Y-%m-%d %H:%M:%S')
```

    ## [1] "2010-01-01 20:00:00 CET"

``` r
strptime('01/01/2010', format = '%m/%d/%Y')
```

    ## [1] "2010-01-01 CET"

``` r
strptime('2010 any 01 format 01 goes', format = '%Y any %m format %d goes')
```

    ## [1] "2010-01-01 CET"

Mit der Funktion `strftime()` können wir dieselben Formatstrings verwenden, um bestimmte Teile aus einem Datums-/Zeitwert extrahieren. Hier erstellen wir zuerst ein POSIXlt-Datum mit `strptime` und verwenden dann `strftime`, um Teile zu extrahieren. Beachtet das alle Teile als *character* zurückgegeben werden, auch wenn es sich um einzelne Zahlen handelt.

``` r
x <-  strptime('2010-06-01 20:00:00', format = '%Y-%m-%d %H:%M:%S')
strftime(x, '%Y')
```

    ## [1] "2010"

``` r
strftime(x, 'Jahr %Y Woche %W')
```

    ## [1] "Jahr 2010 Woche 22"

``` r
strftime(x, 'Heute ist %A')  ## die Sprache der Werktage ist abhängig von euren lokalen Einstellungen in R
```

    ## [1] "Heute ist Dienstag"

Eine vollständige Dokumentation aller Möglichkeiten von `strptime` und allen anderen Funktionen erhaltet ihr, wenn ihr ein Fragezeichen vor den Funktionsnamen setzt und als Code ausführt. Die Hilfeseite sollte sich im Fenster unten rechts in `RStudio` öffnen.

``` r
?strptime
?strftime
```

Probiert auch mal zwei Fragezeichen aus. Dann gibt R eine Liste aller denkbaren Funktionen, die es in allen von euch installierten Paketen finden kann (momentan werden das noch nicht viele sein):

``` r
??strptime
??strftime
```

Wenn ihr weiter mit Datums- und Zeitoperationen rumspielen wollt, dann empfehle ich euch das Paket `lubridate`. Die Verwendung wird in diesem (Online-) Kapitel in "R for Data Science" ausführlich erklärt: <https://r4ds.had.co.nz/dates-and-times.html>. Und natürlich gibt es auch ein Cheat Sheet (wie für sehr viele andere Pakete, ihr müsst nur danach suchen): <https://github.com/rstudio/cheatsheets/raw/master/lubridate.pdf>

#### Vergleiche

Am häufigsten werdet ihr in `R` mit logischen Werten konfrontiert, wenn ihr einen Vergleich zwischen zwei Werten oder Vektoren anstellt. Es gibt 6 Arten von operator-basierenden Vergleichen:

| Operator  | Bedeutung                      |
|-----------|--------------------------------|
| x &lt; y  | x ist kleiner als y            |
| x &gt; y  | x ist größer als y             |
| x &lt;= y | x ist kleiner oder gleich y    |
| x &gt;= y | x ist größer als oder gleich y |
| x == y    | x ist gleich y                 |
| x != y    | x ist nicht gleich y           |

Das Ergebnis eines Vergleiches zweier Werte ist ein logischer Wert

``` r
5 < 10
```

    ## [1] TRUE

``` r
5 < 2
```

    ## [1] FALSE

Das Ergebnis eines Vergleichs von zwei Vektoren ist ein logischer Vektor. Nehmen wir zum Beispiel an, dass wir die durchschnittlichen Mathematiknoten von 5 SchülerInnen im Jahr 1 und im Jahr 2 haben. Wir wollen kontrollieren, ob ihre Noten gesunken sind (d. h. die Noten im Jahr 1 war höher als im Jahr 2). Hier sehen wir, dass nur für den/die erste\_n SchülerIn die Note gesunken ist (von 6 in Jahr 1 auf 5 in Jahr 2), also ist nur der erste Wert WAHR.

``` r
note_jahr_1 <-  c(6,6,7,7,4)
note_jahr_2 <-  c(5,6,8,7,6)
note_jahr_1 > note_jahr_2 
```

    ## [1]  TRUE FALSE FALSE FALSE FALSE

Wenn wir einen Vektor mit einem einzelnen Wert vergleichen, wird jeder Wert des Vektors mit diesem Wert verglichen. Das ist eine Kernmechanik hinter der Auswahl und Unterteilung von Daten. Im folgenden Beispiel werden wir nachschlagen, welche TeilnehmerInnen mindestens 18 Jahre alt sind.

``` r
jahr <-  c(17,34,12,20,12,25,30,14,33)
jahr >= 18
```

    ## [1] FALSE  TRUE FALSE  TRUE FALSE  TRUE  TRUE FALSE  TRUE

Schließlich gibt es noch einen weiteren Operator, der einen logischen Wert oder Vektor erzeugt, obwohl es sich nicht um einen Vergleich im eigentlichen Sinne handelt.

| Operator | Bedeutung                                 |
|----------|-------------------------------------------|
| x %in% y | der/die Wert(e) in x existieren auch in y |

Dies ist zum Beispiel nützlich, wenn wir nach mehreren Werten suchen wollen. Zum Beispiel suchen hier hier nach Philipp und Christoph in unserer Namensliste.

``` r
name <-  c("Anton","Marie","Philipp","Katrin","Christoph")
name %in% c("Philipp", "Christoph")
```

    ## [1] FALSE FALSE  TRUE FALSE  TRUE

#### Logische Operatoren

Bei einem logischen Wert (oder Vektor) können wir die logischen Operatoren & (AND), | (OR) und ! (NOT) nutzen. In der folgenden Tabelle sind x und y beides logische Werte.

| Operator | Bedeutung |
|----------|-----------|
| x & y    | x AND y   |
| x I y    | x OR y    |
| !x       | NOT x     |

Bitte kopiert euch den folgenden Code und schaut welches Ergebnis `R` nach der Ausführung ausgibt:

``` r
TRUE & TRUE        
TRUE & FALSE       
FALSE & FALSE      

TRUE | TRUE        
TRUE | FALSE       
FALSE | FALSE     

!TRUE              
!FALSE             

TRUE & !FALSE      
TRUE & (!TRUE | TRUE) 

a <-  c(T, T, F, F, F, T)
b <-  c(T, F, F, F, T, T) 
a & b              
```

# 5. Methoden und generische Funktionen

### Ein Hinweis zu 'Methoden' und 'generischen Funktionen'

Einige Funktionen sind generische Funktionen, die abhängig von der Eingabe, mit der sie verwendet werden, unterschiedliche Methoden nutzen. Abgesehen von den technischen Details gibt es eine zentrale Sache, die ihr mit eurem aktuellen Wissensstand wissen solltet.

Eine Methode ist eine Funktion, die mit einem bestimmten Objekt verbunden ist. Zum Beispiel funktioniert das *subsetting* (Unterteilen/Einteilen) eines Vektors anders als das *subsetting* eines `data.frame` oder einer Matrice. Trotzdem braucht ihr nur eine Funktion namens `subset()`, damit ihr alle Datentypen *subsetten* könnt. In `R` ist die Funktion `subset()` daher eine generische Funktion, die sich je nach Art der Eingabe unterschiedlich verhält.

Die Art der Eingabe an die subset()-Funktion bestimmt also auch, welche Art von Argumenten verwendet werden kann. Mehr dazu verrät die Dokumentation.

``` r
?subset
```

In der Beschreibung sehen wir, dass `subset()` auf Vektoren, Matrizen oder `data.frames` angewendet werden kann. Der Abschnitt "Usage" enthält daher verschiedene Versionen, für verschiedene S3-Methoden (ignoriert "S3" vorerst), die mit verschiedenen Arten von Eingaben verbunden sind. Die allgemeine Form ist `subset(x, ...)`, was zeigt, dass subset immer ein Argument x benötigt, und bei den Argumenten sehen wir, dass x das "object to be subsetted" ist. Wir sehen dann drei Methoden: default, 'matrix' und 'data.frame'.

-   Default wird verwendet, wenn x weder eine Matrice noch ein `data.frame` ist (z. B. ein Vektor). In diesem Fall ist das einzige Argument die Teilmenge, also der Ausdruck (z. B. x &gt; 10), mit dem eine Auswahl getroffen wird.

-   Wenn die Eingabe eine "matrice" ist, gibt es zwei zusätzliche Argumente: select und drop. Es macht Sinn, dass diese für Vektoren nicht zur Verfügung stehen, da beide nur relevant sind, wenn es mehrere Spalten gibt. Das heißt, select wird für die Auswahl von Spalten verwendet, und drop kann verwendet werden, damit `subset()` einen Vektor (statt einer Matrice) zurückgibt, wenn nach dem subsetting nur eine Zeile oder Spalte übrig bleibt.

-   Wenn die Eingabe ein `data.frame` ist, werden die gleichen Argumente wie für 'matrix' verwendet (aber intern arbeitet die Methode anders)

# 6. Weitere Lektüre

Wenn ihr mehr über die Grundlagen von `R` erfahren wollt, dann empfehle ich:

-   Das (kostenlose Online-)Buch R for Data Science: <https://r4ds.had.co.nz/index.html>
-   Die Teilnahme an einer der vielen (kostenlosen) Online-Einführungen, wie sie z. B. von DataCamp (<https://www.datacamp.com/courses/free-introduction-to-r>) oder Code School (<https://www.pluralsight.com/search?q=R>) angeboten werden.

Außerdem kann es sinnvoll sein, sich einige der Cheat Sheets zu besorgen, die auf der RStudio-Website gesammelt sind. Für die Grundlagen von `R` ist das Cheat Sheet zu `Base R` besonders nützlich (<https://rstudio.com/resources/cheatsheets/>).

# 7. Hinweis

Bitte vergesst nicht die Aufgaben zu machen, die ich euch als `R`-Skript mit dem namen `excercises_basicR_commands.R` hochgeladen habe.
