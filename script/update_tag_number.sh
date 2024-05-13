#!/bin/bash

# 获取最新的 tag
echo "工作空间是 $GITHUB_WORKSPACE"
cd $GITHUB_WORKSPACE
latest_tag=$(git describe --tags --abbrev=0)

# 从最新的 tag 中提取版本号部分作为变量 version
version=$(echo $latest_tag | grep -Eo 'v[0-9]+\.[0-9]+\.[0-9]+')

# 从 tag 中提取最后一个数字作为 nightly 版本号的基数
last_number=$(echo $latest_tag | grep -Eo '[0-9]+-nightly' | cut -d'-' -f1)

# 计算下一个 nightly 版本号的最后一位数字
next_number=$((last_number + 1))

# 设置新的 nightly 版本号
new_tag="$version.$next_number-nightly"

echo "新的 nightly 版本号为: $new_tag"