DROP VIEW IF EXISTS Tog;
DROP VIEW IF EXISTS TogTabell;
DROP TABLE IF EXISTS Plass;

CREATE TABLE Tog(
  togNr int, -- PK, var usikker på om jeg skulle ta serial ogsaa men det kan hende at de har sitt eget tall system
  startStasjon text,
  endestasjon text, --begge bruker tekst siden stasjonene har navn som for eksempel ski stasjon, oslo stasjon osv
  ankomstid timestamp, --tar klokkeslettet for naar den kom, som er det som er vist naar man er paa toget
  primary key (togNr) -- key som spesifisert i lista med krav
)

CREATE TABLE TogTabell(
  togNr int REFERENCES Tog(togNr), --foreign key
  avgangsTid timestamp, -- samme grunn som ankomstid
  stasjon text,
  primary key (togNr, avgangsTid)
)

CREATE TABLE Plass(
  dato date,--dato er en egen datatype og foeler at det er naturlig aa bruke date paa dato
  togNr int REFERENCES Tog(togNr),
  vognnr int, --vognnr refererer til hvilken vogn som er paa toget
  plassNr int, --refererer til seter paa toget
  vindu boolean, --om det er vindusplass eller ikke er en sann/usann paastand og derfor passer boolean her best
  ledig boolean,
  primary key (dato, togNr, vognNr, plassNr)
)

