# Báo Cáo Lỗi - Nhóm 5
## Kiểm Thử API với Postman

---

## Danh Sách Lỗi Phát Hiện

| BUG_ID | TC_ID | Nội dung lỗi | Mức độ | Ghi chú |
|--------|-------|--------------|--------|---------|
| BUG_01 | | | High/Medium/Low | |
| BUG_02 | | | High/Medium/Low | |
| BUG_03 | | | High/Medium/Low | |

---

## Mức độ lỗi (Severity)

- **High**: Lỗi nghiêm trọng, ảnh hưởng đến chức năng chính
  - Ví dụ: API không trả về token khi đăng nhập đúng
  - Ví dụ: Server crash khi nhận request
  
- **Medium**: Lỗi trung bình, ảnh hưởng đến một số chức năng
  - Ví dụ: Response time quá chậm (> 2s)
  - Ví dụ: Thông báo lỗi không rõ ràng
  
- **Low**: Lỗi nhỏ, không ảnh hưởng nhiều đến chức năng
  - Ví dụ: Typo trong message
  - Ví dụ: Thiếu field không quan trọng trong response

---

## Template Mô Tả Chi Tiết Lỗi

### BUG_XX: [Tên lỗi]

**TC liên quan:** TC_XXX_XX

**Mô tả:**
[Mô tả chi tiết lỗi]

**Bước tái hiện:**
1. [Bước 1]
2. [Bước 2]
3. [Bước 3]

**Expected Result:**
[Kết quả mong đợi]

**Actual Result:**
[Kết quả thực tế]

**Evidence:**
[Screenshot hoặc response body]

**Mức độ:** High/Medium/Low

**Đề xuất sửa:**
[Đề xuất cách sửa nếu có]

---

## Đánh Giá Chung

### 1. Về bảo mật
- [ ] API có giới hạn số lần request không?
- [ ] Token có thời gian hết hạn không?
- [ ] Có validate input để chống SQL injection không?
- [ ] Error message có lộ thông tin nhạy cảm không?

### 2. Về hiệu năng
- [ ] Response time trung bình: _____ ms
- [ ] Response time cao nhất: _____ ms
- [ ] Response time thấp nhất: _____ ms

### 3. Về chức năng
- [ ] Tỷ lệ Pass: _____% (___/_____ test cases)
- [ ] Tỷ lệ Fail: _____% (___/_____ test cases)

### 4. Nhận xét tổng quan
[Nhận xét về chất lượng API, điểm mạnh, điểm yếu]

---

## Kết Luận

[Kết luận về chất lượng tổng thể của API được test]

---

*Báo cáo được tạo bởi: Nhóm 5*
*Ngày: ____/____/2024*
