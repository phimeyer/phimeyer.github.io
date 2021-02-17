# Aufgaben und Übungen zum Umgang mit dplyr

# Aufgabe: Arbeiten mit dplyr

# Für diesen kurzen Aufgabenblock müsst ihr als erstes Daten herunterladen und ein tibble erstellen. 
# Führt zuerst den folgenden Code aus: 

url <-  "https://raw.githubusercontent.com/fivethirtyeight/data/master/daily-show-guests/daily_show_guests.csv"
daily <-  read.csv(url)
daily <-  as.data.frame(daily)

# Dieser Datensatz beinhaltet alle Gäste die John Stewart in seine Daily Show eingeladen hat. 

### Aufgabe 1.1.

# Der unten aufgeführte Codeblock spiegelt klassische Analyseschritte in base R wieder. 
# Deine Aufgaben sind folgende: 

# 1) Schreibe den Code neu und nutze dafür Pipes ("%>%")
# 2) Interpretiere die Ergebnisse und schreibe deine Interpretation unter den Codeblock. 
# Schreibe den Text so, das R keine Fehlermeldung produziert.
  
daily_show <- daily
daily_show <-  filter(daily_show, Group == 'Acting')
daily_show <-  group_by(daily_show, YEAR)
daily_show <- summarize(daily_show, N = n())
plot(daily_show, type='l')


# Aufgabe 2.1. 

# Mach etwas interessantes mit den Daten! 
# Spiele herum und probiere dich aus (im Sinne von empirischen Analysen und im Rahmen der gegebenen Daten).

# Nutze pipes um einen klaren und verständlichen Code zu schreiben
# Kommentiere, Beschreibe und Erkläre deinen Code und deine Analyseschritte (so das R keine Fehlermeldung produziert!)
# Liefere Interpretationen deiner Ergebnisse 


