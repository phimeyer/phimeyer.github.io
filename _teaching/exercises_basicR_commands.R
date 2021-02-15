# Aufgaben und Übungen zum Erlernen der grundlegenden Aspekte von R

# Hinweis: Wenn ihr die Lösungen nicht direkt habt, dann nutzt gerne die google-Suche. 
# Um erfolgreich mit R zu arbeiten ist die Internetsuche unverzichtbar! 

# Aufgabe 1: Data types

### 1.A
# Weise die Zahl "50" dem Namen "x" zu
# Weise die Zahl "30" dem Namen "y" zu
# Addiere `x` mit `y` 

### 1.B
# Die folgende Code-Zeile weist dem Namen "x" die Zahl "100" als character-Wert zu. Jetzt ...

# ... wandel x in einen numerischen Wert um und ...
# ... multipliziere x mit 2 

x <- "100"

### 1.C
# Der character Vektor "name" ist gegeben. Jetzt ... 
  
# ... transformiere "name" in einen Faktor und ...
# ... lasse dir die Level/Labels von "name" anzeigen.  

name <-  c('Alice','Alice','Alice','Bob','Bob','Carol')


### 1.D
# Der numeric Vektor "alter" ist gegeben. Er enthält das Alter von 10 zufällig ausgewählten Personen.
# Vergleiche die Alterswerte miteinander und generiere einen logischen Wert der zeigt wie viele ...

# ... Personen älter als 18 sind ...
# ... Personen jünger als 21 sind ...
# ... Personen älter als 18 und jünger als 21 sind ...
# ... Personen, die jünger als 18 oder älter als 21 sind. 

alter <-  c(15,16,17,18,19,20,21,22,23,24)


### 1.E
# Füge die richtigen Formate in die folgenden `strptime()` Funktionen ein um die Daten richtig angezeigt zu bekommen. 

## Beispiel:
strptime('1961-12-24', format='%Y-%m-%d')  

## Aufgabe:
strptime('25 12, 1961', format='')

strptime('1961-12-26T19:00:00', format='')


### 1.F

# Fülle das Format in den folgenden `strftime()` Funktionen aus um ...

# Das Jahr zu sagen ...
# Das Jahr und den Tag zu sagen ...
# Die Uhrzeit zu nennen.


x <- strptime('2012/01/01 20:15:00', format='%Y/%m/%d %H:%M:%S')

strftime(x, format='')
strftime(x, format='')
strftime(x, format='')

# Aufgabe 2: Datenstrukturen

### 2.A

# Gebe den character Vektor "x" an und verwende die Auswahl um die folgenden Teilmengen zu erhalten:

# Alle Elemente an den Positionen drei bis zwanzig
# Alle Elemente außer denen an den Positionen drei bis zwanzig
# Die Elemente in umgekehrter Reihenfolge

x <-  letters   # "letters" ist ein in base-R enthaltener Vektor der alle Buchstaben des Alphabets enthält
x[1:5]        # Beispiel

### 2.B

# Berechne den Z-Wert für alle Werte von x

x <-  c(20,10,35,23,27,16,29,35,27,35,25,16,5,12,34,16,25,34,17,37,24,29)
mean(x) # Beispiel zum Berechnen des Mittelwerts von x
sd(x) # Beispiel zum Berechnen der Standardabweichung von x

### 2.C

# Base-R hat einige grundlegenden Datensätze bereits standardmäßig eingebaut. 
# Einer davon ist der berühmte iris-Datensatz (https://en.wikipedia.org/wiki/Iris_flower_data_set). 
# Der Iris-Datensatz beinhaltet Daten über die Länge und Breite der Kelch- und Blütenblätter von drei Schwertlilien-Arten.

# Nutze den Datensatz, "iris" genannt, und ...

# zeige die Reihen in der die "sepal length" (Länge der Kelchblätter) kleiner als 4.5 ist
# zeige die Reihen bei denen die Blütenblätter (petals) mindestens 8-mal länger sind als sie breit sind
# zeige die Spalte für die Kelchblattbreite (sepal width) für die Arten "setosa" und "versicolor"
# Finde die Setosa-Blüten mit einer Kelchblattlänge (sepal length) von höchstens 4,4 und benenne die Art in "sad setosa" um


head(iris)       # zeigt die ersten 6 reihen des iris datensatzes

# Tipp zur Umbenennung: Das Ändern von Faktoren ist mühsam. Das Ändern in character-Vektoren mit "as.character()" ist ein einfacher Ausweg
iris$Species <-  as.character(iris$Species)  


# Aufgabe 3: Funktionen

### 3.A

# Hier erstellen wir zwei Vektoren (V1 und V2). Verwende nun die Funktion "data.frame()", um:

# Erstelle einen data.frame mit den Vektoren V1 und V2 als Spalten, wobei V1 "Alter" und V2 "Geschlecht" heißt. 
# Erzeugen denselben data.frame, aber verwende diesmal Argumente, um zu verhindern, dass R character-strings (in der Variable "Geschlecht") in Faktoren umwandelt
 
V1 <- floor(rnorm(10, mean = 21, sd = 3))            ## zufälliges alter 
V2 <-  sample(c("Männlich","Weiblich"), 10, replace=T)      ## zufällige geschlechter


### 3.B

# Dieses Mal wirst du eine neue Funktion verwenden
# Du solltest also in der Dokumentation nachzuschlagen und die Funktion kennenlernen. 
# Verwende die Funktion "cor.test()", um die Irisdaten zu berechnen:

# Berechne die Korrelation zwischen "Petal.Length" und "Petal.Width", unter Verwendung der default-Einstellungen.
# Berechne die Korrelation zwischen "Petal.Length" und "Petal.Width", aber dieses Mal unter Verwendung der "Spearman"-Korrelationsmethode.

head(iris)         # zeigt die ersten 6 reihen des iris Datensatzes
## Erinnerung: Verwende iris$..., um eine Variable aus dem Datensatz zu nutzen

### 3.C

# Nutze die "paste()" Funktion um:

# Füge Sie die Vektoren "x" und "y" zusammen, getrennt durch einen Punkt (1.a, 2.b, usw.)

# Schau dir außerdem die Dokumentation der Funktion `paste()` an und 
# erkläre (Antwort unter dem Codeblock mit #), was der Unterschied zwischen `paste` und `paste0` ist.  

x <-  1:5
y <-  c('a','b','c','d','e')

