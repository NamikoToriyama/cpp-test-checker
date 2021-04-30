# 引数の確認
if [ $# != 2 ]; then
    echo "usage: ./check.sh <name> <section_num>"
    exit
fi

echo "Start tests"
echo "---------------------------------------"

NAME=$1
DIR_NUM=$2
PASS=0
FAIL=0
# ソースを開く
files="$NAME/section$DIR_NUM/*"
for filepath in $files; do
    # コンパイル
    g++ -o a.o $filepath
    ARR=(${filepath//// })
    FILENAME=(${ARR[2]//./ })
    g++ -o a.o $NAME/section$DIR_NUM/$FILENAME.cpp

    # テストケースを確認
    test_dir="test/section$DIR_NUM/$FILENAME-[0123456789]"
    for filepath in $test_dir; do
        EXPECTED=$(./a.o < $filepath)
        RESULT=$(cat $filepath.expected)

        # あってるか確認
        if [ $EXPECTED = $RESULT ]; then
        PASS=$(expr $PASS + 1)
        echo "Passed Section$DIR_NUM $filepath"
        else
        FAIL=$(expr $FAIL + 1)
        echo "Failed Section$DIR_NUM $filepath"
        echo "Result: $RESULT, Expected: $EXPECTED"
        fi
        echo "---------------------------------------"
    done
done

# ファイルを削除
rm a.o

echo "total $(expr $PASS + $FAIL) cases"
echo "$PASS cases passed, $FAIL cases failed" 
