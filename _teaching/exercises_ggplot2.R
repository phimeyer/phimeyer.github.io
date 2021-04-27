# Aufgaben und Übungen zum Umgang mit ggplot2 und Datenvisualisierungen


# Aufgabe: Arbeiten mit ggplot

# Für diesen kurzen Aufgabenblock müsst ihr als erstes Daten herunterladen und mehrere tibble erstellen. 
# Führt zuerst den folgenden Code aus:

library(ggplot2) # Nicht vergessen das Paket zu laden!
library(readr)

csv_folder_url <- "https://raw.githubusercontent.com/houstondatavis/data-jam-august-2016/master/csv"
facts <-  read_csv(paste(csv_folder_url, "county_facts.csv", sep = "/"))
results <-  read_csv(paste(csv_folder_url, "primary_results.csv", sep = "/"))
schedule  <-  read_csv(paste(csv_folder_url, "primary_schedule.csv", sep="/"))

# Aufgabe 1: 

# Repliziere alle Plots die im Tutorial "tidy R: Transformation, Zusammenfassen 
# und Visualisieren von Daten mit tidy" erstellt wurden. 
# Kommentiere deinen Code und stelle damit sicher, dass ein neutraler Dritter deine Schritte versteht. 

# Aufgabe 2: 

# Jetzt nutzen wir neue Daten. Das euch jetzt bereits bekannte Analyseblog "fivethirtyeight" hat auch ein
# eigenes R-Paket. Das installieren wir jetzt als erstes einmal: 

install.packages("fivethirtyeight") # das kann eine kurze Zeit dauern.

# Fivethirtyeight beinhaltet Daten über Filme und den Bechdel test (https://de.wikipedia.org/wiki/Bechdel-Test). 
# Wenn ihr das installierte Paket geladen habt: 

library(fivethirtyeight)

# dann findet ihr die Daten zum Bechdel test wie folgt: 

bechdel <- bechdel # da ihr das Paket mit library geladen hat und das Paket den Datensatz mit dem Namen "bechdel" beinhaltet, weiß R direkt was ihr mit diesem Code meint


# Aufgabe 2.1: Füge dem unten stehenden Code folgende Argumente hinzu: `color`, `size`, `alpha` und `shape`

ggplot(bechdel) +
  geom_point(mapping = aes(x = budget, y = domgross))


# Aufgabe 2.2: Mache aus dem Scatterplot (den der unten stehende Code prodziert) einen Boxplot

ggplot(bechdel) + geom_point(aes(x = clean_test, y = budget))

# Aufgabe 2.3: Erstelle ein Histogramm mit der "budget" Variable aus dem bechdel Datensatz und finde eine passende "bindwidth" für die Variable.

# Aufgabe 2.4: Erstelle einen "density plot" mit der "budget" Variable aus dem bechdel Datensatz. 
# Aufgabe 2.4.1: Füge dem Plot unter der Verwendung der Variable "clean_test" Farben hinzu. 

# Aufgabe 2.5: Speichere den letzten Plot auf deinem örtlichen Laufwerk. Nutze dafür einmal eine Codezeile und ein zweites Mal die Menüfunktionen von RStudio.

