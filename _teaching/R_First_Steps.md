Einführung in `R`: Erste Schritte
================
Philipp Meyer, Institut für Politikwissenschaft
14.04.2021, Einführung, Seminar: Quantitative Textanalyse

-   [1. Einleitung](#einleitung)
    -   [1.1. Was ist `R` und warum sollten wir es lernen?](#was-ist-r-und-warum-sollten-wir-es-lernen)
    -   [1.2. Zweck dieses Tutorials](#zweck-dieses-tutorials)
-   [2. Erste Schritte mit `R`](#erste-schritte-mit-r)
    -   [2.1. `R` installieren](#r-installieren)
    -   [2.2. `RStudio` installieren](#rstudio-installieren)
    -   [2.3. Verwenden von `RStudio`](#verwenden-von-rstudio)
    -   [2.4. Ausführen von Code aus dem `R`-Skript](#ausführen-von-code-aus-dem-r-skript)
    -   [2.5. Zuweisen von Werten](#zuweisen-von-werten)
    -   [2.6. Verwenden von `RStudio`-Projekten](#verwenden-von-rstudio-projekten)
-   [3. Erste (gewollte) Überforderung: Textanalyse in R](#erste-gewollte-überforderung-textanalyse-in-r)
    -   [3.1. Installieren und Laden des Quanteda-Pakets](#installieren-und-laden-des-quanteda-pakets)
    -   [3.2. Der erste Kontakt: Die Antrittsreden der US Präsidenten](#der-erste-kontakt-die-antrittsreden-der-us-präsidenten)
    -   [3.3. Die Document-Term-Matrix](#die-document-term-matrix)
    -   [3.4. Word clouds](#word-clouds)
    -   [3.5. Keyword in context](#keyword-in-context)
    -   [3.6. Korpus-Vergleich](#korpus-vergleich)

# 1. Einleitung

### 1.1. Was ist `R` und warum sollten wir es lernen?

`R` ist eine Open-Source-Programmiersprache, die zu den beliebtesten Sprachen in den *Data science* gehört. Im Vergleich zu anderen Programmen die für die empirische Forschung in den Sozialwissenschaften genutzt werden, wie SPSS und Stata, hat `R` besondere Vorteile:

-   `R` ist eine Programmier**sprache**. Von daher ist `R` deutlich vielseitiger als Statistik**programme** wie SPSS oder STATA. `R` ermöglicht nicht nur die statistische Analyse von empirischen Daten, sondern auch die praktische Implementierung von *Data science*-Werkzeugen (z.B. quantitativen Textanalyse, Cloud computing mit Amazon AWS, Machine Learning Anwendungen (umgangssprachlich: die Nutzung von künstlicher Intelligenz)).

-   Die Anwendungsbereiche von `R` wird ständig aktualisiert und erweitert. `R` ist **open-source**, weshalb jeder einzelne zur stetigen Entwicklung einen Beitrag leisten kann. Insbesondere die Entwicklung von Paketen ist hier zu nennen (dazu später mehr). WissenschaftlerInnen sowie Fachleute aus der Wirtschaft verwenden `R`, weshalb in den aller meisten Fällen alle neuen Methoden, Techniken und Anwendungen bereits zur Verwendung in `R` verfügbar. Ihr könnt euch `R` also als einen App-Store für *Data science*-Anwendungen vorstellen.

    -   Da `R` von den NutzerInnen stetig weiterentwickelt wird, finden sich im Internet allen `R`-bezogenen Fragen die passenden Antworten. Neben der einfachen Suche bei *Google* (am besten immer R als Präfix nutzen und dann erst das gesuchte Thema nennen) sind vor allem <http://www.stackoverflow.com>, <http://www.r-bloggers.com> und <http://www.stackexchange.com> die **zentralen Anlaufstellen**. In deutscher Sprache ist <https://de.wikibooks.org/wiki/GNU_R> zu nennen. Das ist aber weniger eine konkrete Hilfeseite, sondern eher ein R-Lexikon.

-   `R` ist kostenlos.

Das Problem ist, dass das Erlernen von `R` nicht intuitiv ist. R hat eine steile Lernkurve: schwer am Anfang und mit der Zeit und steigender Erfahrung immer zugänglicher. Dennoch ist das Erlernen von R nicht so schlimm, wie oft befürchtet wird, und dank der steigenden Popularität der *Data science* gibt es jetzt viele Anlaufpunkte, die das Erlernen und die Anwendung von R erleichtern (für eine Liste von Einführungen und Tutorials siehe: <https://www.r-bloggers.com/2015/12/how-to-learn-r-2/>). In diesem Kurs lernen Sie die wichtigsten Grundlagen kennen und erfahren, wie Sie damit sofort Zugang zu den modernsten Techniken erhalten.

### 1.2. Zweck dieses Tutorials

Der Schwerpunkt dieses Tutorials liegt darauf, euch den Einstieg in `R` zu erleichtern. Hier wird also noch nicht darauf eingegangen, wie `R` und die `R`-Syntax funktionieren. Es ist also kein Problem, wenn Ihr den verwendeten Code noch nicht versteht. Hier soll der Fokus vor allem darauf liegen, `R` zum laufen zu bringen, euch mit der Syntax vertraut zu machen und erste Spielereien anzustellen.

# 2. Erste Schritte mit `R`

Ihr müsst zwei Programme installiert haben, damit ihr den hier präsentierten Code auch an eurem Computer ausführen könnt:

-   1.  `R` ist die Software, die zur Ausführung des Code verwendet wird.

-   1.  `RStudio` ist eine grafische Benutzeroberfläche (GUI), die die Arbeit mit `R` wesentlich erleichtert. `RStudio` funktioniert nicht ohne eine Installation von `R`.

Beide Programme können kostenlos heruntergeladen werden und sind für alle wichtigen Betriebssysteme (Windows, MacOS und Linux) verfügbar.

### 2.1. `R` installieren

`R` könnt ihr von der CRAN (comprehensive R Archive Network) Website herunterladen (siehe: <https://cran.r-project.org/>).

### 2.2. `RStudio` installieren

Die `RStudio`-Website enthält Download-Links und Installationsanweisungen (siehe: <https://rstudio.com/>) . Ihr müsst die kostenlose Open-Source-Lizenz für `RStudio` Desktop installieren.

### 2.3. Verwenden von `RStudio`

Nachdem `R` und `RStudio` installiert wurden, kann `RStudio` gestartet werden. Wenn alles korrekt installiert wurde, wird `RStudio` automatisch auch `R` starten.

Wenn `RStudio` zum ersten Mal geöffnet wird, werden wahrscheinlich drei separate Fenster zu sehen sein. Der erste Schritt ist jetzt ein `R`-Skript zu öffnen. `R`-Skripte sind die zentralen Arbeitsflächen. Um ein `R`-Skript zu öffnen, müsst ihr mit der Maus die Symbolleiste (oben links) ansteuern und folgendes wählen:

-   Datei `->` Neue Datei `->` R-Skript

Ihr seht jetzt vier Fenster:

-   Oben links ist der Texteditor für die Datei, in der gerade gearbeitet wird. Meistens handelt es sich dabei um ein `R`-Skript (wie das gerade geöffnete).

-   Oben rechts sind entweder die Datensätze, Variablen, Objekte und Werte zu sehen, mit denen gerade gearbeitet wird (Umgebung / Environment), oder ihr seht die Eingabenhistorie (Geschichte / History), die alle bis zu diesem Zeitpunkt ausgeführten Kommandos/Funktionen auflistet.

-   Unten links ist die Konsole, in der Code eingegeben und ausgeführt oder aber die Ausgabe/Ergebnisse von ausgeführten Codes angesehen werden kann.

-   Unten rechts ist ein interaktives Feld, in den Dateien, die auf dem lokalen Computer gespeichert sind, gesucht und geöffnet werden können, Hilfe zu Funktionen anzeigt oder Visualisierungen angesehen werden können.

Theoretisch kann ein `R`-Code direkt in die Konsole eingeben werden (unten links). Das Problem ist jedoch, dass `R` die eingebenen Funktionen/Kommandos direkt wieder "vergisst". Von daher sollte **immer** in einem `R`-Skript gearbeitet werden (oben links). Auf diese Weise kann der Überblick über die Arbeitsschritte behalten und der Arbeitsfortschritt gespeichert werden.

### 2.4. Ausführen von Code aus dem `R`-Skript

Kopiert den folgenden Beispielcode und fügt ihn in euer `R`-Skript ein. Ihr müsst die Syntax vorerst nicht verstehen. Konzentriert euch einfach auf die Ausführung.

``` r
# R kann als over-powered Taschenrechner genutzt werden
3 + 3
2 * 5
6 / 2

# Oder wir schreiben kleine Texte
"Institut für Politikwissenschaft"
"Arbeitsbereich Vergleichende Regierungslehre und Politisches System Deutschlands"

# Oder wir nutzen eine der vielen Funktionen. Hier die befehlen wir R die in den Klammern aufgelisteten Werte zu summieren.

sum(1,2,3,4,5)
```

Ihr könnt des Codes in einem `R`-Skript ausführen, indem ihr Strg + Enter drück (Mac: Command + Enter). Das kann auf zwei Arten geschehen:

-   Wenn ihr einen Textteil markiert (so dass er hervorgehoben wird), könnt ihr Strg + Enter (Mac: Command + Enter) drücken, um die Auswahl auszuführen. Markiert jetzt die ersten drei Zeilen (die drei mathematischen Operationen) und drückt Strg + Enter (Mac: Command + Enter).

-   Wenn keine Auswahl getroffen wurde, aber der Textcursor sich im Editor befindet, könnt ihr Strg + Enter (Mac: Command + Enter) drücken, um die Zeile, auf der sich der Cursor befindet, auszuführen. Dadurch bewegt sich der Cursor automatisch in die nächste Zeile, so dass der Code von oben nach unten durchlaufen werden kann, wobei jede Zeile einzeln durchlaufen werden kann, Beginnt jetzt mit der ersten Zeile und drückt neunmal Strg + Enter (Mac: Command + Enter), um jede Zeile einzeln auszuführen.

### 2.5. Zuweisen von Werten

Führt die folgenden Code-Zeilen einzeln **in eurer Console** (nicht im Skript) aus:

``` r
# R kann als Taschenrechner genutzt werden
3 + 3
```

    ## [1] 6

``` r
2 * 5
```

    ## [1] 10

``` r
sum(1,2,3,4,5)
```

    ## [1] 15

Ihr solltet jetzt sehen, dass `R` die Eingaben automatisch verarbeitet. Aus 3 + 3 wird "6", aus 2 \* 5 wird "10" und die Auswertung der Funktion sum(1,2,3,4,5) führt zu dem Ergebnis "15".

Auf die Verwendung von `R` als Taschenrechner und die Ausführung von Funktionen gehen wir später genauer ein. Eine weitere wichtige Sache, die ihr über die `R`-Syntax wissen müsst, ist wie Vektoren Werte zugewiesen werden können.

Umgegangssprachlich ausgedrückt ist die Zuordnung von Werten der zentrale Weg, wie man `R` dazu bringt, sich Dinge zu merken und zu speichern (als Werte im Umfeld / Environment, oben rechts). Dies funktioniert für alle Arten von Werten, von einzelnen Zahlen, Buchstaben, Sätzen bis hin zu ganzen Datensätzen, auf die gleiche Weise. Für die Zuordnung nutzen wir einen Pfeil (&lt;-).

Gebt den folgenden Code in euer Skript ein und führt ihn aus:

``` r
x <- 2
y <- "some text"
```

Hier haben wir uns die Zahl 2 als x und den Text "some text" als y gemerkt. Wenn ihr in `RStudio` arbeitet, könnt ihr diese Namen und Werte jetzt auch im Fenster oben rechts unter dem Reiter Umgebung / Environment sehen.

Wir können nun die Namen verwenden, um die Werte abzurufen oder um diese Werte in neuen Befehlen zu verwenden:

``` r
x * 5
```

    ## [1] 10

Hier haben wir `R` den Befehl gegeben den Wert der mit x gespeichert wurde mit 5 zu multiplizieren.

Beachtet bitte, dass ihr die Zeile \#\# \[1\] 10 nicht tippen solltet: In diesem Tutorial zeigen Zeilen, die mit \#\# beginnen, die Ausgabe von Befehlen an (x(also 2) \* 5 = 10).

### 2.6. Verwenden von `RStudio`-Projekten

Es ist am besten, wir ihr alle Skripte die ihr in diesem Seminar anfertigt in einem `RStudio`-Projekt verwaltet. Im wesentlichen handelt es sich hierbei um einen Ordner, in dem die `R`-Dateien und Daten für das Projekt gespeichert werden, an dem gerade gearbeitet wird. Projekte sind nicht unbedingt nötig, um mit `R` zu arbeiten, aber sie sind praktisch, und ich empfehle euch dringend diese Funktion von `RStudio` zu nutzen.

Um ein neues Projekt zu erstellen, müsst ihr mit der Maus die Symbolleiste (oben links) ansteuern und folgendes wählen:

-   Datei `->` Neues Projekt

Folgt den Anweisungen, um ein neues Verzeichnis mit einem neuen Projekt zu erstellen. Findet einen sinnvollen Namen für das Projekt. Wie wäre es zum Beispiel mit "IPW: Quantitative Text Analyse"?

Öffnet jetzt ein neues R-Skript und speichert es sofort (wählt in der Symbolleiste oben links Datei `->` Speichern oder drückt Ctrl + S (Mac: Command + S)). Nennt die Datei "r\_basics".

In der rechten unteren Ecke, unter dem Reiter "Dateien", seht ihr nun die dem Projekt hinzugefügte Datei. Die Erweiterung .R zeigt an, dass es sich bei der Datei um ein `R`-Skript handelt.

# 3. Erste (gewollte) Überforderung: Textanalyse in R

Um euch einen Vorgeschmack auf einige der interessanteren Dinge zu geben, die wir in diesem Seminar machen werden, werdet ihr jetzt ein Projekt zur Analyse von Texten mit dem **quanteda**-Paket einrichten.

Im Moment ist es weniger wichtig zu verstehen, was jede einzelne Codezeile tut, sondern das ihr ein Gefühl für die Arbeit mit `R` bekommt. Außerdem sollt ihr erste Einblicke bekommen, wie man mit Computern Texte analysieren kann.

### 3.1. Installieren und Laden des Quanteda-Pakets

Wie bereits erwähnt, ist eine der Stärken an `R` das Nutzen von Paketen. In diesem Fall werden wir das Paket **quanteda** verwenden. Quanteda ist ein Paket zur automatischen Textanalyse (mehr Infos: <https://quanteda.io/>).

Viele `R`-Pakete befinden sich im CRAN-Netzwerk. Das ermöglicht es uns, ein neues Paket sicher und einfach aus `R` heraus herunterzuladen und zu installieren. Wir brauchen nur eine einzige Zeile Code auszuführen. Zum Beispiel installiert die folgende Codezeile das ggplot2-Paket, welche die Möglichkeiten der Datenvisualisierung in `R` erweitert.

``` r
install.packages('ggplot2')
```

Meistens können die Pakete ohne Probleme installiert werden. Es gibt jedoch einige Ausnahmen. Für quanteda zum Beispiel, sind bestimmte Software notwendig, die eventuell nicht Vor-Installiert sind. Um das auszuschließen, stellt sicher, dass ihr die `R` Version 4.0.0 (oder höher) installiert habt. Um die verwendete Version zu überprüfen, gebt `version` in eure Konsole (unten links) ein. Falls ihr ein Update durchführen müsst, besucht die `R`-Website (siehe oben).

MacOS-Benutzer erhalten möglicherweise die Frage, ob das Paket aus dem Quellcode installieren werden soll. In diesem Fall solltet ihr "n" oder "nein" in die Konsole eingeben ("ja" funktioniert nur, wenn bestimmte Software installiert ist).

Installiert jetzt das quanteda-Paket mit dem folgenden Code:

``` r
install.packages('quanteda')
```

Nach der Fertigstellung wurde das Paket auf dem Computer installiert. Ihr braucht diesen Befehl also nicht zu wiederholen (außer ihr wechselt euren Computer).

Um quanteda in einem R-Skript zu verwenden, müsst ihr R jedoch explizit mitteilen, dass das Paket geladen werden soll. Dazu nutzt den folgenden Befehl:

``` r
library(quanteda)
```

### 3.2. Der erste Kontakt: Die Antrittsreden der US Präsidenten

In der Quantitativen Textanalyse wird häufig der Begriff Korpus oder Corpus verwendet. Dieser Begriff bezeichnet eine Sammlung von Texten. Für dieses Tutorial wird ein Demo-Korpus verwendet, der die die Antrittsreden der US-Präsidenten enhält und bei der Installation von quanteda mitgeliefert wird. Im quanteda-Paket führt der Korpus den Namen `data_corpus_inaugural`.

Um mit dem Korpus arbeiten zu können, müssen wir ihn in unserem Environment / Umfeld als Datenobjekt speichern. Wie ihr bereits wisst, können wir Datensätze mit dem `<-` einen Namen zuordnen und so speicher. Der Einfachheit halber ordnen wir dem Korpus den Namen `corp` zu:

``` r
corp <- data_corpus_inaugural # Da ihr das quanteda-Paket geladen habt (mit library(quanteda)) und dort der Demo-Korpus data_corpus_inaugural gespeichert ist, kann R direkt auf die dort gespeichert Texte zugreifen
corp
```

    ## Corpus consisting of 58 documents and 4 docvars.
    ## 1789-Washington :
    ## "Fellow-Citizens of the Senate and of the House of Representa..."
    ## 
    ## 1793-Washington :
    ## "Fellow citizens, I am again called upon by the voice of my c..."
    ## 
    ## 1797-Adams :
    ## "When it was first perceived, in early times, that no middle ..."
    ## 
    ## 1801-Jefferson :
    ## "Friends and Fellow Citizens: Called upon to undertake the du..."
    ## 
    ## 1805-Jefferson :
    ## "Proceeding, fellow citizens, to that qualification which the..."
    ## 
    ## 1809-Madison :
    ## "Unwilling to depart from examples of the most revered author..."
    ## 
    ## [ reached max_ndoc ... 52 more documents ]

Nach der Ausführung des Codes lässt uns quanteda wissen, dass der Korpus 58 Dokumente und 3 Variablen (soegannte Docvars, Dokumentenvariablen) enthält. Die Docvars sind Variablen über die Dokumente, in diesem Fall der Vor- und Nachname des Präsidenten, das Jahr der Rede und die Partei die der jeweilige Präsident angehörte.

Diese Variablen können wir mit der Funktion `docvars()` einsehen (hier in diesem Tutorial-Dokument sind nur die ersten Zeilen des Outputs zu sehen. Auf eurem eigenen Computer werdet ihr einen deutlich detalliertern Output in der Console angezeigt bekommen.)

``` r
docvars(corp) 
```

    ##    Year  President       FirstName                 Party
    ## 1  1789 Washington          George                  none
    ## 2  1793 Washington          George                  none
    ## 3  1797      Adams            John            Federalist
    ## 4  1801  Jefferson          Thomas Democratic-Republican
    ## 5  1805  Jefferson          Thomas Democratic-Republican
    ## 6  1809    Madison           James Democratic-Republican
    ## 7  1813    Madison           James Democratic-Republican
    ## 8  1817     Monroe           James Democratic-Republican
    ## 9  1821     Monroe           James Democratic-Republican
    ## 10 1825      Adams     John Quincy Democratic-Republican
    ## 11 1829    Jackson          Andrew            Democratic
    ## 12 1833    Jackson          Andrew            Democratic
    ## 13 1837  Van Buren          Martin            Democratic
    ## 14 1841   Harrison   William Henry                  Whig
    ## 15 1845       Polk      James Knox                  Whig
    ## 16 1849     Taylor         Zachary                  Whig
    ## 17 1853     Pierce        Franklin            Democratic
    ## 18 1857   Buchanan           James            Democratic
    ## 19 1861    Lincoln         Abraham            Republican
    ## 20 1865    Lincoln         Abraham            Republican
    ## 21 1869      Grant      Ulysses S.            Republican
    ## 22 1873      Grant      Ulysses S.            Republican
    ## 23 1877      Hayes   Rutherford B.            Republican
    ## 24 1881   Garfield        James A.            Republican
    ## 25 1885  Cleveland          Grover            Democratic
    ## 26 1889   Harrison        Benjamin            Republican
    ## 27 1893  Cleveland          Grover            Democratic
    ## 28 1897   McKinley         William            Republican
    ## 29 1901   McKinley         William            Republican
    ## 30 1905  Roosevelt        Theodore            Republican
    ## 31 1909       Taft  William Howard            Republican
    ## 32 1913     Wilson         Woodrow            Democratic
    ## 33 1917     Wilson         Woodrow            Democratic
    ## 34 1921    Harding       Warren G.            Republican
    ## 35 1925   Coolidge          Calvin            Republican
    ## 36 1929     Hoover         Herbert            Republican
    ## 37 1933  Roosevelt     Franklin D.            Democratic
    ## 38 1937  Roosevelt     Franklin D.            Democratic
    ## 39 1941  Roosevelt     Franklin D.            Democratic
    ## 40 1945  Roosevelt     Franklin D.            Democratic
    ## 41 1949     Truman        Harry S.            Democratic
    ## 42 1953 Eisenhower       Dwight D.            Republican
    ## 43 1957 Eisenhower       Dwight D.            Republican
    ## 44 1961    Kennedy         John F.            Democratic
    ## 45 1965    Johnson   Lyndon Baines            Democratic
    ## 46 1969      Nixon Richard Milhous            Republican
    ## 47 1973      Nixon Richard Milhous            Republican
    ## 48 1977     Carter           Jimmy            Democratic
    ## 49 1981     Reagan          Ronald            Republican
    ## 50 1985     Reagan          Ronald            Republican
    ## 51 1989       Bush          George            Republican
    ## 52 1993    Clinton            Bill            Democratic
    ## 53 1997    Clinton            Bill            Democratic
    ## 54 2001       Bush       George W.            Republican
    ## 55 2005       Bush       George W.            Republican
    ## 56 2009      Obama          Barack            Democratic
    ## 57 2013      Obama          Barack            Democratic
    ## 58 2017      Trump       Donald J.            Republican

### 3.3. Die Document-Term-Matrix

Damit wir Texte mit unserem Computer analysieren zu können, müssen wir die Textdaten so transformieren, dass wir Berechnungen durchführen können. Die Transformation von Texten in eine **Document-Term-Matrix** (DTM) nimmt hier eine zentrale Position ein. Dabei handelt es sich um eine Matrix, in der die Dokumente in den Zeilen dargestellt werden. Die Begriffe/Wörter werden den Spalten zugeordnet, die somit angeben wie oft jeder Begriff/jedes Wort in jedem Dokument vorkommt.

Dies wird auch als **"Bag-of-Words"**-Darstellung von Texten bezeichnet (mehr dazu in den kommenden Sitzungen), da Dokumente nur auf Worthäufigkeiten reduziert wurden (die Matrix zeigt nur an, wie oft ein Wort in einem Text vorkommt). Während dieses Format viele wichtige Informationen bezüglich der Wortstellung und der Syntax ignoriert, hat die Forschung gezeigt, dass viele interessante Elemente von Texten allein durch die Betrachtung der Worthäufigkeiten gemessen werden können.

Wenn wir eine DTM erstellen, gibt es einige Standardtechniken zur Vorverarbeitung der Daten. Konkret wollen wir Wörter herausfiltern, die nicht interessant sind, wie z.B. Stoppwörter (z.B. der, die, das, wer, wie, was). Außerdem wollen wir zum Beispiel alle Großbuchstaben zu Kleinbuchstaben transformieren, Sonderzeichen (z.B. @ oder \#), Interpunktion und Zahlen entfernen und vieles mehr (mehr dazu in den kommenden Sitzungen).

Für dieses Tutorial werden wir alle Buchstaben in Kleinbuchstaben transformieren (*tolower*), englische Stoppwörter (*remove = stopwords('english')*) und die Interpunktion entfernen (*remove\_punct = TRUE*). Wir werden die `dfm`-Funktion aus dem quanteda-Paket verwenden. DFM steht für **Document Feature Matrix**, was eine allgemeinere Form einer Document-Term-Matrix ist (ein Merkmal kann ein Begriff sein, aber auch andere Dinge). Wir ordnen der Matrix den namen `speeches` zu:

``` r
speeches <- dfm(corp, tolower = TRUE, remove = stopwords('english'), remove_punct = TRUE)
speeches
```

    ## Document-feature matrix of: 58 documents, 9,210 features (92.6% sparse) and 4 docvars.
    ##                  features
    ## docs              fellow-citizens senate house representatives among
    ##   1789-Washington               1      1     2               2     1
    ##   1793-Washington               0      0     0               0     0
    ##   1797-Adams                    3      1     0               2     4
    ##   1801-Jefferson                2      0     0               0     1
    ##   1805-Jefferson                0      0     0               0     7
    ##   1809-Madison                  1      0     0               0     0
    ##                  features
    ## docs              vicissitudes incident life event filled
    ##   1789-Washington            1        1    1     2      1
    ##   1793-Washington            0        0    0     0      0
    ##   1797-Adams                 0        0    2     0      0
    ##   1801-Jefferson             0        0    1     0      0
    ##   1805-Jefferson             0        0    2     0      0
    ##   1809-Madison               0        0    1     0      1
    ## [ reached max_ndoc ... 52 more documents, reached max_nfeat ... 9,200 more features ]

Wir haben jetzt eine DTM mit 58 Dokumenten und 5.405 Begriffen. Die DTM ist zu 89,2% *sparse*, was bedeutet, dass 89,2% der Zellen in der DTM den Wert Null haben. Eine Null ensteht, wenn ein Wort nicht in einem Dokument auftaucht. Dieser Wert ist normal, weil einzelne Dokumente (Reihen) nur einen kleinen Teil aller Wörter die in den Dokumenten verwendet wurden (Spalten) enthalten.

Die gesamte DTM ist ziemlich groß und unübersichtlich. Mit der folgenden Codezeile lassen wir uns nur eine Teilmenge ausgeben. Die ersten 10 Dokumente und deren erste 10 Begriffe:

``` r
speeches[1:10,1:10]
```

    ## Document-feature matrix of: 10 documents, 10 features (60.0% sparse) and 4 docvars.
    ##                  features
    ## docs              fellow-citizens senate house representatives among
    ##   1789-Washington               1      1     2               2     1
    ##   1793-Washington               0      0     0               0     0
    ##   1797-Adams                    3      1     0               2     4
    ##   1801-Jefferson                2      0     0               0     1
    ##   1805-Jefferson                0      0     0               0     7
    ##   1809-Madison                  1      0     0               0     0
    ##                  features
    ## docs              vicissitudes incident life event filled
    ##   1789-Washington            1        1    1     2      1
    ##   1793-Washington            0        0    0     0      0
    ##   1797-Adams                 0        0    2     0      0
    ##   1801-Jefferson             0        0    1     0      0
    ##   1805-Jefferson             0        0    2     0      0
    ##   1809-Madison               0        0    1     0      1
    ## [ reached max_ndoc ... 4 more documents ]

Wir sehen hier zum Beispiel, dass das Wort "senat", einmal in der Rede von George Washington aus dem Jahr 1789 und einmal in der Rede von John Adams aus dem Jahr 1797 vorkommt.

### 3.4. Word clouds

Um eine grundlegende Vorstellung davon zu bekommen, worüber die US Präsidenten gesprochen haben, können wir mit der quanteda-Funktion `textplot_wordcloud()` eine Word cloud erstellen. Das Hauptargument für diese Funktion ist die von uns erstellte DTM. Als zusätzliches Argument setzen wir `min_count` (die minimale Wortanzahl) auf 50, um alle Wörter zu ignorieren, die weniger als 50 Mal in den Reden benutzt wurden.

``` r
textplot_wordcloud(speeches, min_count = 50)
```

![](R_First_Steps_files/figure-markdown_github/unnamed-chunk-12-1.png)

Das können noch etwas verbessern. Zum Beispiel können wir die Anzahl der Reden verringern und nur Reden nach 1945 oder nur die Reden von Obama als Grundlage der Darstellung verwenden:

``` r
m_obama <-  dfm_subset(speeches, President=="Obama")
m_postwar <-  dfm_subset(m_obama, Year > 1945)
```

Beachtet bitte, dass dadurch nicht andere Jahre oder Präsidenten aus unserer bestehenden DTM gelöscht wurden, sondern zwei neue DTMs `m_obama` und `m_postwar` erstellt wurden. Diese neuen DTMs enhalten jetzt die von uns ausgewählten Reden (alle nach 45 und nur die von Obama). Lasst uns eine davon darstellen! Zusätzlich zur Wortgröße verwenden wir jetzt auch Farben, um die Unterschiede in der Worthäufigkeit hervorzuheben. Der Befehl `max_words = 100` begrenzt die Anzahl der angezeigten Wörter in der word cloud auf 100 (das vereinfacht die Dartstellung nochmals).

``` r
textplot_wordcloud(m_postwar, max_words = 100, 
                   color = c('lightblue', 'skyblue2','purple3', 'purple4','darkred'))
```

![](R_First_Steps_files/figure-markdown_github/unnamed-chunk-14-1.png)

Nutzt jetzt die verschiedenen DTMs und versucht euch eigenständig an die Erstellung einer Word cloud oder anderen Darstellungsmöglichkeiten. Nutz dafür die Google Suche und findet weitere Darstellungsmöglichkeiten heraus (am besten mit dem Präfix `R` oder in diesem Fall noch passender `quanteda`).

### 3.5. Keyword in context

Die Word cloud stellt die Wörter dar, die am häufigsten vorkommen. Es fehlt aber natürlich der Textkontext. Um eine Vorstellung von dem Kontext zu erhalten, in dem die Wörter verwendet werden, kann die **Keyword in context** (kwic) Methode hilfreich sein.

In quanteda könnt ihr die `kwic()`-Funktion ganz einfach auf das Korpusobjekt `corp` anwenden (für den Textkontext hilt die DTM nicht weiter, da hier jedliche Satzstruktur aufgebrochen wurde).

Hierfür müssen wir lediglich ein Wort das uns interessiert einfügen. Nehmen wir als Beispiel das Wort "Terror". Der angezeigte Output zeigt die Textstellen vor und nach dem definierten Keyword an. Wie viele Wörter vor und nach dem Keyword angezeigt werden definieren wir mit dem Argument `window =`.

``` r
kwic(corp, pattern ="terror", window = 10) # "pattern =" definiert das Wort und "window =" die Anzahl der "Kontextwörter" die vor und nach dem Wort angezeigt werden sollen.
```

    ##                       
    ##     [1797-Adams, 1324]
    ##  [1933-Roosevelt, 111]
    ##  [1941-Roosevelt, 285]
    ##    [1961-Kennedy, 850]
    ##     [1981-Reagan, 811]
    ##   [1997-Clinton, 1047]
    ##   [1997-Clinton, 1647]
    ##     [2009-Obama, 1619]
    ##                                                                        
    ##                flattery or menaces, by fraud or violence, by | terror |
    ##      fear is fear itself- nameless, unreasoning, unjustified | terror |
    ##      the life of this Republic seemed frozen by a fatalistic | terror |
    ##         , yet both racing to alter that uncertain balance of | terror |
    ##  work. Ending inflation means freeing all Americans from the | terror |
    ##            They plague us still. They fuel the fanaticism of | terror |
    ##     peace and freedom, and maintain a strong defense against | terror |
    ##         for those who seek to advance their aims by inducing | terror |
    ##                                                                 
    ##  , intrigue, or venality, the Government may not                
    ##  which paralyzes needed efforts to convert retreat into advance.
    ##  , we proved that this is not true. We                          
    ##  that stays the hand of mankind's final war. So                 
    ##  of runaway living costs. All must share in the                 
    ##  . And they torment the lives of millions in fractured          
    ##  and destruction. Our children will sleep free from the         
    ##  and slaughtering innocents, we say to you now that

Für die KWIC-Methode verwenden wir den den Korpus (corp) und nicht die DTM, da die DTM nicht mehr über Informationen zur Wortfolge verfügt (sie kann also keinen Kontext anzeigen).

Um eine KWIC-Liste für eine Teilmenge von Dokumenten, z.B. nur die Reden Obamas, zu erhalten, müssen wir den Befehl `corpus_subset` verwenden. So können wir die Reden von Obama identifizieren:

``` r
corp_obama <-  corpus_subset(corp, President == "Obama") # Hier subsetten wir den gesamten Korpus und wählen nur die Reden von Obama aus. 
kwic(corp_obama, pattern ="economy", window = 10) # Hier wenden wir die kwic-Funktion auf das Obama-subset an und wollen uns den Kontext (10 Wörter vor und nach) das Keywords "economy" anzeigen lassen.
```

    ##                                                                               
    ##   [2009-Obama, 188] against a far-reaching network of violence and hatred. Our
    ##   [2009-Obama, 840]                       is work to be done. The state of our
    ##  [2009-Obama, 1238]          it favors only the prosperous. The success of our
    ##   [2013-Obama, 317]    forward together. Together, we determined that a modern
    ##                                                                            
    ##  | economy | is badly weakened, a consequence of greed and irresponsibility
    ##  | economy | calls for action, bold and swift, and we                      
    ##  | economy | has always depended not just on the size of our               
    ##  | economy | requires railroads and highways to speed travel and commerce,

### 3.6. Korpus-Vergleich

Sind wir jetzt daran interessiert zwei Dokumenten-Korpora zu vergleichen, dann bietet sich in einem ersten Schritt der Vergleich der Worthäufigkeiten an. Zum Beispiel können wir so die Wörter in den Antrittsreden der US Präsidenten identifizieren, welche in der Rede von Obama unterrepräsentiert sind.

``` r
tk <-  textstat_keyness(speeches, docvars(speeches, 'President') == "Obama")
textplot_keyness(tk, show_legend = F)
```

![](R_First_Steps_files/figure-markdown_github/unnamed-chunk-17-1.png)

In diesem Plot/dieser Graphik sehen wir 20 Begriffe, die in Obamas Reden überrepräsentiert sind. Dies sind die Top 20 Begriffe mit den blauen Balken. Am stärksten überrepräsentiert sind die Begriffe "journey", "generat(ion)", "job" und "creed". Die 20 Begriffe mit den grauen Balken sind die unterrepräsentierten Begriffe. Über- bzw. Unterrepräsentation bezieht sich in diesem Beispiel auf die relative Häufigkeit der Begriffe in allen 58 Reden des Korpus.
