Erste Schritte mit \`quanteda: Textdaten importieren, einen Korpus erstellen und Dokumentenvariablen hinzufügen
================
Philipp Meyer, Institut für Politikwissenschaft
28.04.2021, QTA Annahmen und Anwendungen, Seminar: Quantitative Textanalyse

-   [1. Einleitung](#einleitung)
-   [2. Installation und Laden der relevanten R-Pakete](#installation-und-laden-der-relevanten-r-pakete)
-   [3. Einlesen von Textdaten](#einlesen-von-textdaten)
-   [3. Dokumentenvariablen bzw. Metavariablen](#dokumentenvariablen-bzw.-metavariablen)
-   [4. Einen Korpus erstellen](#einen-korpus-erstellen)
    -   [4.1. Grundlegende Statistiken zum Korpus](#grundlegende-statistiken-zum-korpus)
    -   [4.2. Arbeiten mit dem Korpus](#arbeiten-mit-dem-korpus)

# 1. Einleitung

Heute werdet ihr die ersten Schritte für eine Textanalyse mit dem quanteda-Paket lernen. In dem ersten Seminar-Tutorial zu den Grundlagen von `R` habt ihr bereits einige der nun folgenden Techniken vorgestellt bekommen.

In diesem Dokument werden wir vor allem drei Aspekte besprechen: das Einlesen von Textdaten in R, das Erstellen eines Korpus, und das Hinzufügen von Variablen.

# 2. Installation und Laden der relevanten R-Pakete

Für dieses Tutorial benötigen wir vor allem [`quanteda`](https://quanteda.io/), [`readtext`](https://www.rdocumentation.org/packages/readtext/versions/0.50/topics/readtext) und [`tidyverse`](https://www.tidyverse.org/)

``` r
install.packages("tidyverse") # nur einmal notwendig. Beachtet: beim Installieren von Paketen müsst ihr Anführungszeichen verwenden. R ist case-sensitive und die Pakete müssen für die Installation spezifisch angesprochen werden.
install.packages("quanteda")
install.packages("readtext")
```

``` r
library(tidyverse) 
library(quanteda)
library(readtext)
library(ggplot2)
```

Andere Pakete, die im Laufe dieses Seminars noch eine wichtige Rolle spielen werden sind u.a. [`topicmodels`](https://cran.r-project.org/web/packages/topicmodels/index.html) und [`stm`](https://www.structuraltopicmodel.com/) (Themenmodelle), [`RTextTools`](http://www.rtexttools.com/) (überwachtes maschinelles Lernen), und [`spacyr`](https://github.com/quanteda/spacyr) (POS-Tagging und Named-Entity-Erkennung).

# 3. Einlesen von Textdaten

Textdaten für die Arbeit mit `quanteda` werden mit der Funktion `readtext()` us dem gleichnamigen Paket eingelesen. Eine sehr ausführliche Einführung zu den Funktionalitäten und der Anwendung von `readtext` findet ihr in der offiziellen Vignette des Paktes: <https://cran.r-project.org/web/packages/readtext/vignettes/readtext_vignette.html>.

Mit `readtext` lassen sich eine ganze Bandbreite von unterschiedlichen Dateiformaten importieren (u.a. txt, PDF, csv und auch Word-Dateien). Grundsätzlich sind aber Plaintext-Dateien (in der Regel mit der Endung ".txt" versehen) und Daten in Tabellenform (csv Dateien oder auch Excel-Dateien) zu bevorzugen und für `readtext` auch kein Problem. Bei (Text)Daten aus Tabellen ist es jedoch wichtig genau zu definieren. welche Felder die Primär-(also Text-) und welche die Metadaten beinhalten.

Für **dieses und alle weiteren Tutorial** lesen wir alle Entscheidungen des Bundesverfassungsgerichts der Jahr 2015-2019 ein. **Die Textdaten könnt ihr hier herunterladen: <https://phimeyer.github.io/teaching/bverfg_15-19.zip>**.

Sobald ihr die ZIP-Datei entpackt habt, könnt ihr sehen, dass jede Datei einem Text entspricht. Das macht den Import sehr umkompliziert. Letztlich müssen wir lediglich die Computerpfad kopieren und damit `R` mitteilen, wo es die zu importierenden Texte findet ("bverfg\_15-19" ist der letzte Ordner in dieser Befehlskette. Dort befinden sich die einzelnen txt.Dateien):

``` r
daten_bverfg <- readtext("/Users/PhMeyer/Seafile/Seafile/Meine Bibliothek/Lehre/Seminare Uni Hannover/12 SoSe 2021/Quantitative Textanalyse/data/bverfg_15-19")
head(daten_bverfg)
```

    ## readtext object consisting of 6 documents and 0 docvars.
    ## # Description: df[,2] [6 × 2]
    ##   doc_id                  text                  
    ## * <chr>                   <chr>                 
    ## 1 20150108_2bvr241913.txt "\"\n      \n\n \"..."
    ## 2 20150112_2bvq005314.txt "\"\n      \n\n \"..."
    ## 3 20150113_1bvr047214.txt "\"\n      \n\n \"..."
    ## 4 20150113_1bvr332314.txt "\"\n      \n\n \"..."
    ## 5 20150113_2bve000113.txt "\"\n      \n\n \"..."
    ## 6 20150113_2bvr239514.txt "\"\n      \n\n \"..."

Wenn alles geklappt hat, dann solltet ihr jetzt den Datensatz `daten_bverfg` rechts oben in eurem Environment finden und sehen, dass er 1616 Beobachtungen und zwei Variablen aufweist.

# 3. Dokumentenvariablen bzw. Metavariablen

Dieser Datensatz ist noch sehr roh und hat, wie gesagt, nur zwei Variablen: doc\_id und text. Die erste der beiden, `doc_id`, ist lediglich der Name der Dateien. Die zweite Variable beinhaltet die Volltexte aus den Dateien. Die ganzen `\n` die ihr dort seht machen nicht den textuellen Inhalt aus. Das sind im Grund html-Befehle, die Anzeigen das ein neuer Absatz gemacht wird. Der Grund dafür ist die Herkunft der Dateien, welche direkt von der Internetseite des Bundesverfassungsgerichts heruntergeladen wurden.

Wie auch immer, diese beiden Variablen sind natürlich nicht annnähernd aussreichend für unsere Bedürfnisse. Zum Glück können wir bereits beim Einlesen der Textdaten zwei weitere Variablen erstellen. Wie ihr in der `doc_id` Variable seht, bestehen die Dateinamen aus zwei Aspekten die mit einem Unterstrich getrennt wurden: 1) einem Datum und 2) einem Aktenzeichen (das Gericht gibt jeder Entscheidung ein Aktenzeichen), welches den jeweiligen Senat und Verfahrensart angibt (z.B. 2bvr bedeutet, dass der zweite Senat des Gerichts die Entscheidung getroffen hat und das die Entscheidung eine Verfassungsbeschwerde war). Diese beiden Aspekte können wir verwenden um weitere Variablen zu erstellen (kontrolliert bitte `?readtext` um die Argumente von `readtext` zu erlernen). Dafür nutzen wir die Argumente `docvarsfrom` und `docvarnames`.

``` r
daten_bverfg <- readtext("/Users/PhMeyer/Seafile/Seafile/Meine Bibliothek/Lehre/Seminare Uni Hannover/12 SoSe 2021/Quantitative Textanalyse/data/bverfg_15-19",
                         docvarsfrom = "filenames", docvarnames = c("date","docket_nr"))
head(daten_bverfg)
```

    ## readtext object consisting of 6 documents and 2 docvars.
    ## # Description: df[,4] [6 × 4]
    ##   doc_id                  text                       date docket_nr 
    ## * <chr>                   <chr>                     <int> <chr>     
    ## 1 20150108_2bvr241913.txt "\"\n      \n\n \"..." 20150108 2bvr241913
    ## 2 20150112_2bvq005314.txt "\"\n      \n\n \"..." 20150112 2bvq005314
    ## 3 20150113_1bvr047214.txt "\"\n      \n\n \"..." 20150113 1bvr047214
    ## 4 20150113_1bvr332314.txt "\"\n      \n\n \"..." 20150113 1bvr332314
    ## 5 20150113_2bve000113.txt "\"\n      \n\n \"..." 20150113 2bve000113
    ## 6 20150113_2bvr239514.txt "\"\n      \n\n \"..." 20150113 2bvr239514

Wie ihr seht erkennt `readtext` durch diese Argumente die Struktur der Dateiennamne und parst sie dementsprechend. Unsere Aufgabe war es im Grunde nur, passende Variablennamen (`docvarnames`) zu definieren.

**Hinweis**: Dieses Beispiel zeigt wie wichtig es ist, den Textdateien die man analysieren möchte funkionale Dateinamen zu geben.

So weit so gut! Aber wir können natürlich noch weitere inhaltliche Metadaten erstellen. Zum Beispiel können wir die `date`-Variable weiter aufspalten um das Jahr und Monat als einzelne Variable zu haben. Weiterhin können wir den jeweiligen Senat und den Verfahrenstyp extrahieren. Für diese Aufgabe verwenden wir die `base R`-Funktion [`substr`](https://www.rdocumentation.org/packages/base/versions/3.6.2/topics/substr) (wie immer: checkt die Dokumentation der Funktion mit `?`!!):

``` r
daten_bverfg$year <-  substr(daten_bverfg$date, 1,4) # Ich sage R, dass es doch bitte die ersten vier Elemente von "date" (1,4) in die neue Variable "year" einfügen soll
daten_bverfg$year <-  as.numeric(daten_bverfg$year) # Da "str_extract" eine character Variable erstellt, sagen wir R hier das es daraus eine numerische Varibale machen soll

daten_bverfg$month <-  substr(daten_bverfg$date, 5,6) 
daten_bverfg$month <-  as.numeric(daten_bverfg$month) 

daten_bverfg$senat <- substr(daten_bverfg$docket_nr, 1,1) # substr brauch einen Anfangswert und einen Endwert. Da wir her lediglich die erste Ziffer aus "docket_nr" brauchen, sagen wir der Funktion  das sie auf Position 1 starten und enden soll
daten_bverfg$senat  <-  as.numeric(daten_bverfg$senat)

daten_bverfg$proceeding <- substr(daten_bverfg$docket_nr, 2,4) 
```

Schauen wir uns den Datensatz mal an:

``` r
head(daten_bverfg)
```

    ## readtext object consisting of 6 documents and 6 docvars.
    ## # Description: df[,8] [6 × 8]
    ##   doc_id           text              date docket_nr  year month senat proceeding
    ## * <chr>            <chr>            <int> <chr>     <dbl> <dbl> <dbl> <chr>     
    ## 1 20150108_2bvr24… "\"\n      \n…  2.02e7 2bvr2419…  2015     1     2 bvr       
    ## 2 20150112_2bvq00… "\"\n      \n…  2.02e7 2bvq0053…  2015     1     2 bvq       
    ## 3 20150113_1bvr04… "\"\n      \n…  2.02e7 1bvr0472…  2015     1     1 bvr       
    ## 4 20150113_1bvr33… "\"\n      \n…  2.02e7 1bvr3323…  2015     1     1 bvr       
    ## 5 20150113_2bve00… "\"\n      \n…  2.02e7 2bve0001…  2015     1     2 bve       
    ## 6 20150113_2bvr23… "\"\n      \n…  2.02e7 2bvr2395…  2015     1     2 bvr

# 4. Einen Korpus erstellen

Jetzt haben wir einen Datensatz mit insgeamt sieben Variablen, wovon mindestens drei auch für weitere inhaltlische Analysen verwendet werden können. Um jedoch eine Textanalyse durchführen zu können, müssen wir einen [Textkorpus](https://tutorials.quanteda.io/basic-operations/corpus/corpus/) erstellen. Hierfür gibt es in `quanteda` die Funktion `corpus`:

``` r
gerichts_korpus <- corpus(daten_bverfg,docid_field = "doc_id") # mit docid_field definieren wir die Identifikationsnummer eines jeden Texts
gerichts_korpus
```

    ## Corpus consisting of 1,616 documents and 6 docvars.
    ## 20150108_2bvr241913.txt :
    ## "                                                            ..."
    ## 
    ## 20150112_2bvq005314.txt :
    ## "                                                            ..."
    ## 
    ## 20150113_1bvr047214.txt :
    ## "                                                            ..."
    ## 
    ## 20150113_1bvr332314.txt :
    ## "                                                            ..."
    ## 
    ## 20150113_2bve000113.txt :
    ## "                                                            ..."
    ## 
    ## 20150113_2bvr239514.txt :
    ## "                                                            ..."
    ## 
    ## [ reached max_ndoc ... 1,610 more documents ]

Mit den `quanteda`-Funktionen `ndoc`, `ntoken`, `ntype` und `nsentence` können wir die Anzahl der Dokumente, Tokens, Types und Sätze identifizieren. Die wir `R`-Nutzer aber eher faul sind, nutzen wir die `summary`-Funktion um diese Statistiken zu erstellen.

``` r
korpus_stats <- summary(gerichts_korpus, n = 1000000) # Das Funktionsargument n = 1000000 wird hier nur deshalb verwendet, weil die Funktion summary ansonsten nur maximal 100 Texte zusammenfasst.
head(korpus_stats)
```

    ##                      Text Types Tokens Sentences     date  docket_nr year month
    ## 1 20150108_2bvr241913.txt   703   1849       103 20150108 2bvr241913 2015     1
    ## 2 20150112_2bvq005314.txt   149    268        15 20150112 2bvq005314 2015     1
    ## 3 20150113_1bvr047214.txt   118    177         8 20150113 1bvr047214 2015     1
    ## 4 20150113_1bvr332314.txt   210    426        26 20150113 1bvr332314 2015     1
    ## 5 20150113_2bve000113.txt   786   2133       104 20150113 2bve000113 2015     1
    ## 6 20150113_2bvr239514.txt   356    976        57 20150113 2bvr239514 2015     1
    ##   senat proceeding
    ## 1     2        bvr
    ## 2     2        bvq
    ## 3     1        bvr
    ## 4     1        bvr
    ## 5     2        bve
    ## 6     2        bvr

Diese Variablen fügen wir jetzt unserem ursprünglichen Metadatensatz hinzu:

``` r
daten_bverfg$types <- korpus_stats$Types
daten_bverfg$tokens <- korpus_stats$Tokens
daten_bverfg$sentences <- korpus_stats$Sentences
```

### 4.1. Grundlegende Statistiken zum Korpus

Die oben gespeicherten Korpusstatistiken lassen sich natürlich auch visualisieren. So bekommt man relativ schnell einen anschaulichen Eindruckl von der Beschaffenheit des Korpus. So werden wir gleich die Anzahl der Tokens, als der laufenden Wörter, die Anzahl der Types, also die einmaligen Wörter, und die Sätze pro Gerichtsentscheidungen visualiseren. Am Ende plotten wir noch das Verhältnis von Typen zu Tokens.

Die Basis aller jetzt folgenden Plots ist unser Datensatz `daten_bverfg`. Um die Plots übersichtlicher zu gestalten, werden wir nur Entscheidungen vom Juni 2019 plotten (das subsetting mit `filter()` haben wir ja bereits gelernt). Natürlich nutzen wir wieder `ggplot`.

``` r
bverfg_19_06 <- filter(daten_bverfg, year == 2019 & month == 6)
```

``` r
ggplot(bverfg_19_06, aes(doc_id, tokens, group = 1)) + geom_line() + geom_point() + theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1)) + ggtitle("Tokens pro Entscheidung")
```

![](R_quanteda_basics_files/figure-markdown_github/unnamed-chunk-11-1.png)

``` r
ggplot(bverfg_19_06, aes(doc_id, types, group = 1)) + geom_line() + geom_point() + theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1)) + ggtitle("Types pro Entscheidung")
```

![](R_quanteda_basics_files/figure-markdown_github/unnamed-chunk-12-1.png)

``` r
ggplot(bverfg_19_06, aes(doc_id, sentences, group = 1)) + geom_line() + geom_point() + theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust = 1)) + ggtitle("Sätze pro Entscheidung")
```

![](R_quanteda_basics_files/figure-markdown_github/unnamed-chunk-13-1.png)

``` r
ggplot(bverfg_19_06, aes(doc_id, types, group = 1, label = docket_nr)) + geom_smooth(method = "lm", se = FALSE) + geom_text(check_overlap = T) + ggtitle("Typ-Token-Relation pro Entscheidung")
```

![](R_quanteda_basics_files/figure-markdown_github/unnamed-chunk-14-1.png)

Diese Graphen sind nicht wirklich informativ. Wir sehen lediglich, dass die Entscheidung 1 BvR 587/17 deutlich länger ist als die anderen Entscheidungstexte. Natürlicherweise schlägt sich das auf allen drei Ebenen (Tokens, Types, Sätze) nieder. Auch die Typ-Token-Relation ist wenig Aussagekräftig. Nur eines schon einmal vorneweg: über die Typ-Token-Relation lassen sich Rückschlüssen über die Informationsdichte ziehen – dazu später noch mehr.

### 4.2. Arbeiten mit dem Korpus

In `quanteda` lassen sich Korpora leicht samplen und umformen. Auch lassen sich leicht ein paar wichtige Einblicke in die Texte gewinnen. Der folgenden Aufruf zeigt die ersten 1.000 Wörter der ersten Entscheidung in unserem Korpus:

``` r
str_sub(gerichts_korpus[1], start = 1, end = 1000)
```

    ## [1] "\n      \n\n                    \n                    \n                    \n                         \n                        \n                            \n                                \n                                    BUNDESVERFASSUNGSGERICHT \n                                 \n                             \n                         \n                     \n                    \n                         \n                        \n                            \n                                 - 2 BvR 2419/13 - \n                             \n                         \n                     \n                    \n                         \n                        \n                            \n                                 In dem Verfahren  über  die Verfassungsbeschwerde \n                             \n                         \n                     \n                    \n                         \n                        \n                             \n                            \n                "

Jede Entscheidung und damit jeder Text lässt mittels seiner Indizierung identifizieren (gerichts\_korpus\[1\]). Der Nachteil ist aber, dass ihr, sobald ihr einen speziellen Text sehen wollt genau wissen müsst an welcher Stelle diese steht.

Die Funktion `corpus_reshape` hilft euch dabei euren Korpus umzuformen. So können wir z.B. aus jedem Satz ein Dokument machen oder aber aus jedem Absatz. Diese Satz-Korpora werden z.B. bei Sentimentanalysen wichtig.

``` r
gerichts_saetze <- corpus_reshape(gerichts_korpus, to = "sentences") # welche Argumente ihr mit "to =" definieren könnt findet ihr mit ?corpus_reshape heraus
gerichts_saetze[1]
```

    ## Corpus consisting of 1 document and 6 docvars.
    ## 20150108_2bvr241913.txt :
    ## "BUNDESVERFASSUNGSGERICHT                                    ..."

Mit der Funktion `corpus_sample()` könnt ihr kein zufälliges Sample aus eurem Korpus ziehen:

``` r
zufallsrecht <- corpus_sample(gerichts_saetze, size = 1)
zufallsrecht[1]
```

    ## Corpus consisting of 1 document and 6 docvars.
    ## 20170712_1bvr222212.txt :
    ## "; Schöbener, VerwArch 91 (2000), S. 374 <385 ff."

Schließlich lassen sich Korpora mithilfe von \`corpus\_segment() auch nach bestimmten Kriterien aufspalten.

Wir ihr an den ganzen Beispielen sehen könnt, müssen wir an den Texten von vieles verändern, damit wir auch wirklich zu der eigentlichen Inhaltsanalyse kommen. So müssen wir z.B. die ganzen Sonderzeichen entfernen, die Leerzeichen und Absäztze (vor allem die `\n`) entfernen und so weiter. All diese Dinge und noch viel mehr werden wir kommende Woche machen.
