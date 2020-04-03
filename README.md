# links_Aplicativos

[![Version](https://img.shields.io/cocoapods/v/links_Aplicativos.svg?style=flat)](https://cocoapods.org/pods/links_Aplicativos)
[![License](https://img.shields.io/cocoapods/l/links_Aplicativos.svg?style=flat)](https://cocoapods.org/pods/links_Aplicativos)
[![Platform](https://img.shields.io/cocoapods/p/links_Aplicativos.svg?style=flat)](https://cocoapods.org/pods/links_Aplicativos)

## Example

Para executar o projeto de exemplo, clone o repositório e execute primeiro `pod install` no diretório exmple.

## Requerimentos

iOS 8.0 ou superior

## Instalação
links_Aplicativos está disponível no [CocoaPods](https://cocoapods.org) basta adicionar uma das seguintes linhas ao seu Podfile:

```ruby
pod 'links_Aplicativos'
```
````
pod 'links_Aplicativos', :git => 'https://github.com/cortezvinicius/links-aplicativos-ios.git'
````

## Como Usar


  * [Swift](#swift)
  * [Objective-C](#Objective-C)


# Swift


extender a Classe
````Swift
let linkAplicativos = LinksAplicativos()
````
Usar Metodos
````Swift
linkAplicativos.abrirPaginaWeb("url")
````

````Swift
linkAplicativos.abrirWhatsapp("numero", "mensagem")
````

````Swift
linkAplicativos.abrirEmail("email", "titulo", "texto")
````

````Swift
linkAplicativos.abrirMapas("nome Local", "latitude", "Longitude")
````

````Swift
linkAplicativos.abrirChamadaTelefone("numero telefone desejado")
````
# Objective-C

Entender Classe

````Objective-C
LinksAplicativos *linksAplicativos = [[LinksAplicativos alloc]init];
````
