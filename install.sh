
#!/bin/bash

# 下載 Anaconda 安裝檔案
wget https://repo.anaconda.com/archive/Anaconda3-2025.06-0-Linux-x86_64.sh -O Anaconda3-2025.06-0-Linux-x86_64.sh

# 執行安裝
bash Anaconda3-2025.06-0-Linux-x86_64.sh

# 確認安裝是否成功
if [ $? -ne 0 ]; then
    echo "Anaconda 安裝失敗，請檢查錯誤訊息。"
    exit 1
fi

# 問使用者是否要創建虛擬環境
read -p "是否要創建 lab 與 llm 虛擬環境？(y/n): " create_env

if [[ "$create_env" =~ ^[Yy]$ ]]; then
    # 初始化 Conda
    source ~/anaconda3/bin/activate

    # 創建 lab 虛擬環境
    conda create -n lab python=3.12 -y
    if [ $? -eq 0 ]; then
        echo "lab 虛擬環境創建成功。"
    else
        echo "lab 虛擬環境創建失敗。"
    fi

    # 創建 llm 虛擬環境
    conda create -n llm python=3.12 -y
    if [ $? -eq 0 ]; then
        echo "llm 虛擬環境創建成功。"
    else
        echo "llm 虛擬環境創建失敗。"
    fi
else
    echo "已跳過虛擬環境創建。"
fi

# 提示安裝完成
echo "Anaconda 安裝與環境配置完成。"
