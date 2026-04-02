#!/bin/bash

# ====================================
# Script chạy Newman - Nhóm 5
# Kiểm thử API với Postman
# ====================================

# Màu sắc cho output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${GREEN}========================================${NC}"
echo -e "${GREEN}  Nhóm 5 - Kiểm thử API với Postman    ${NC}"
echo -e "${GREEN}========================================${NC}"

# Đường dẫn
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$(dirname "$SCRIPT_DIR")"
COLLECTION="$PROJECT_DIR/postman/Nhom5-API-Testing.postman_collection.json"
ENVIRONMENT="$PROJECT_DIR/postman/Test_Env.postman_environment.json"
REPORT_DIR="$PROJECT_DIR/reports"

# Kiểm tra Newman đã cài chưa
if ! command -v newman &> /dev/null; then
    echo -e "${YELLOW}Newman chưa được cài đặt. Đang cài đặt...${NC}"
    npm install -g newman newman-reporter-htmlextra
fi

# Tạo thư mục reports nếu chưa có
mkdir -p "$REPORT_DIR"

# Tạo tên file báo cáo với timestamp
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
REPORT_FILE="$REPORT_DIR/report_$TIMESTAMP.html"

echo -e "${YELLOW}Đang chạy test...${NC}"
echo ""

# Chạy Newman với HTML reporter
newman run "$COLLECTION" \
    -e "$ENVIRONMENT" \
    -r htmlextra \
    --reporter-htmlextra-export "$REPORT_FILE" \
    --reporter-htmlextra-title "Nhóm 5 - Báo cáo Kiểm thử API" \
    --reporter-htmlextra-titleSize 4 \
    --reporter-htmlextra-showOnlyFails false \
    --reporter-htmlextra-omitResponseBodies false

# Kiểm tra kết quả
if [ $? -eq 0 ]; then
    echo ""
    echo -e "${GREEN}========================================${NC}"
    echo -e "${GREEN}  ✓ Test hoàn thành thành công!        ${NC}"
    echo -e "${GREEN}========================================${NC}"
    echo -e "Báo cáo HTML: ${YELLOW}$REPORT_FILE${NC}"
else
    echo ""
    echo -e "${RED}========================================${NC}"
    echo -e "${RED}  ✗ Có test case thất bại!            ${NC}"
    echo -e "${RED}========================================${NC}"
    echo -e "Kiểm tra báo cáo: ${YELLOW}$REPORT_FILE${NC}"
fi

echo ""
echo "Mở báo cáo? (y/n): "
read -r answer
if [ "$answer" = "y" ]; then
    if command -v xdg-open &> /dev/null; then
        xdg-open "$REPORT_FILE"
    elif command -v open &> /dev/null; then
        open "$REPORT_FILE"
    else
        echo "Không thể mở tự động. Hãy mở file: $REPORT_FILE"
    fi
fi
