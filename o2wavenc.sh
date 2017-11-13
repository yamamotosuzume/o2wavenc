#!/bin/bash
function usage {
	cat <<EOF

$(basename ${0%.*}) by Yamamotosuzume (CHOSUIDO).
  .wavを元に.oggと.mp4を生成します。

  ※oggの変換には vorbis-tools が必要になります。
  '$ brew install vorbis-tools'
  などを叩いて各自入手してください。

Usage:
    $(basename ${0}) [options] inputfile(folder pass) [outputfile(folder pass)]

Options:
    --version, -v     print the version number
    --help, -h        print this help text

Inputfile:
    第一引数には、変換する.wavファイルが入っているフォルダのパスを指定します。

Outputfile:
    第二引数には、出力先のフォルダパスを指定します。
    何も指定しなかった場合には、変換元のフォルダ内に出力されます。

EOF
}

function version {
	echo "$(basename ${0%.*}) version 1.0.1 "
}

function run {
	if [ "$2" != "" ]
	then
		for file in `find $1 -name "*.wav"`; do
			filename=${file##*/}
			filename_without_extension=${filename%.*}
			outputpass="${2}/${filename_without_extension}"
		 	oggenc -q 8 $file -o "${outputpass}.ogg"
		 	afconvert -f mp4f -d 'aac' $file -o "${outputpass}.mp4"
		done
	else
		for file in `find $1 -name "*.wav"`; do
		 	oggenc -q 8 $file
		 	afconvert -f mp4f -d 'aac' $file
		done
	fi
}

case ${1} in
	help|--help|-h)
		usage
	;;

	version|--version|-v)
		version
	;;

	*)
		if [ "$1" == "" ]
		then
			echo "ERROR: 引数が入力されていません" 
		else
			run $1 $2
		fi
	;;
esac
