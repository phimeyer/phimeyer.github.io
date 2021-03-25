# Aufgaben: Textstatistiken und Textähnlichkeiten


# Aufgabe 1: Erstellt einen Korpus und danach eine DTM/DFM nur mit den Reden von Trump und Obama

## LÖSUNG
corpus_pres <- corpus_subset(
  inaug, 
  President %in% c("Obama", "Trump")
)

## Create term-document matrix
dtm_pres <- dfm(
  corpus_pres, 
  groups = "President",
  remove = stopwords("english"), 
  remove_punct = T
)

# Aufgabe 2: Vergleiche die Keynesswerte der Rede von Trump (target) mit der von Obama. 

# LÖSUNG

keyness <- textstat_keyness(dtm_pres, target = "Trump")
head(keyness)
textplot_keyness(keyness)

# Aufgabe 3: Identifiziere die Wörterpaar die am häufigsten gemeinsam auftreten. 

# LÖSUNG 
toks <- tokens(inaug)
toks <- tokens_remove(toks, stopwords("english"), padding = TRUE)
colloc <- textstat_collocations(toks)
colloc[1:20,]

# Aufgabe 4: Lass dir die KWIC für "citizens" und "my fellow americans" ausgeben 
# und visualisiere anschließend die Positionen dieser Begriffe/Satzstücke in den Reden der US Präsidenten 

# Aufgabe 5: Berechne die Textähnlichkeit der Reden von Obama und Trump. 
# Verwende dafür die Jaccard Similarity

#LÖSUNG
textstat_simil(dtm[inaug$documents$President %in% c("Obama", "Trump"), ], method = "jaccard")

#-----------------------------
# Lexical diversity
#-----------------------------


# Aufgabe 6: Berechne die Textdiversität und die Lesbarkeit aller Antrittsreden 
# der US Präsidenten. Visualisiere deine Ergebnisse


# LÖSUNGEN
textstat_lexdiv(dtm, measure = "TTR") ## Type-Token Ratio


textstat_readability(inaug, measure = "Flesch.Kincaid")
