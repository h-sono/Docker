#! /bin/bash

testList=("test1" "test2" "test3")

for l in ${testList[@]}; do
  echo $l
done

for i in {1..10}; do
  echo "${i}番"
done

var="hello world"
echo $var
echo ${var}
echo "${var}"

if [ 2 -eq 2 ] 
  then
    echo "True"
  else
    echo "False"
fi

# ファイル名
echo $0
# シェルファイル実行時の1番目の引数
# echo $1
# シェルファイル実行時の2番目の引数
# echo $2
# 引数の数
# echo $#
# プロセス番号
# echo $$
# 全引数リスト
# echo $*
