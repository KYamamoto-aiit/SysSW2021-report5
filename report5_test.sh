#!/bin/bash
#
# 2つの自然数の最大公約数を求めるスクリプト(report5.sh)をテストするスクリプト
# 作成者：山本健
# 作成日：2021/08/05
# 使い方：report5.shと同じディレクトリに配置して実行してください

# エラ〜メッセージ
msg_argcnt="実行するためには2つの引数が必要です。"
msg_natural="引数は自然数で入力してください。"
msg_result="最大公約数はgcfです。"

# 引数が1つの場合
res=`./report5.sh 10`
if [ $res != $msg_argcnt ]; then
	echo "失敗しました。（引数が1つの場合）"
	exit 1
fi

# 引数が3つの場合
res=`./report5.sh 10 20 35`
if [ $res != $msg_argcnt ]; then
	echo "失敗しました。（引数が3つの場合）"
	exit 1
fi

# 第一引数が自然数でない場合
res=`./report5.sh a 10`
if [ $res != $msg_natural ]; then
	echo "失敗しました。 （第一引数が自然数でない場合）"
	exit 1
fi

# 第二引数が自然数でない場合
res=`./report5.sh 10 b`
if [ $res != $msg_natural ]; then
	echo "失敗しました。（第二引数が自然数でない場合）"
	exit 1
fi

# 計算結果が正しくない場合
res=`./report5.sh 10 45`
if [ $res != ${msg_result/gcf/5} ]; then
	echo "失敗しました。（計算結果が正しくない場合）"
	exit 1
fi

echo "成功しました。"
exit 0
