# 1 Jahr Frauenparlament

### Analyse der Abstimmungen und eingereichten Motionen im Nationalrat

<!---
optional folgendermassen Bild einfügen:
![Trump Hate](dt.png)
Source: [Gage Skidmore](https://www.flickr.com/photos/gageskidmore/32758233090)>)
--->

Kurzbeschreibung: ...

#### 

**Artikel**: Der Artikel wird am 06.02.2021 online auf [tagesanzeiger.ch publiziert.](https://www.tagesanzeiger.ch)

## Daten

**Datenquelle(n)**:  [Offizielle API des Schweizer Parlamants](https://pragmatiqa.com/xodata/odatadir.html) 

Als Grundlage diente die Datenbank des Parlaments, die über eine öffentliche API abrufbar ist. Folgende Informationen sind verfügbar und wurden für diese Analyse verwendet:

- Alle Wortmeldungen im Nationalrat seit 1999, mit Transkription und genauen Anfangs- und Endzeiten
- Das Abstimmungsverhalten aller Nationalräte und Nationalrätinnen seit 1999
- Alle eingereichten Motionen im Nationalrat mit Schlagworten seit 199


## Code

1. Wortmeldungen aus der API beziehen [(R Script)](1_API_Wortmeldungen.R)

2. Wortmeldungen analysieren [(R Markdown)](2_Wortmeldungen.Rmd)

3. Motionen aus der API beziehen [(Juypter Notebook)](asdf)

4. Motionen analysieren [(Juypter Notebook)](asdf)

Die aus der API bezogen Daten werden in den folgenden files im Ordner [data](data) zwischengespeichert:
1. Alle Motionen von Einzelpersonen [(motionen_pp.feather)](data/motionen_pp.feather)
2. Informationen über alle relevanten Parlamentarier[(parlamentarier_alle.csv)](data/parlamentarier_alle.csv)
3. Informationen über alle relevanten Sessionen [(relevante_Sessionen.csv)](data/relevante_Sessionen.csv)



## Analyse

### Redezeiten

In der Datenbank ist der Beginn und das Ende jeder Wortmeldung aufgeführt. Daraus lässt sich die Länge der Wortmeldung ableiten. Es werden alle Wortmeldungen von NationalrätInnen im Nationalrat berücksichtigt, wobei die Nationalratspräsidentin in der jeweiligen Session nicht berücksichtigt wird. 

### Motionen

Die Auswertung der Vorstösse basiert auf allen von Nationalratsmitgliedern eingereichten Motionen der letzten fünf Legislaturperioden. Motionen gehören zu den meist genutzten parlamentarischen Vorstössen. Sie beauftragen den Bundesrat, Gesetzesentwürfe oder Massnahmen auszuarbeiten. Motionen eignen sich deshalb, um die parlamentarische Arbeit eines Nationalratsmitglieds zu analysieren. Jede dieser Motionen ist in der Datenbank des Parlaments mit mindestens einem Themen-Schlagwort versehen. Anhand der Schlagworte lässt sich ermitteln, welche Themenschwerpunkte Parlamentarierinnen und Parlamentarier setzen.



## Output Files

### output/Datei1.csv

Beschreibung der Datei die aus dem Dataframe `df1` erstellt wurde.

| Variable     | Beschreibunng                    |
| ------------ | -------------------------------- |
| `id `        | eindeutiger Identifikator        |
| `Variable1 ` | Beschreibung der ersten Variable |
| `etc `       | und so weiter...                 |


### output/Datei2.csv

Beschreibung der Datei die aus dem Dataframe `df2` erstellt wurde.

| Variable     | Beschreibunng                    |
| ------------ | -------------------------------- |
| `id `        | eindeutiger Identifikator        |
| `Variable1 ` | Beschreibung der ersten Variable |
| `etc `       | und so weiter...                 |


## Lizenz

*Analyse Frauenrutsch* is free and open source software released under the permissive MIT License.
