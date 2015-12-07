% S'initier à XML
% Didier RICHARD - IGN/DRE/ValiLab
% 05/12/2015

# XSD #

## Pourquoi le XSD? (1/3) ##

* La syntaxe des DTD est issue du langage SGML (**S**tandard **G**eneralized **M**arkup **L**anguage),
  beaucoup plus compliqué et lourd que ne l'est le langage XML ;
* Le XML, langage universel, doit permettre un ensemble cohérent d’applications
  depuis la définition des modèles jusqu’à leur présentation en passant par leur
  structuration… Pour des soucis d’homogénéité, il fallait développer un langage
  de définition de documents basé sur XML

## Pourquoi le XSD? (2/3) ##

* Le langage de schéma XML apporte une grande souplesse et une puissance
  inégalée dans la définition des documents XML ;
* La fonctionnalité la plus remarquable des schémas XML est la prise en charge
  des types de données (contenu garanti et validation plus efficace) ;
* Un modèle plus exhaustif car définissant les éléments et la structure, avec
  les occurrences, les contenus mixtes, les groupes d’attributs …
* L'extensibilité des définitions des documents apportée par les schémas XML,
  facilite l'échange, la fusion ou la réutilisation de données provenant d'une
  ou plusieurs sources.

## Pourquoi le XSD? (3/3) ##

* La génération dynamique de documents XML et du modèle de contenu associé,
  devient alors beaucoup plus commode ;
* Implique une certaine compatibilité entre les schémas susceptibles d'être
  combinés en passant par une normalisation entre distributeurs des contenus ou
  en utilisant des XSD « standards » ;

**Le langage de schémas constitue donc une pièce essentielle dans la sphère XML,
assurant une évolutivité, un dynamisme et une souplesse que ne pouvait assumer
le langage de DTD.**

## Notions de base ##

* On déclare chaque élément en précisant son type et sa liste d’attributs :
    * Son type peut être simple, dérivé d’un type simple, complexe ou un
      groupe ;
    * Les attributs sont quant à eux également typés avec un type accepté par
      l’attribut ;
    * On peut importer des schémas ou les inclure.

## L’élément racine (1/3) ##

* `xsd:schema` est la racine de tout XSD, il est caractérisé par des attributs
    qu’il faut potentiellement renseigner :
    * `attributeFormDefault` (permet de savoir si les attributs doivent être munis de
        l’espace de noms ou pas) ;
    * `blockDefault` (empêche par défaut l’utilisation de types dérivés dans des
        éléments attendant un type de base -- extension restriction
        substitution --) ;
    * `elementFormDefault` (permet de savoir si les éléments doivent être munis de
        l’espace de noms ou pas) ;
    * `finalDefault` empêche la dérivation de type par restriction, extension ou les
        deux Id précise un identificateur unique pour le schéma ;

## L’élément racine (2/3) ##

* `xsd:schema` est la racine de tout XSD, il est caractérisé par des attributs
    qu’il faut potentiellement renseigner (suite) :
    * `targetNamespace` indique un namespace cible pour tout élément étranger au
        schéma XML ;
    * `version` indique un numéro de version ;
    * `xml:lang` précise la langue dans laquelle est conçu le document ;
    * Et bien sûr on peut définir la liste de namespaces utilisés avec `xmlns`.

## L’élément racine (3/3) ##

```xml
<?xml version="1.0" encoding="utf-8"?>
<xsd:schema xmlns:monEN="http://www.ensg.eu/xml1-a"
            xmlns:xsd="http://www.w3.org/2001/XMLSchema"
            targetNamespace="http://www.ensg.eu/xml1-a"
            elementFormDefault="qualified"
            version="0.0.1">
...
</xsd:schema>
```

## Les import ou les include ##

* L'élément `xsd:include` permet d'inclure un schéma XML d'un même espace de noms
    dans un autre schéma :

```xml
<xsd:include id="ID" schemaLocation="anyURI"
             {tout attribut ayant un espace de noms différent de celui du schéma...}/>
```

* L'élément `xsd:import` permet d'importer un schéma XML avec un espace de noms
    différent dans un autre schéma :

```xml
<xsd:import id="ID" namespace="anyURI" schemaLocation="anyURI"
            {tout attribut ayant un espace de noms différent de celui du schéma...}/>
```

## La définition d’un élément ##

* L’élément `xsd:element` permet de définir un élément du document XML et d’y
  associer des propriétés ;
* Si on a un type simple (i.e. atomique et sans attributs), la définition se fait
    simplement, si on souhaite un type simple personnalisé on utilise la
    balise `xsd:simpleType` et si on souhaite un type complexe on utilise
    la balise `xsd:complexType` et enfin si on veut un group on utilise la
    balise `xsd:group`.

## Attribut d’un élément (1/3) ##

+-------------------+-------------------------------------------------------------+
| Attribut          | Description                                                 |
+===================+=============================================================+
| name              | indique le nom de l'élément XML                             |
+-------------------+-------------------------------------------------------------+
| id                | précise un identificateur unique pour l'élément             |
+-------------------+-------------------------------------------------------------+
| type              | fournit le type de données accepté par l'élément            |
+-------------------+-------------------------------------------------------------+
| abstract          | provoque l'abstraction (true) de l'élément XML, devant être |
|                   | remplacé par un autre élément                               |
+-------------------+-------------------------------------------------------------+

: principaux attributs de `xsd:element` (1/3)

## Attribut d’un élément (2/3) ##

+-------------------+-------------------------------------------------------------+
| Attribut          | Description                                                 |
+===================+=============================================================+
| default           | précise une valeur par défaut pour l'élément                |
+-------------------+-------------------------------------------------------------+
| final             | empêche la dérivation de type par restriction, extension    |
|                   | ou les deux                                                 |
+-------------------+-------------------------------------------------------------+
| fixed             | empêche une dérivation par restriction du type de l'élément |
+-------------------+-------------------------------------------------------------+

: principaux attributs de `xsd:element` (2/3)

## Attribut d’un élément (3/3) ##

+-------------------+-------------------------------------------------------------+
| Attribut          | Description                                                 |
+===================+=============================================================+
| minOccurs         | précise le nombre d'occurrences minimum de l'élément. Par   |
|                   | défaut, ce nombre est égal à 1                              |
+-------------------+-------------------------------------------------------------+
| maxOccurs         | précise le nombre d'occurrences maximum de l'élément. Par   |
|                   | défaut, ce nombre est égal à 1                              |
+-------------------+-------------------------------------------------------------+
| substitutionGroup | définit un élément pour lequel l'élément peut se            |
|                   | substituer                                                  |
+-------------------+-------------------------------------------------------------+

: principaux attributs de `xsd:element` (3/3)

## Les types simples prédéfinis ##

* Il en existe une liste assez longue d’une quarantaine de possibilités parmi
  lesquelles on pourra retenir `string`, `integer`, `float`, `time`,
  `dateTime`, etc …
* On peut donc couvrir la majorité des cas qu’on rencontrera pour les types
  simples.

## Les types simples personnalisés (1/4) ##

* On peut également dériver de ces types simples 
    * __des restrictions :__

    ```xml
<xsd:simpleType name="monEntier">
    <xsd:restriction base="xsd:integer">
        <xsd:minInclusive value="10000"/>
        <xsd:maxInclusive value="99999"/>
    </xsd:restriction>
</xsd:simpleType>
    ```

    * un format à adapter ;
    * une énumération ;
    * une liste.

## Les types simples personnalisés (2/4) ##

* On peut également dériver de ces types simples
    * des restrictions ;
    * __un format à adapter :__

    ```xml
<xsd:simpleType name="monFormat">
    <xsd:restriction base="xsd:string">
        <xsd:pattern value="\d{3}-[A-Z]{2}"/>
    </xsd:restriction>
</xsd:simpleType>
    ```

    * une énumération ;
    * une liste.

## Les types simples personnalisés (3/4) ##

* On peut également dériver de ces types simples
    * des restrictions ;
    * un format à adapter ;
    * __une énumération :__

    ```xml
<xsd:simpleType name="unDepartement">
    <xsd:restriction base="xsd:string">
        <xsd:enumeration value="Ain"/>
        <xsd:enumeration value="Aisne"/>
        <xsd:enumeration value="Allier"/>
        <!-– etc -->
    </xsd:restriction>
</xsd:simpleType>
    ```

    * une liste.

## Les types simples personnalisés (4/4) ##

* On peut également dériver de ces types simples
    * des restrictions ;
    * un format à adapter ;
    * une énumération ;
    * __une liste :__

    ```xml
<xsd:simpleType name="listeDEntiers">
    <xsd:list itemType="monEntier"/>
</xsd:simpleType>
    ```

## Les types complexes avec simpleContent ##

* On peut les dériver à partir des types simples en y ajoutant simplement un
  attribut par exemple de la manière suivante :

```xml
<xsd:complexType name="unPrix">
    <xsd:simpleContent>
        <xsd:extension base="xsd:decimal">
            <xsd:attribute name="monnaie" type="xsd:string"/>
        </xsd:extension>
    </xsd:simpleContent>
</xsd:complexType>
```

## Les types complexes (1/3) ##

* Dans tous les autres cas, on décrit soit une séquence d’éléments (`sequence`) :

```xml
<xsd:element name="element_1" type="xsd:integer"/>
<xsd:element name="element_2" type="xsd:integer"/>
<xsd:element name="element_3" type="xsd:integer"/>
<xsd:complexType name="element_enfantType">
    <xsd:sequence>
        <xsd:element ref="element_1"/>
        <xsd:element ref="element_2"/>
        <xsd:element ref="element_3"/>
    </xsd:sequence>
    <xsd:attribute name="id" use="required">
        <xsd:simpleType>
            <xsd:restriction base="xsd:NMTOKEN">
                <xsd:enumeration value="01"/>
                <xsd:enumeration value="02"/>
            </xsd:restriction>
        </xsd:simpleType>
    </xsd:attribute>
</xsd:complexType>
```

## Les types complexes (2/3) ##

* soit un choix parmi les éléments (`choice`) :

```xml
<xsd:element name="element_choix_1" type="xsd:integer"/>
<xsd:element name="element_choix_2" type="xsd:integer"/>
<xsd:complexType name="element_enfantType">
    <xsd:choice> 
        <xsd:element ref="element_choix_1"/>
        <xsd:element ref="element_choix_2"/>
    </xsd:choice>
    <xsd:attribute name="id" use="required">
        <xsd:simpleType>
            <xsd:restriction base="xsd:NMTOKEN">
                <xsd:enumeration value="01"/>
                <xsd:enumeration value="02"/>
               </xsd:restriction>
         </xsd:simpleType>
    </xsd:attribute>
</xsd:complexType>
```

## Les types complexes (3/3) ##

* soit tous les éléments sans ordre précis (`all`) :

```xml
<xsd:complexType name="element_enfantType">
    <xsd:all minOccurs="0" maxOccurs="1">
        <xsd:element name="element_1" type="xsd:integer"/>
        <xsd:element name="element_2" type="xsd:integer"/>
        <xsd:element name="element_3" type="xsd:integer"/>
    </xsd:all>
    <xsd:attribute name="id" use="required">
        <xsd:simpleType>
            <xsd:restriction base="xsd:NMTOKEN">
                <xsd:enumeration value="01"/>
                <xsd:enumeration value="02"/>
               </xsd:restriction>
         </xsd:simpleType>
    </xsd:attribute>
</xsd:complexType>
```

## Les groupes ##

* On définit un groupe d’éléments et on peut y faire référence dans un schéma
    XML, on utilise `group` :

```xml
<xsd:group name="groupe_elements_livre">
    <xsd:sequence>
        <xsd:element name="titre" type="xsd:string"/>
        <xsd:element name="auteur" type="xsd:string" minOccurs="1" maxOccurs="unbounded"/>
         <xsd:element name="editeur" type="xsd:string"/>
    </xsd:sequence>
</xsd:group>
<xsd:complexType name="type_livre">
    <xsd:sequence>
        <xsd:group ref="groupe_elements_livre"/>
    </xsd:sequence>
</xsd:complexType>
<xsd:complexType name="type_librairie">
    <xsd:sequence> 
        <xsd:element name="livre" type="type_livre" minOccurs="1" maxOccurs="unbounded"/>
    </xsd:sequence>
</xsd:complexType>
<xsd:element name="librairie" type="type_librairie"/>
```

## Les attributs ##

* Pour chaque type complexe on peut définir les attributs associés soit à l’aide
de `attribute` soit à l’aide de `attributeGroup` qui fonctionne de la même
manière que `group` à savoir qu’on y fait référence ensuite.

## L’ élément complexContent ##

* L’élément `complexContent` permet de définir un contenu complexe pour un élément
  XML :

```xml
<xsd:complexType name="type_personne" block="restriction">
    <xsd:sequence>
        <xsd:element name="nom" type="xsd:string"/>
        <xsd:element name="prenom" type="xsd:string"/>
        <xsd:element name="adresse" type="xsd:string"/>
    </xsd:sequence>
</xsd:complexType>
<xsd:complexType name="type_francaise">
    <xsd:complexContent>
        <xsd:extension base="type_personne">
            <xsd:sequence>
                <xsd:element name="code_postal" type="xsd:positiveInteger"/>
                <xsd:element name="ville" type="xsd:string"/>
            </xsd:sequence>
        </xsd:extension>
    </xsd:complexContent>
</xsd:complexType>
```

## Restriction et extension ##

* L’extension permet d’étendre la définition d’un élément ou d’un attribut XML
  à un autre type de données spécifié ;
* La restriction permet de restreindre les données permises dans un élément ou
  un attribut XML.

```xml
<xsd:complexType name="type_donation">
    <xsd:simpleContent> 
        <xsd:extension base="niveau_don">
            <xsd:attribute name="monnaie" type="xsd:string" use="required"/> 
        </xsd:extension> 
    </xsd:simpleContent>
</xsd:complexType> 
<xsd:simpleType name="niveau_don"> 
    <xsd:restriction base="xsd:nonNegativeInteger"> 
        <xsd:minExclusive value="49"/> 
        <xsd:maxExclusive value="501"/> 
    </xsd:restriction> 
</xsd:simpleType>
```

## Exercice n°4 ##

* Écrire le schéma qui décrit le fichier XML ;
* Valider le schéma XML ;
* Modifier le fichier XML pour utiliser ce schéma XML.


# XSL #

## XSL, qu’est-ce que c’est? (1/2) ##

* Le langage XSL est à XML ce que CSS/Javascript est à HTML :
  il permet d’effectuer une visualisation/modification du contenu décrit
  dans un fichier XML ;
* Le langage XSL se divise en deux parties principales :
    * Le formatage : application de règles de style sur des éléments XML à
      l'instar du langage CSS ;
    * La transformation : substitution d'un marquage XML en un balisage HTML
      ou un autre marquage XML ou autre texte ...

## XSL, qu’est-ce que c’est? (2/2) ##

* La partie formatage du langage XSL (e*X*tensible *S*tylesheet *L*anguage) a une
  fonction semblable à celle du langage CSS (*C*ascading *S*tyleSheet) ;
* Le langage XSL, par une série de règles de transformation, remplace les
  éléments XML et leurs attributs en balisage HTML (*H*yper*T*ext *M*arkup *L*anguage)
  ou en d'autres marqueurs XML. Cette section du langage XSL s'appelle XSLT soit
  Langage des feuilles de Style de Transformation dont les spécifications sont
  mises au point par le W3C (World Wide Web Consortium).

## Comment appliquer du XSL? ##

1. Demander à l'ordinateur client de posséder impérativement un navigateur
   compatible avec les technologies XML ...
2. Demander un aménagement logiciel du serveur web avec par exemple, un
   programme XML Enabler d'IBM, afin de le rendre compatible aux
   technologies XML/XSL ;
3. Installer un moteur de transformation XML nommé XT (*X*ML *T*ransformer)
   associé à un analyseur (ou parser) conforme à SAX (*S*imple *A*PI for
   *X*ML) ou DOM (*D*ocument *O*bject *M*odel)

## Un document XSL comment ça fonctionne ? ##

* On précise que le document XSL est un document XML :

```xml
<?xml version="1.0" encoding="UTF-8"?>
```

* On introduit le namespace XSL :

```xml
<xsl:stylesheet
   xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
   version="1.0"
>
```

* On précise ce qu’on sort comme document (ici du HTML) :

```xml
<xsl:output method="html" encoding="UTF-8"/>
```

* Et on commence véritablement les règles XSL !!

## Les espaces de noms de XSL ##

* Les URI associées à XSL sont :
    * `http://www.w3.org/1999/XSL/Transform` pour XSLT ;
    * `http://www.w3.org/1999/XSL/Format/1.0` pour XSL-FO ;
 
## Un exemple ##

```xml
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   <xsl:output method="xml" encoding="UTF-8" indent="yes" />
   <xsl:strip-space elements="*" />
   <xsl:template match="/">
      <xsl:copy-of select="." />
   </xsl:template>
</xsl:stylesheet>
```

## Les motifs ##

* Ce sont des expressions utilisées pour sélectionner les nœuds d’un document
    XML, elles se trouvent dans les attribut `select` ou `match` des éléments de
    XSLT (règles) :
    * `template` ;
    * `apply-templates` ;
    * `value-of` ;
    * `copy-of` ;
    * `sort` ;
    * `for-each`

## Les motifs principaux (1/4) ##

+---------+------------------------------------------------------+
| Motifs  | Description                                          |
+=========+======================================================+
| x       | n'importe quel élément de nom x, fils de l'élément   |
|         | courant                                              |
+---------+------------------------------------------------------+
| */x     | n'importe quel élément de nom x, petit-fils de       |
|         | l'élément courant                                    |
+---------+------------------------------------------------------+
| x|y     | n'importe quel élément de nom x ou y, fils de        |
|         | l'élément courant                                    |
+---------+------------------------------------------------------+
| x/y     | n'importe quel élément de nom y, fils d'un élément   |
|         | x lui-même fils de l'élément courant                 |
+---------+------------------------------------------------------+

## Les motifs principaux (2/4) ##

+---------+------------------------------------------------------+
| Motifs  | Description                                          |
+=========+======================================================+
| x//y    | n'importe quel élément de nom y, descendant d'un     |
|         | élément x lui-même fils de l'élément courant         |
+---------+------------------------------------------------------+
| /       | le nœud racine du fichier XML                        |
+---------+------------------------------------------------------+
| ./      | n'importe quel fils de l'élément courant             |
+---------+------------------------------------------------------+
| ../x    | n'importe quel élément de nom x, père de l'élément   |
|         | courant                                              |
+---------+------------------------------------------------------+
| id("n") | l'élément d'identifiant XML "n"                      |
+---------+------------------------------------------------------+

## Les motifs principaux (3/4) ##

+-------------------------+--------------------------------------+
| Motifs                  | Description                          |
+=========================+======================================+
| x[1]                    | le premier élément de nom x, fils de |
|                         | l'élément courant                    |
+-------------------------+--------------------------------------+
| x[last()=1]             | le dernier élément de nom x, fils de |
|                         | l'élément courant                    |
+-------------------------+--------------------------------------+
| x/y[position()>1]       | tout élément de nom y, fils de       |
|                         | l'élément x fils de l'élément        |
|                         | courant, sauf le premier fils de x   |
+-------------------------+--------------------------------------+

## Les motifs principaux (4/4) ##

+-------------------------+--------------------------------------+
| Motifs                  | Description                          |
+=========================+======================================+
| x[position() mod 2 = 1] | tout élément de nom x, fils de rang  |
|                         | impair de l'élément courant          |
+-------------------------+--------------------------------------+
| x[@a="v"]//y            | tout élément de nom y, descendant    |
|                         | d'un élément de nom x pour lequel    |
|                         | l'attribut a vaut "v", x est fils de |
|                         | l'élément courant                    |
+-------------------------+--------------------------------------+
| x/@a                    | tous les attributs a des éléments de |
|                         | nom x, fils de l'élément courant     |
+-------------------------+--------------------------------------+
| @*                      | tous les attributs de l'élément      |
|                         | courant et de ses descendants        |
+-------------------------+--------------------------------------+

## Le langage XPath ##

* On utilise les motifs pour pouvoir sélectionner les nœuds et on applique
    ensuite des axes nodaux, des prédicats ou des fonctions nodales :
    * Un axe nodal ouvre des « directions de recherche » indiquées par le
        préfixe avant les axes et les deux points ;
    * Un prédicat sont des expressions entre crochets permettant de cibler au
        mieux une partie de l’arborescence XML ;
    * Une fonction nodale peut être booléenne, calculatoire, etc …

## Les axes nodaux (1/4) ##

+--------------------+------------------------------------------------------------------------------------------------------------------+
|Axe nodal           |Description                                                                                                       |
+====================+==================================================================================================================+
|ancestor::          |représente les noeuds parents du noeud courant jusqu'au noeud racine                                              |
+--------------------+------------------------------------------------------------------------------------------------------------------+
|ancestor-or-self::  |représente le noeud lui-même avec les mêmes caractèristiques que ancestor::                                       |
+--------------------+------------------------------------------------------------------------------------------------------------------+
|descendant::        |représente les noeuds fils du noeud courant jusqu'au noeud terminal                                               |
+--------------------+------------------------------------------------------------------------------------------------------------------+

## Les axes nodaux (2/4) ##

+--------------------+------------------------------------------------------------------------------------------------------------------+
|Axe nodal           |Description                                                                                                       |
+====================+==================================================================================================================+
|descendant-or-self::|représente le noeud lui-même avec les mêmes caractèristiques que descendant                                       |
+--------------------+------------------------------------------------------------------------------------------------------------------+
|self::              |représente le noeud lui-même                                                                                      |
+--------------------+------------------------------------------------------------------------------------------------------------------+
|parent::            |représente les noeuds parents directs                                                                             |
+--------------------+------------------------------------------------------------------------------------------------------------------+
|child::             |représente les noeuds fils directs                                                                                |
+--------------------+------------------------------------------------------------------------------------------------------------------+
|attribute::         |représente les noeuds attributs du noeud courant                                                                  |
+--------------------+------------------------------------------------------------------------------------------------------------------+

## Les axes nodaux (3/4) ##

+--------------------+------------------------------------------------------------------------------------------------------------------+
|Axe nodal           |Description                                                                                                       |
+====================+==================================================================================================================+
|following::         |représente tous les noeuds suivant le noeud courant hormis les noeuds attributs et espaces de noms                |
+--------------------+------------------------------------------------------------------------------------------------------------------+
|following-sibling:: |représente la même chose que following mais essentiellement les noeuds qui ont le même parent que le noeud courant|
+--------------------+------------------------------------------------------------------------------------------------------------------+

## Les axes nodaux (4/4) ##

+--------------------+------------------------------------------------------------------------------------------------------------------+
|Axe nodal           |Description                                                                                                       |
+====================+==================================================================================================================+
|preceding::         |représente tous les noeuds précédant le noeud courant hormis les noeuds attributs et espaces de noms              |
+--------------------+------------------------------------------------------------------------------------------------------------------+
|preceding-sibling:: |représente la même chose que preceding mais essentiellement les noeuds qui ont le même parent que le noeud courant|
+--------------------+------------------------------------------------------------------------------------------------------------------+

## Les axes nodaux abrégés (1/4) ##

+----------+---------------------------------------------------------------------------------------------------------------+
|Opérateur | Description                                                                                                   |
+==========+===============================================================================================================+
|element   |sélectionne tous les éléments element fils du noeud courant (child::element)                                   |
+----------+---------------------------------------------------------------------------------------------------------------+
|\*        |sélectionne tous les éléments fils du noeud courant                                                            |
+----------+---------------------------------------------------------------------------------------------------------------+
|/         |représente l'élément racine                                                                                    |
+----------+---------------------------------------------------------------------------------------------------------------+
|//        |représente n'importe quel descendant de l'élément racine, donc tous les éléments (descendant-or-self::node())  |
+----------+---------------------------------------------------------------------------------------------------------------+

## Les axes nodaux abrégés (2/4) ##

+----------+---------------------------------------------------------------------------------------------------------------+
|Opérateur | Description                                                                                                   |
+==========+===============================================================================================================+
|.         |représente l'élément courant (self::node())                                                                    |
+----------+---------------------------------------------------------------------------------------------------------------+
|..        |permet de remonter d'un niveau dans l'arborescence du document par rapport à l'élément courant (parent::node())|
+----------+---------------------------------------------------------------------------------------------------------------+
|/element  |sélectionne tous les éléments element sous l'élément racine ()                                                 |
+----------+---------------------------------------------------------------------------------------------------------------+
|./element |sélectionne tous les éléments element sous l'élément courant (following::element)                              |
+----------+---------------------------------------------------------------------------------------------------------------+

## Les axes nodaux abrégés (3/4) ##

+----------+---------------------------------------------------------------------------------------------------------------+
|Opérateur | Description                                                                                                   |
+==========+===============================================================================================================+
|../element|sélectionne tous les éléments element sous l'élément parent du noeud courant (preceding::element)              |
+----------+---------------------------------------------------------------------------------------------------------------+
|//element |sélectionne tous les éléments element descendants du noeud courant à quelque niveau de profondeur que ce soit  |
+----------+---------------------------------------------------------------------------------------------------------------+

## Les axes nodaux abrégés (4/4) ##

+----------+---------------------------------------------------------------------------------------------------------------+
|Opérateur | Description                                                                                                   |
+==========+===============================================================================================================+
|@attribut |sélectionne tous les attributs attribut du noeud courant (attribute::attribut)                                 |
+----------+---------------------------------------------------------------------------------------------------------------+
|\|        |correspond à un ou                                                                                             |
+----------+---------------------------------------------------------------------------------------------------------------+

## Les opérateurs (1/3) ##

+---------+---------------------------------------+
|Opérateur|Description                            |
+=========+=======================================+
|or       |représente un OU logique               |
+---------+---------------------------------------+
|and      |représente un ET logique               |
+---------+---------------------------------------+
|not()    |signifie la négation ou NON logique    |
+---------+---------------------------------------+
|\|       |permet la sélection de plusieurs motifs|
+---------+---------------------------------------+
|=        |représente l'égalité                   |
+---------+---------------------------------------+
|!=       |signifie différent de                  |
+---------+---------------------------------------+

## Les opérateurs (2/3) ##

+---------+---------------------------------------+
|Opérateur|Description                            |
+=========+=======================================+
|<        |signifie inférieur à                   |
+---------+---------------------------------------+
|<=       |signifie inférieur ou égal à           |
+---------+---------------------------------------+
|\>       |signifie supérieur à                   |
+---------+---------------------------------------+
|\>=      |signifie supérieur ou égal à           |
+---------+---------------------------------------+

## Les opérateurs (3/3) ##

+---------+---------------------------------------+
|Opérateur|Description                            |
+=========+=======================================+
|\+       |effectue une addition                  |
+---------+---------------------------------------+
|\-       |effectue une soustraction              |
+---------+---------------------------------------+
|div()    |effectue une division                  |
+---------+---------------------------------------+
|mod()    |effectue un modulo                     |
+---------+---------------------------------------+

## Les prédicats (1/2) ##

+--------------------+---------------------------------------------------------------------------------------------------------+
|Prédicat            |Description                                                                                              |
+====================+=========================================================================================================+
|element             |sélectionne tous les éléments element fils du noeud courant                                              |
+--------------------+---------------------------------------------------------------------------------------------------------+
|element[n]          |sélectionne le nième élément element dans le noeud courant                                               |
+--------------------+---------------------------------------------------------------------------------------------------------+
|element[elt]        |sélectionne dans le noeud courant, l'élément element qui a comme élément fils elt                        |
+--------------------+---------------------------------------------------------------------------------------------------------+

## Les prédicats (2/2) ##

+--------------------+---------------------------------------------------------------------------------------------------------+
|Prédicat            |Description                                                                                              |
+====================+=========================================================================================================+
|[elt="valeur"]      |sélectionne dans le noeud courant, l'élément ayant pour fils un noeud elt qui a une valeur égale à valeur|
+--------------------+---------------------------------------------------------------------------------------------------------+
|element[@attribut]  |sélectionne dans le noeud courant, l'élément element qui possède un attribut attribut                    |
+--------------------+---------------------------------------------------------------------------------------------------------+
|[@attribut='valeur']|sélectionne dans le noeud courant, l'élément dont l'attribut attribut a une valeur égale à valeur        |
+--------------------+---------------------------------------------------------------------------------------------------------+

## Quelques fonctions nodales (1/3) ##

+--------------------------------+------------------------------------------------------------------------------------------------------------+
|Fonction                        |Description                                                                                                 |
+================================+============================================================================================================+
|count(ensemble_noeud)           |retourne le nombre de noeud dans l'ensemble de noeuds passé en argument                                     |
+--------------------------------+------------------------------------------------------------------------------------------------------------+
|current()                       |retourne le noeud courant                                                                                   |
+--------------------------------+------------------------------------------------------------------------------------------------------------+
|document(objet, ensemble_noeud) |fournit un chemin pour retrouver d'autres ressources XML à l'intérieur d'une feuille de style de            |
|                                |transformation au-delà des données fournies par l'entrée courante                                           |
+--------------------------------+------------------------------------------------------------------------------------------------------------+

## Quelques fonctions nodales (2/3) ##

+--------------------------------+------------------------------------------------------------------------------------------------------------+
|Fonction                        |Description                                                                                                 |
+================================+============================================================================================================+
|id("identifiant")               |sélectionne l'élément dans le noeud courant par son identifiant                                             |
+--------------------------------+------------------------------------------------------------------------------------------------------------+
|last()                          |retourne un nombre égal à la dimension contextextuelle de provenant du contexte d'évaluation de l'expression|
+--------------------------------+------------------------------------------------------------------------------------------------------------+
|name(noeuds)                    |retourne une chaîne de caractères contenant un nom qualifié représentant le nom étendu du noeud dans        |
|                                |l'ensemble de noeuds passé en argument qui est le premier dans l'ordre du document                          |
+--------------------------------+------------------------------------------------------------------------------------------------------------+

## Quelques fonctions nodales (3/3) ##

+--------------------------------+------------------------------------------------------------------------------------------------------------+
|Fonction                        |Description                                                                                                 |
+================================+============================================================================================================+
|node-set(chaîne)                |convertit une arborescence à l'intérieur d'un ensemble de noeuds. Le noeud résultant contient toujours un   |
|                                |unique noeud et le chemin du noeud de l'arbre                                                               |
+--------------------------------+------------------------------------------------------------------------------------------------------------+
|position()                      |retourne un nombre représentant la position du noeud courant à l'intérieur du noeud parent                  |
+--------------------------------+------------------------------------------------------------------------------------------------------------+

## Quelques fonctions nodales (1/4) ##

+-----------------------------------+----------------------------------------------------------------------------------------------------------------+
|Opérateur                          |Description                                                                                                     |
+===================================+================================================================================================================+
|concat(chaîne1,chaîne2,...)        |concatène les chaînes de caractères passées en argument                                                         |
+-----------------------------------+----------------------------------------------------------------------------------------------------------------+
|contains(contenant,contenu)        |retourne true si la première chaîne de caractères contient la seconde, sinon renvoie false                      |
+-----------------------------------+----------------------------------------------------------------------------------------------------------------+

## Quelques fonctions nodales (2/4) ##

+-----------------------------------+----------------------------------------------------------------------------------------------------------------+
|Opérateur                          |Description                                                                                                     |
+===================================+================================================================================================================+
|normalize-space(chaîne)            |retourne l'argument chaîne après suppression des espaces superflus                                              |
+-----------------------------------+----------------------------------------------------------------------------------------------------------------+
|starts-with(chaîne,chaîne)         |retourne true si la première chaîne commence avec les mêmes caractères que la seconde, sinon, elle renvoie false|
+-----------------------------------+----------------------------------------------------------------------------------------------------------------+

## Quelques fonctions nodales (3/4) ##

+-----------------------------------+----------------------------------------------------------------------------------------------------------------+
|Opérateur                          |Description                                                                                                     |
+===================================+================================================================================================================+
|string(ensemble_noeud)             |convertit son argument en chaîne de caractères                                                                  |
+-----------------------------------+----------------------------------------------------------------------------------------------------------------+
|string-length(chaîne)              |retourne le nombre de caractères dans la chaîne                                                                 |
+-----------------------------------+----------------------------------------------------------------------------------------------------------------+
|substring(chaîne,position,longueur)|retourne la sous-chaîne du premier argument démarrant à la position et à la longueur spécifiées                 |
+-----------------------------------+----------------------------------------------------------------------------------------------------------------+

## Quelques fonctions nodales (4/4) ##

+-----------------------------------+----------------------------------------------------------------------------------------------------------------+
|Opérateur                          |Description                                                                                                     |
+===================================+================================================================================================================+
|substring-after(chaîne,marqueur)   |retourne la sous-chaîne du premier argument résultant de la suppression de tous les caractères précédant le     |
|                                   |marqueur localisé dans la chaîne                                                                                |
+-----------------------------------+----------------------------------------------------------------------------------------------------------------+
|substring-before(chaîne,marqueur)  |retourne la sous-chaîne du premier argument résultant de la suppression de tous les caractères suivant le       |
|                                   |marqueur localisé dans la chaîne                                                                                |
+-----------------------------------+----------------------------------------------------------------------------------------------------------------+

## Les templates (1/3) ##

* l'élément `template` permet de définir une règle de modèle, c'est-à-dire,
  par l'intermédiaire de la valeur de l'attribut `match`, des éléments
  seront prêts pour l'application de règles de style :

```xml
<xsl:template match="motif">
...
</xsl:template>
```

## Les templates (2/3) ##

* Il suffit ensuite d’appliquer l’élément `<xsl:apply-templates select="motif">`{.xml}
  pour appeler le template et l’appliquer à la bonne cible ;
* Les règles de modèle permettent d’effectuer la même mise en forme pour
  tout élément identique (pour chaque motif qui correspond) ;

## Les templates (3/3) ##

* On peut aussi utiliser la forme `<xsl:template name="nom">`{.xml} et le
  template se comporte alors comme une fonction ! Pour l’appeler on
  utilise `<xsl:call-template name="nom">`{.xml} avec éventuellement des paramères.

## La récupération de valeur ##

* Pour récupérer la valeur d’un nœud, on utilise `<xsl:value-of select="motif">`{.xml}
  et on récupérera alors la partie textuelle contenue dans le motif ;
* Attention: cette instruction XSL ne peut gérer qu’un élément à la fois
  contrairement à `<xsl:apply-templates>`{.xml} qui permet d’assurer la récursivité
  d’une opération sur tous les motifs qui correspondent.

## Gérer des éléments et des attributs ##

* On utilise `<xsl:element>`{.xml} et `<xsl:attribute>`{.xml} pour pouvoir
    créer des éléments et attributs en sortie. L’attribut `name` correspond au
    nom de l’élément ou de l’attribut :

```xml
<xsl:element name="nom" namespace="URI" use-attribute-sets="nom_jeu_attributs">
    <xsl:attribute name="a" namespace="URI">Valeur de l'attribut</xsl:attribute> 
    <xsl:attribute-set name="nom_jeu_attributs">  
        <xsl:attribute name="a1">Valeur de l'attribut</xsl:attribute>  
        <xsl:attribute name="a2">Valeur de l'attribut</xsl:attribute>  
    </xsl:attribute-set>
    ... <!-- autres éléments éventuels -->
</xsl:element> 
```

## Les tests conditionnels ##

* L'élément `<xsl:choose>`{.xml} combiné avec `<xsl:when>`{.xml} et
    `<xsl:otherwise>`{.xml}, permet de construire des tests conditionnels à
    l'instar des commandes switch de Java ou Javascript :

```xml
<xsl:choose>   
    <xsl:when test="condition">     
         instructions...   
    </xsl:when>  
     ...   
    <xsl:otherwise>     
         instructions...  
    </xsl:otherwise>
</xsl:choose>
```

## Les tests ##

* On peut aussi réaliser un test simple à l’aide de la balise `<xsl:if>`{.xml}
    de la manière suivante :

```xml
<xsl:if test="condition">
    instructions...
</xsl:if>
```

## Copie d ’un morceau de l’arbre ##

* On peut copier une partie de l’arbre à parti d’un nœud courant avec
    l'élément `<xsl:copy>`{.xml} de la manière suivante :

```xml
<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="*|@*|comment()|text()">
    <xsl:copy>
        <xsl:apply-templates select="*|text()"/>
    </xsl:copy>
    </xsl:template>
</xsl:stylesheet>
```

## Les boucles ##

* L'élément `<xsl:for-each>`{.xml} permet d'appliquer des règles de style sur
    chaque nœud identique d'un template. Les noeuds sont identifiés par un
    motif spécifié par un attribut `select` :

```xml
<xsl:for-each select="motif">
    instructions...
</xsl:for-each>
```

## Exercice n°5 ##

* Transformer le fichier XML des stagiaires en une page web :
    * Écrire le fichier XSL ;
    * Valider-le ;
    * Trouvez un service en ligne qui effectuera la transformation.

```bash
$ xsltproc -o stagiaires.html stagiaires.xsl stagiaires.xml
```

# Des questions ? #

## Merci de votre attention ! ##

À voir sur le net :

* http://xml.developpez.com/cours/
* http://www.liafa.jussieu.fr/~carton/Enseignement/XML/Cours/
* http://www.gchagnon.fr/cours/xml/index.html

![](img/by-nc-sa.png)

<div class="notes">
* Validateurs :
    * [W3C](https://validator.w3.org/ "W3C")
    * [Validome DTD](http://www.validome.org/grammar/ "Validome DTD")
    * [Validome XML](http://www.validome.org/xml/ "Validome XML")
    * [W3 School](http://www.w3schools.com/xml/xml_validator.asp "W3 School")
    * [New Studio](http://xmlvalidator.new-studio.org/ "New Studio")
* document généré via :

```bash
pandoc -s -t revealjs --slide-level=2 --section-divs --template=template/ign-ensg-revealjs.html --email-obfuscation=none --css=css/ign.css --highlight-style=kate -V revealjs-url=externals/reveal.js -V slideNumber=true -V transition=none -o XML2-A-slides.html XML2-A-slides.md
```

* version des diapositives : 2.2.0
</div>

