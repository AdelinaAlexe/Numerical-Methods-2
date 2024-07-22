ALEXE ADELINA MARIA - 312CC
TEMA2 - METODE NUMERICE

In rezolvarea temei, am implementat functiile astel:

Task 1:

"stereo_to_mono"
Am determinat dimensiunile matricei si am initializat vectorul semnalului
mono. Pentru fiecare linie din matrice am calculat medie valorilor, pe care am
adaugat-o la vector. Semnalul mono este, dupa, normalizat.

"spectogram"
Functia calculeaza spectograma unui semnal dat, un vector de timp si o
frecventa a intensitatii spectrale. Pentru fiecare fereastra a semnalului,
am aplicat o fereastra Hanning, am calculat transformata Fourier rapida (FFT),
iar magnitutdinea semnalului este este stocata intr-o matrice spectograma.
Functia returneaza matricea spectograma, precum si vectorii de timp si
frecventa.

Folosind functia studio.m, am generat mai multe reprezentari vizuale ale 
diferitelor tipuri de semnale. Fiecare grafic are axa Y reprezentand
frecventa în Hz si axa X indicând variatia in timp (in secunde).
Culorile denota intensitatea semnalului la anumite momente bazate pe
frecventa. Semnalele cu intensitate mare sunt afisate in rosu, in timp ce
cele cu intensitate mai mica apar in albastru. Iata o scurta descriere a
fiecarei imagini:

PLAIN LOOP: Prezinta un semnal audio periodic cu multiple frecvente,
atat de intensitate mare, cat si mica.
PLAIN SOUND: Consta in frecvente discrete care par aproape constante.
LOW PASS SOUND: Semnalul este filtrat, eliminand frecventele inalte.
REVERB SOUND: A fost aplicat un efect pentru a extinde frecventele in
timp si a le creste intensitatea.
TECH: Un semnal cu multiple modulatii, combinand frecvente inalte si joase.
LOW PASS TECH: Similar cu "LOW PASS SOUND", dar de aceasta data sunt
pastrate doar frecventele de intensitate mai mica.
REVERB TECH: Similar cu "REVERB SOUND", dar cu un semnal mai complex.
LOW PASS + REVERB TECH: Combina doua efecte pentru a elimina frecventele
inalte si a extinde cele ramase in timp.


"oscillator"
Functia genereaza un semnal sinusoidal cu amplitudine controlata. Ea combina un
semnal sinusoidal cu amplitudinea semnalului in timp. Amplitudinea variaza in
timpul atacului(A), descresterii(D), sustinerii(S) si relaxarii(R).

"low_pass"
Functia implementeaza filtrul low-pass pe un semnal dat. Initial, am calculat
transformata Fourier rapida a semnalului de intrare si am generat un vector de
frecvente care corespunde fiecarui bin de frecventa in spectrul semnalului.
Am creat o masca, in care am pus valoarea '1' pentru frecventele mai mici decat
"cutoff_freq", si '0' in rest. Am aplicat un produs Hadamard intre spectrul
semnalului si masca pentru a elimina frecventele din spectrul semnalului care
sunt mai mari decat "cutoff_freq". Am aplicart transformata Fourier inversa
si am normalizat semnalul.

Task 2: 

"parse_data"
Functia citeste variabila n si vectorii x si y din fisierul de intrare dat ca
parametru.

"spline_c2"
Functia calculeaza coeficientii unei functii spline cubice naturale pe baza
punctelor retinute in cei doi vectori x si y dati ca parametru la functie.
Initial, am calculat numarul de intervale si diferentele dintre punctele x.
Ulterior, am construit un sistem tridiagonal pentru a gasi derivatele secunde
ale functiilor spline in punctele date.
Am setat derivatele secunde la capete cu 0 (conditia de spline natural) si am 
folosit derivatele secunde pentru a calcula coeficientii prin substitutie inapoi.
Coeficientii a, b, c, d sunt dispusi la final intr-un vector coloana.

"P_spline"
Functia calculeaza valoarea interpolata pentru un set de puncte x_interp foxlsind
coeficientii functiei spline. Pentru fiecare punct din x_interp, am identificat
intervalul in care acesta se afla in functie de punctele din x. Am calculat
diferenta dintre x_interp(i) si x(idx) pentru a determina deplasarea relativa in
interval. Folosind diferenta calculata, functia calculeaza spline-ul cubic
pentru a obtine valoarea interpolata, pe care am stocat-o in y_interp.

"vandermonde"
Functia calculeaza coeficientii polinomului interpolarii folosind metoda interpolarii
Vandermonde. Am construit matricea, astfel incat fiecarea coloana contine elementele
vectorului x ridicate la puterea i - 1. Coeficientii sunt construiti prin rezolvarea
sistemului liniar.

"P_vandermonde"
Functia evalueaza un polinom definit de punctele din x_interp. Pentru fiecare grad
de la 0 la n se evalueaza termenul corespunzator al polinomului si se adauga in
y_interp. Acest proces implica ridicarea fiecarui element din x_interp la puterea
corespunzatoare si inmultirea cu coeficientul.


Task 3:

"read_mat"
Functia citeste un fisier csv si returneaza o matrice de valori fara anteturi, 
folosind functia 'csvread'.

"preprocess"
Functia elimina dintr-o matrice toate randurile ce corespund utilizatorilor
care au mai putin de un numar de recenzii. Se calculeaza numarul de recenzii
pentru fiecare utilizator prin numararea elementelor nenule din fiecare rand
al matricei mat. Se gasesc indicii randurilor care au un numar de recenzii
mai mare sau egal cu min_reviews. Se pastrează doar randurile din matricea
mat care corespund utilizatorilor cu un numar suficient de recenzii.

"cosine_similarity"
Functia calculeaza similaritatea cosinus dintre 2 vectori coloana. Am normalizat
vectorii si am calculat similaritatea folosind formula specifica.

"recommendations"
Functia furnizeaza cele mai bune recomandari pentru un utilizator bazate pe un
anumit liked_theme, utilizand factorizarea SVD pentru a reduce
dimensionalitatea datelor si calculeazs similaritatile cosinus pentru a determina
cele mai similare teme. Matricea citita cu functia 'read_mat' si este filtrata
pentru a elimina utilizatorii care nu au un numar suficient de recenzii,
folosind functia'preprocess'. Se aplică SVD pe matricea preprocesata pentru a
reduce dimensionalitatea la num_features.
Matricea rezultată V contine vectorii caracteristici pentru teme, transpusa
pentru a facilita calculul similaritatii cosinus. Temele sunt sortate
descrescator după similaritate si indicii celor mai similare teme sunt obtinuti.
In final, se selecteaza primele num_recoms recomandari excluzand tema preferata.