read -p "测试参数:" name score
if [ $name == "a" ]; then
  echo "yes"
elif [ $name == "b" ]; then
  echo "no"
else
  echo "unknown"
fi

if echo "$score" | grep "[a-zA-Z]" >/dev/null; then
  printf "非法分数"

elif echo "$score" | grep "[0-9]" >/dev/null; then
  if [ $score -gt 100 ] || [ $score -lt 0 ]; then
    printf "分数超出合理范围"
  elif [ $score -ge 85 ]; then
    printf "优秀"
  else
    printf "其他"
  fi
else
  printf "非法错误"
fi
printf "\n"
for ((i = 1; i < 10; i++)); do
  for ((j = 1; j <= $i; j++)); do
    printf "$j*$i=%2d " $((j * i))
  done
  echo " "
done

i=1
while ((i < 10)); do
  j=1
  while ((j <= i)); do
    printf "$j*$i=%2d " $((j * i))
    let j++
  done
  echo ""
  let i++
done

case $score in
[8-9][5-9] | 100)
  echo "A"
  ;;
[7-8][0-4])
  echo "B"
  ;;
[6][0-9])
  echo "C"
  ;;
*)
  echo "D"
  ;;
esac
