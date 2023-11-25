# CSVLIB-TP
Bibliothèque en Turbo Pascal ou Free Pascal pour la gestion des fichiers de format .CSV.

<h3>Liste des fonctions</h3>

Voici la liste des fonctions reconnus dans l'unité CSVLIBTP :

<table>
	<tr>
		<th>Nom</th>
		<th>Description</th>
	</tr>
  <tr>
    <td><b>AddFieldValueCSV</b></td>
    <td>Cette fonction permet d'ajouter une nouvelle valeur d'un champ d'un enregistrement CSV.</td>
  </tr>
  <tr>
    <td><b>AddFieldValueIntegerCSV</b></td>
    <td>Cette fonction permet d'ajouter une nouvelle valeur entière d'un champ d'un enregistrement CSV.</td>
  </tr>
  <tr>
    <td><b>AddFieldValueLongIntCSV</b></td>
    <td>Cette fonction permet d'ajouter une nouvelle valeur entière longue d'un champ d'un enregistrement CSV.</td>
  </tr>
  <tr>
    <td><b>AddFieldValueRealCSV</b></td>
    <td>Cette fonction permet d'ajouter une nouvelle valeur réel d'un champ d'un enregistrement CSV.</td>
  </tr>
  <tr>
    <td><b>AddFieldValueStringCSV</b></td>
    <td>Cette fonction permet d'ajouter une nouvelle valeur de chaine de caractères d'un champ d'un enregistrement CSV.</td>  
  </tr>
  <tr>
    <td><b>AddRecordCSV</b></td>
    <td>Cette fonction permet d'ajouter un nouvel enregistrement dans le CSV.</td>
  </tr>
  <tr>
    <td><b>CloseCSV</b></td>
    <td>Cette fonction permet de fermer un fichier CSV.</td>
  </tr>
  <tr>
    <td><b>CreateCSV</b></td>
    <td>Cette fonction permet de créer un fichier CSV.</td>
  </tr>
  <tr>
     <td><b>CountFieldCSV</b></td>
     <td>Cette fonction permet de compter le nombre de champ que contient un fichier CSV.</td>
  </tr>
  <tr>
    <td><b>CountRecordCSV</b></td>
    <td>Cette fonction permet de compter le nombre d'enregistrement que contient un fichier CSV.</td>
  </tr>
  <tr>
    <td><b>IsEndOfCSV</b></td>
    <td>Cette fonction permet de vérifier si la fin du fichier CSV est atteinte.</td>
  </tr>
  <tr>
    <td><b>GetQuotedString</b></td>
    <td>Cette fonction permet de demander le caractère utiliser pour délimiter une chaine de caractères dans un fichier CSV, soit généralement «"».</td>
  </tr>
  <tr>
      <td><b>GetSeparatorCSV</b></td>
      <td>Cette fonction permet de demander le délimiteur entre les champs d'un enregistrement, soit généralement «,».</td>
  </tr>
  <tr>
    <td><b>OpenCSV</b></td>
    <td>Cette fonction permet d'ouvrir un fichier CSV.</td>
  </tr>
  <tr>
    <td><b>ReadFieldCSV</b></td>
    <td>Cette fonction permet d'effectuer la lecture d'un champ d'un enregistrement du CSV.</td>
  </tr>
  <tr>
    <td><b>ReadFirstRecordCSV</b></td>
    <td>Cette fonction permet de lire le premier enregistrement dans un fichier CSV.</td>
  </tr>
  <tr>
    <td><b>ReadRecordCSV</b></td>
    <td>Cette fonction permet de lire un enregistrement dans le fichier CSV.</td>
  </tr>
  <tr>
    <td>SetSeparatorCSV</td></tr>
    <td>Cette procédure permet de fixer le séparateur de champ à utiliser dans un fichier CSV.</td>
</tr>
  <tr>
    <td><b>SetNoQuotedString</b></td>
    <td>Cette procédure permet d'indiquer qu'il n'y a pas de délimiteur de chaine de caractères d'un fichier CSV.</td>
  </tr>
  <tr>
    <td><b>SetQuotedString</b></td>
    <td>Cette procédure permet de fixer le délimiteur de chaine de caractères d'un fichier CSV.</td>
  </tr>      
  <tr>
    <td><b>WriteRecordCSV</b></td>
    <td>Cette fonction permet d'écrire un enregistrement complet dans un fichier CSV.</td>
  </tr>
</table>
