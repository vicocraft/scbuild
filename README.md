**ARQUIVADO**! O desenvolvimento foi movido para [este repositório único](https://github.com/vicocraft/vicocraft)!

**ARCHIVED**! Developement was moved for [here](https://github.com/vicocraft/vicocraft)!

# Schematic Builder para o ComputerCraft

*English user? Check README_EN.md*

Esse programa LUA implementa um construtor básico de arquivos ".schematic". Ele lê um arquivo schematic, pede todos os materiais necessários e o constrói.
O arquivo .schematic deve ter o formato MCEdit/WorldEdit e deve estar **descompactado** (por padrão os arquivos .schematic são um container gzip com o arquivo com as informações dentro dele. Novamente, seção **uso**).

## Creditos

O script foi desenvolvido originalmente por Orwell. Clique [aqui](http://www.computercraft.info/forums2/index.php?/topic/1949-turtle-schematic-file-builder/) para o tópico original no fórum do ComputerCraft (**inglês**).

## À Fazer (Prioridade)

* Adicionar suporte à blocos atuais (1.7+);

## À Fazer (Secundário)

* Adicionar script do Syli para conversão dos arquivos schematic descompactados pra texto (pra usar o pastebin);
* Implementar GZIP (impossível pra mim?);

## Já feito

* Adicionado "suporte" à sementes pra assinalar ar e blocos indesejados (pra que nada seja colocado pela turtle);

## Instalação

* [Instale o mod ComputerCraft](http://www.computercraft.info/download/) (consulte o link para informações);
* Clone (ou baixe como .zip) a branch *master*;
* Copie o arquivo `scbuild` e a pasta `schematics` (opcional) para a pasta da sua turtle;

## Uso

Baixe um arquivo .schematic e descompacte-o (geralmente: botão direito -> extrair aquivos, ou use um gerenciador de arquivos compactados, como o 7-zip).
Copie o arquivo descompactado pra pasta `schematics` (para melhor organização) da turtle desejada.
Então use: `scbuild schematics\<nome do arquivo descompactado>`
A turtle então vai pedir por cada materian necessário. Para cada um, assinale um slot da turtle (1-16) contendo o material correspondente. Se você não quer usar o material ou se for um bloco de ar adicione sementes de trigo e dê um Enter.
Mais um Enter e ela vai começar a construir!

## Licença

Será adicionada após contato com o autor original
