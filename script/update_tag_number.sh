#!/bin/bash

# 获取最新的 tag
echo "工作空间是 $GITHUB_WORKSPACE"

target_dir="/tmp/zbw-test-actions"

# 检查目标目录是否存在
if [ -d "$target_dir" ]; then
    # 如果目录存在，则删除目录
    rm -rf "$target_dir"
    echo "已删除目录 $target_dir"
fi

# 克隆仓库到目标目录
git clone git@github.com:Zhangbaowen-Hashdata/zbw-test-actions.git "$target_dir"
echo "已克隆仓库到 $target_dir"
cd /tmp/zbw-test-actions
latest_tag=$(git describe --tags --abbrev=0)
# 从最新的 tag 中提取版本号部分作为变量 version
main_version=$(echo $latest_tag | grep -Eo 'v[0-9]+\.[0-9]+\.[0-9]+')
# 从 tag 中提取最后一个数字作为 nightly 版本号的基数
echo $latest_tag | awk -F'[.]' '{print $4}' | cut -d'-' -f1

# 计算下一个 nightly 版本号的最后一位数字
next_number=$((last_number + 1))

# 设置新的 nightly 版本号
new_tag="$main_version.$next_number-nightly"

echo "新的 nightly 版本号为: $new_tag"

cd $GITHUB_WORKSPACE