#!/bin/bash
# Script tự động deploy: tắt app -> git pull -> bật lại
# Dùng: bash deploy.sh
# Chạy từ thư mục gốc project trên server: /home/tvr/flycam-gis-viewer

set -e
cd /home/tvr/flycam-gis-viewer

echo "[1/3] Dung app hien tai..."
fuser -k 8000/tcp 2>/dev/null && echo "  -> Da dung." || echo "  -> App chua chay, bo qua."
sleep 1

echo "[2/3] Git pull code moi nhat..."
git pull

echo "[3/3] Khoi dong lai app..."
nohup npm run start -- --port 8000 --public >> app.log 2>&1 &
echo "  -> Dang chay (PID $!), log ghi vao app.log"
echo ""
echo "Xong! Mo trinh duyet: http://14.224.210.210:8000/Apps/HelloWorld.html"
