# R-Skript zur R-Schulung - Einführung
# Hilfsfunktionen
# Raumanalysen - Prof. Dr. Christian Müller-Kett
# mailbox@raumanalysen.de
# 07.-15.09.2026

# Spaltenauswahl aus ZKPS-Export generieren ----
zkps_export_selection_gen <- function(dat){
  
  out <- data.frame(Ursprungsname = colnames(dat),
                    Anteil_NA = sapply(1:ncol(dat), function(c) round(sum(is.na(dat[,c]))/nrow(dat)*100, 2)),
                    Anzahl_unters_Werte = sapply(1:ncol(dat), function(c) length(table(dat[,c]))),
                    Analysename = "")
  
  return(out)
  
}

# Spalten aus ZKPS-Export extrahieren ----
extract_zkps_columns <- function(dat, spec){
  
  # Spezifikation komprimieren
  pos <- which(spec[,"Analysename"] != "")
  spec <- spec[pos,]
  
  # Zielspaltennamen extrahieren
  t_columns <- unique(spec$Analysename)
  
  # über alle Zielspaltennamen iterieren
  for (t in t_columns){
    
    # Ursprungsspalten für den aktuellen Zielspaltennamen identifizieren
    pos <- rev(which(spec$Analysename == t))
    
    # über alle Ursprungsspalten iterieren
    for (c in pos){
      
      # Werte übertragen
      dat[,spec$Analysename[c]] <- dat[,spec$Ursprungsname[c]]
      
    }
  }
  
  # Spalten extrahieren
  dat <- dat[,sort(t_columns)]
  
  return(dat)
  
}

read_and_prepare <- function(file_name, sel_csv){
  
  rohdaten <- readRDS(file_name)
  spec <- read.table(sel_csv, sep = ";", header = T, encoding = "UTF-8")
  dat <- extract_zkps_columns(rohdaten, spec)
  dat <- na.omit(dat)
  return(dat)
  
}
