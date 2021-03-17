# Aufgabe zum Tutorial "Naïve Bayes Klassifikation mit `quanteda`"

# Gegeben ist der quanteda-Korpus "data_corpus_inaugural"
# Weiterhin werden mit dem folgenden Code 1) eine ID für jede Rede erstellt, 
# 2) eine  Variable für Reden vor und nach 1945 erstellt (mit einem ifelse Argumemt), 
# 3) wird eine zufällige Auswahl von 35 Reden erstellt, 
# 4) werden jeweils eine Test- und Trainings-DTM erstellt

library(quanteda)
data_corpus_inaugural

# ID
docvars(data_corpus_inaugural, "id") <- 1:ndoc(data_corpus_inaugural)

# Dummy (before/after 1945)
docvars(data_corpus_inaugural, "pre_post1945") <-
  ifelse(docvars(data_corpus_inaugural, "Year") > 1945, "Post 1945", "Pre 1945")

# sample 35 speeches
set.seed(123)
speeches_select <- sample(1:58, size = 35, replace = FALSE)

# Training und Test 
dfmat_train <- data_corpus_inaugural %>%
  corpus_subset(id %in% speeches_select) %>% # Rede in id-Variable
  dfm() # dfm erstellen

dfmat_test <- data_corpus_inaugural %>%
  corpus_subset(!id %in% speeches_select) %>% # Rede nicht in id-Variable
  dfm() # dfm erstellen


# Aufgaben: 
# 1) Wie viele Dokumente sind im Trainingsset? Findet einen Weg das herauszufinden. 
# 2) Trainiert ein Naive-Bayes Model mit dem Trainingsset.
# 3) Wie viele Dokumente sind im Testset? Findet einen Weg das herauszufinden. 
# 4) Klassifiziert die Reden im Testset mit unserem Model aus Aufgabe-Nr. 2. 
# 5) Erstell eine Kreuztabelle und stellt die Eregbnisse aus Aufgabe-Nr. 4 dar. 
# 6) Besucht die folgende Internetseite: https://www.mzes.uni-mannheim.de/socialsciencedatalab/article/advancing-text-mining/
#    Versucht bitte die dort im Kapitel zu Naive Bayse präsentierte Visualisierungen nachzubauen. 

