# o2wavenc

.wavを元に.oggと.mp4を生成します。  

※oggの変換には vorbis-tools が必要になります。
```
$ brew install vorbis-tools
```
などを叩いて各自入手してください。

## Usage:
```
$ sh o2wavenc.sh [options] inputfile(folder pass) [outputfile(folder pass)]
```

## Options
|コマンド|説明|
|---|---|
|--version, -v|バージョン情報を表示|
|--help, -h|ヘルプテキストを表示|

## Inputfile
第一引数には、変換する.wavファイルが入っているフォルダのパスを指定します。

## Outputfile
第二引数には、出力先のフォルダパスを指定します。  
何も指定しなかった場合には、変換元のフォルダ内に出力されます。
