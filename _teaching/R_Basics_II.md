Einführung in `R`: Wiederholung von Befehlen, Objekten und Funktionen
================
Philipp Meyer, Institut für Politikwissenschaft
21.04.2021, Grundlagen, Seminar: Quantitative Textanalyse

-   [1. Einleitung](#einleitung)
-   [2. Befehle](#befehle)
-   [3. Werte, Daten und Objekte](#werte-daten-und-objekte)
-   [4. Funktionen](#funktionen)
-   [5. Weitere Argumente](#weitere-argumente)

# 1. Einleitung

Dieses Tutorial wiederholt die `R`-Grundlagen aus der letzten Sitzung. Ihr könnt die einzelnen Schritte in Kapitel 4 des kostenlosen (Online-)Buches *R for Data Science* nachlesen: <https://r4ds.had.co.nz/workflow-basics.html>.

# 2. Befehle

In `R` ist jede Codezeile ein Befehl an euren Computer etwas zu tun oder zu berechnen. Die einfachste Form eines Befehls ist eine mathematische Operation:

``` r
2 + 2
```

    ## [1] 4

(die Zeile \#\# \[1\] 4 ist die Ausgabe des Befehls: der einzelne Wert 4)

Ihr könnt Befehle direkt in die Konsole eingeben (der linke untere Fensterbereich in `RStudio`) und ausführen. Oder aber ihr nutzt ein `R`-Skript, in welchem ihr mehrere Befehle kombinieren und gemeinsam oder einzeln ausführen könnt. Ihr könnt ein Skript ganz einfach mittels des Drop-down Menüs von `RStudio` öffnen \[Datei `->` neue Datei `->` `R`-Skirpt\].

In einem Skript werden Befehle ausgeführt, indem man den Cursor auf die jeweilige Zeile setzt und Strg+Enter (Mac user: Command + Enter) drückt. Natürlich ist es auch möglich mehrere Befehle gleichzeitig auszuführen. Hierfür wählt ihr den gewünschten Code mit der Maus aus (rechte Maustaste + die Maus in die gewünschte Richtung ziehen) und drückt Strg+Enter (Mac user: Command + Enter).

# 3. Werte, Daten und Objekte

Alle Daten und Werte in R werden in sogenannten Objekten gespeichert. Im Grunde ist ein Objekt ein Informationsträger, der von euch mit einen spezifischen Namen versehen wird. Kurz gesagt: Ihr weißt einem Objekt einen Wert zu.

``` r
x <- 2+3
```

In diesem Beispiel speichern wir in dem Objekt "**x**" den Wert "**2+3**"". Ihr könnt euch den aktuellen Wert von x anzeigen lassen, indem ihr x als einzelne Code-Zeile im Skript ausführt:

``` r
x
```

    ## [1] 5

In diesem Fall ist x eine einfache Zahl, aber ein Objekt kann auch ein großer Datensatz oder das Ergebnis eines statistischen Modells sein. Tatsächlich werden alle Daten, die in `R` verwendet werden, als Objekte gespeichert. Deswegen ist die Vergabe von Namen an Objekte eine der zentralen Aufgaben in `R`!

Die Namensvergabe liegt komplett in eurer Hand. `R` ist es egal ob ein Objext *x*, *hannover96* oder *court\_decisions\_2010* heißt. Ein `R`-Skript muss nachvollziehbar sein. Ihr müsst es zu einem späteren Zeitpunkt nachvollziehen und andere müssen es nachvollziehen können, wenn sie eure Ergebnisse reproduzieren wollen. Deswegen solltet ihr immer Namen verwenden, welche einen klaren kontextuellen Bezug haben und nicht zu lang sind (in `R` will man den Schreibaufwand so gut es geht verringern). Natürlich könnt ihr auch mehrer Wörter verwenden, die solltet ihr dann mit Unterstichen trennen. Zum Beispiel der Name *brd\_kanzler\_49\_20* gibt Auskunft darüber, dass die gespeicherten Information wohl die BundeskanzlerInnen der BRD umfasst.

# 4. Funktionen

99% von allem, was ihr in `R` machen werdet, wird Funktionen beinhalten. Funktionen sind Befehle, die `R` anweisen, etwas zu tun. In den meisten Fällen benötigt eine Funktion bestimmte Parameter oder Argumente, die angeben, was gemacht werden soll.

Abstrakt stellt man das Aufrufen von Funktionen wie folgt dar:

``` r
result <-  function(argument1, argument2, ...)
```

Eine Funktion wird immer durch den Namen der Funktion aufgerufen. In den meisten Fällen wird das Ergebnis des Funktionsaufrufs dann in einem Objekt (in diesem Fall result) gespeichert

Die Funktion c fasst z. B. mehrere Werte zu einem einzigen Objekt zusammen:

``` r
x <-  c(1,3,5)
x
```

    ## [1] 1 3 5

Jetzt können wir andere Funktionen verwenden um mit diesem Objekt zu arbeiten. Zum Beispiel können wir mit der Funktion `mean()` den Mittelwert des Objekts x ausrechnen, da x ja letztlich nur ein *numeric* Vektor mit einer Länge von 3 ist.

``` r
m <-  mean(x)
m
```

    ## [1] 3

Wir haben hier das neue Objekt m erstellt, um den Mittelwert von x zu speichern. Dabei verlieren wir die die Originalinformationen von x nicht. Wenn ihr mehr über die Funktion `mean()` erfahren wollt, oder über eine andere Funktion, dann könnt ihr ganz einfach die `?function` nutzen:

``` r
?mean
```

# 5. Weitere Argumente

Die meisten Funktionen haben optionale Argumente. Diese beeinflussen die Funktionsweise der Funktionen. Nehmen wir zum Beispiel an, wir haben einen Zahlenbereich, der auch einen fehlenden Wert (NA in `R`, für "nicht verfügbar") enthält:

``` r
x <-  c(1, 3, NA, 5)
```

Wollen wir jetzt den Mittelwert ausrechnen, dann wird uns `R` mitteilen, dass der Mittelwert unbekannt ist. Er kann also nicht ausgerchnet werden, da der dritte Wert des Objekt x unbekannt (NA) ist.

``` r
mean(x)
```

    ## [1] NA

Dies ist statistisch gesehen eine korrekte Antwort. Da wir aber trotzdem den Mittelwert der uns bekannten Werte wissen wollen, soll `R` im folgenden den fehlenden Wert bei der Berechnung des Mittelwerts ignorieren. Um das zu bewerkstelligen verfügt die `mean()`-Funktion über das optionale Argument `na.rm` (remove NAs). Dieses Argument können wir auf TRUE oder T setzen (per default ist es auf FALSE oder F gesetzt), um `mean()` anzuweisen, die NAs zu ignorieren:

``` r
mean(x, na.rm=TRUE)
```

    ## [1] 3

Welche optionalen Argumente eine Funktion besetzt findet ihr in der Dokumentation zu dieser Funktion heraus:

``` r
?mean
```
