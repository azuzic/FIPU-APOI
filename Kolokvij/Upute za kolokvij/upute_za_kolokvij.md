<div>

# Analiza podataka i obrada informacija

## Upute za kolokvij

Kolokvij traje **120 minuta** i nosi ukupno **30 bodova**. Za oslobađanje od pismenog dijela ispita potrebno je sakupiti **30 bodova** putem oba kolokvija (maksimalno 60 bodova).

- Student koji nije izašao na jedan kolokvij može biti oslobođen pismenog dijela ispita ako na drugom kolokviju sakupi **30 bodova** (*100%*)

- Kolokvij je **„open book“**, što znači da je dopušteno korištenje raznih materijala (knjiga, skripti, dokumentacije, interneta ili službenog šalabahtera)

<b style="color: #9f0000;">
Korištenje generativnih alata poput ChatGPT-a, DeepSeek-a, Geminija i sličnih nije dozvoljeno!
</b>

---

Studenti su obvezni predati sljedeće datotekte:
- **CSV datoteku** s vlastitim podacima  
- **`R`** ili **`Rmd`** datoteku  
- **Opcionalno**:
    - **JPG datoteku** s grafičkim prikazom  
    - **Rezultate izvođenja** u `PDF` formatu
---
### Primjer odgovora:

Na pitanja odgovarajte tako da pitanja kopirate u kôd i zakomentirate, **ispod svakog napišete odgovarajuće naredbe**, a **ispod naredbi kao komentar upišete odgovore**. Kôd treba pokazati kako ste došli do rezultata.
- **Obavezno navedite redni broj pitanja!**


*Primjer:*

Ako 15. pitanje glasi:
> Koliko iznosi prosječna potrošnja?

i ako je rezultat dobiven naredbom:

```r
mean(potrosnja)
[1] 24.7
```

tada ispravan odgovor treba biti:

```r
# 15. Koliko iznosi prosjecna potrosnja?
mean(potrosnja)
# Prosjecna potrosnja iznosi 24.7 jedinica.
```

> Prvi redak sadrži redni broj pitanja i tekst pitanja, drugi redak sadrži naredbu, a treći redak sadrži opisni odgovor u obliku komentara.

Nije prihvatljivo odgovoriti samo sa:

```r
mean(potrosnja)
```

i nije prihvatljivo navesti samo:

```r
# Prosjecna potrosnja iznosi 24.7 jedinica.
```

bez prikaza kako se došlo do rezultata.

> Ako se u zadatku traži snimanje grafičkog prikaza u određenom formatu (*npr. PNG*), potrebno je priložiti i takvu datoteku u traženom formatu.

---

Kreiranje **slučajnog uzorka** od 10 brojeva između 1 i 100:

```r
JMBAG <- 1234567890
set.seed(JMBAG)

mjere <- 1:100
sample(mjere, 10, replace = TRUE)  # s ponavljanjem
sample(mjere, 10, replace = FALSE) # bez ponavljanja
```

Za **snimanje podataka** sadržanih u varijabli `mjere` u datoteku naziva `primjer.csv` koristimo:

```r
write.csv(mjere, file = paste0(JMBAG, "_mjere.csv"), row.names = TRUE)
```

</div>