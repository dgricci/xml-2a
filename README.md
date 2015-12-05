# xml-2a

Cours d'initiation à XML (deuxième partie).

# Dépendances logiciels #

Plate-forme de test : Ubuntu 14.04.2

* `node.js`
* `npm`
* `reveal.js` (Cf. [ci-dessous](#user-content-post-installation-de-revealjs))
* `pandoc` (Cf. [ci-dessous](#user-content-dépendance-pandoc))

Pour cloner complètement ce projet :

```
$ git clone --recursive https://github.com/dgricci/xml-1a
```

## Post-installation de reveal.js ##

### Préalable ###

* Installation de Grunt :

```bash
$ sudo http_proxy=host:port https_proxy=host:port npm install -g grunt-cli
# certains répertoires de $HOME/.npm appartiennent à root avec l'installation
# de grunt-cli en global, les re-donner à $USER :
$ sudo chown -R $USER:$(groups $USER | sed -e 's/^.* : //' | cut -d\  -f1) $HOME/.npm/{nopt,minimatch,glob,lodash,inherits}
```

### Préparation à l'utilisation de reveal.js ###

Dans le répertoire du projet :

```bash
$ cd externals/reveal.js
$ http_proxy=host:port https_proxy=host:port npm install
$ grunt cssmin uglify
```

## Dépendance pandoc ##

Il faut installer le paquet `libghc-highlighting-kate-dev` :

```
$ sudo apt-get install libghc-highlighting-kate-dev
```

Il est possible de tester la génération d'un diaporama avec :

```bash
$ pandoc -s -t revealjs -i --slide-level=1 --self-contained -o README.html README.md
```

Puis d'ouvrir le fichier `README.html` dans un navigateur.

