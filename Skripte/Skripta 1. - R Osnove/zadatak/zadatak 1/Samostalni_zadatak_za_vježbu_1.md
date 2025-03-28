<div class="body">

# Samostalni zadatak za vježbu 1

Skup podataka `mtcars` sadrži informacije o različitim modelima automobila iz 1974. godine. Podaci uključuju potrošnju goriva, broj cilindara, snagu motora i druge karakteristike.

Učitajte skup podataka `mtcars` u varijablu naziva `cars` i odgovorite na sljedeća pitanja:

1. **Koliko ima opservacija (redaka) i varijabli (stupaca)?**

2. **Navedite kojeg su tipa varijable.**

3. **Ima li nedostajućih vrijednosti?**

4. **Izmijenite nazive stupaca tako da budu na hrvatskom jeziku.**
    - Hint: `colnames()`
    - Koristite sljedeće nazive:
        - `mpg` → `potrosnja`
        - `cyl` → `cilindri`
        - `disp` → `zapremina`
        - `hp` → `snaga`
        - `drat` → `omjer`
        - `wt` → `tezina`
        - `qsec` → `ubrzanje`
        - `vs` → `motor`
        - `am` → `mjenjac`
        - `gear` → `brzine`
        - `carb` → `karburatori`

5. **Koja je minimalna, maksimalna i prosječna potrošnja goriva?** - Hint: `min()`, `max()`, `mean()`

6. **Koliko je različitih brojeva cilindara u skupu podataka?** - Hint: `unique()`

7. **Koliko je automobila s ručnim mjenjačem (`mjenjac = 1`)?** - Hint: `nrow()`

8. **Kreirajte novi dataframe koji sadrži sve podatke za automobile s 8 cilindara. Spremite podatke u varijablu naziva `cars_8cyl`.**

9. **Koliko iznosi prosječna težina automobila s 8 cilindara?**

10. **Koliko iznosi potrošnja goriva za prva 3 automobila?** - Hint: `head()`

11. **Koliko iznosi potrošnja goriva za posljednjih 5 automobila?** - Hint: `tail()`

12. **Prikažite sažetak svih numeričkih varijabli u skupu podataka.**

</div>