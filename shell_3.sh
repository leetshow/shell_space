if [ -e readme.md ]; then
  printf "readme exist"
else
  printf "readme not exist"
fi

read -p "请输入你的名字:" name

if [ -n "$name" ]; then
  printf "你的名字是%s:" "$name"
else
  printf "请输入你的名字"
fi
