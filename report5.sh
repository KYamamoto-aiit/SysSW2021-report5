#!/bin/bash
#
# 2つの自然数の最大公約数を求めるスクリプト
# 作成者：山本健
# 作成日：2021/08/05
# 使い方：2つの自然数を引数として実行してください

# 引数の個数をチェックする
if [ $# -ne 2 ]; then
	# 引数が2つでない場合
	echo "実行するためには2つの引数が必要です。"
	exit 1
fi

# 引数が自然数かをチェックする関数
# 戻り値：自然数なら0、そうでなければ1
function test_natural() {
if [[ ! $1 =~ [1-9][0-9]* ]]; then
	# 自然数でなければ
	return 1
fi
return 0
}

# 1つ目の引数をチェック
test_natural $1
natural=$?

# 2つ目の引数をチェック
test_natural $2
natural=`expr $natural + $?`

# 1つでも自然数でなければ
if [ $natural -gt 0 ]; then
	echo "引数は自然数で入力してください。"
	exit 1
fi

# ここからユークリッドの互除法
a=0
b=0

if [ $1 -gt $2 ]; then
# 大きい方の自然数をaとし、小さい方の自然数をbとする
	a=$1; b=$2
else
	a=$2; b=$1	
fi

# rはa÷bの余り
r=`expr $a % $b`
# rが0になるまで繰り返す
while [ $r -ne 0 ]; do
	a=$b
	b=$r
	r=`expr $a % $b`
done

# 結果を表示する（空白は削除する）
echo "最大公約数は $b です。" | sed 's/ //g'
exit 0
