# Bảng Test Cases - Nhóm 5
## Kiểm Thử API với Postman

---

## 1. REQRES.IN API

### 1.1. User Module

| TC_ID | Tên Test Case | Method + Endpoint | Pre-condition | Input Data | Expected Result |
|-------|---------------|-------------------|---------------|------------|-----------------|
| TC_REQ_01 | Lấy danh sách users thành công | GET /api/users?page=1 | None | page=1 | Status 200, response chứa "data" array |
| TC_REQ_02 | Lấy single user thành công | GET /api/users/2 | User ID=2 tồn tại | id=2 | Status 200, response chứa user info |
| TC_REQ_03 | Lấy user không tồn tại | GET /api/users/999 | None | id=999 | Status 404 |
| TC_REQ_04 | Tạo user mới thành công | POST /api/users | None | {"name":"Khang","job":"QA"} | Status 201, response chứa "id" và "createdAt" |
| TC_REQ_05 | Cập nhật user thành công | PUT /api/users/2 | User ID=2 tồn tại | {"name":"Updated","job":"Dev"} | Status 200, response chứa "updatedAt" |
| TC_REQ_06 | Xóa user thành công | DELETE /api/users/2 | User ID=2 tồn tại | id=2 | Status 204 |

### 1.2. Auth Module

| TC_ID | Tên Test Case | Method + Endpoint | Pre-condition | Input Data | Expected Result |
|-------|---------------|-------------------|---------------|------------|-----------------|
| TC_REQ_07 | Đăng ký thành công | POST /api/register | None | {"email":"eve.holt@reqres.in","password":"pistol"} | Status 200, response chứa "token" |
| TC_REQ_08 | Đăng ký thiếu password | POST /api/register | None | {"email":"eve.holt@reqres.in"} | Status 400, message "Missing password" |
| TC_REQ_09 | Đăng nhập thành công | POST /api/login | Tài khoản đã đăng ký | {"email":"eve.holt@reqres.in","password":"cityslicka"} | Status 200, response chứa "token" |
| TC_REQ_10 | Đăng nhập thiếu email | POST /api/login | None | {"password":"cityslicka"} | Status 400, message "Missing email or username" |
| TC_REQ_11 | Đăng nhập sai password | POST /api/login | None | {"email":"eve.holt@reqres.in","password":"wrong"} | Status 400 |

---

## 2. RESTFUL-BOOKER API

### 2.1. Auth Module

| TC_ID | Tên Test Case | Method + Endpoint | Pre-condition | Input Data | Expected Result |
|-------|---------------|-------------------|---------------|------------|-----------------|
| TC_BOOK_01 | Lấy token thành công | POST /auth | None | {"username":"admin","password":"password123"} | Status 200, response chứa "token" |
| TC_BOOK_02 | Lấy token với sai credentials | POST /auth | None | {"username":"wrong","password":"wrong"} | Status 200, reason "Bad credentials" |

### 2.2. Booking Module

| TC_ID | Tên Test Case | Method + Endpoint | Pre-condition | Input Data | Expected Result |
|-------|---------------|-------------------|---------------|------------|-----------------|
| TC_BOOK_03 | Lấy danh sách booking IDs | GET /booking | None | None | Status 200, response là array of booking IDs |
| TC_BOOK_04 | Lấy booking detail | GET /booking/:id | Booking tồn tại | id=1 | Status 200, response chứa booking info |
| TC_BOOK_05 | Tạo booking mới | POST /booking | None | Full booking JSON | Status 200, response chứa "bookingid" |
| TC_BOOK_06 | Cập nhật booking | PUT /booking/:id | Có token, booking tồn tại | Updated booking JSON | Status 200, response chứa updated info |
| TC_BOOK_07 | Xóa booking | DELETE /booking/:id | Có token, booking tồn tại | id | Status 201 |

---

## 3. SWAGGER PETSTORE API

### 3.1. Pet Module

| TC_ID | Tên Test Case | Method + Endpoint | Pre-condition | Input Data | Expected Result |
|-------|---------------|-------------------|---------------|------------|-----------------|
| TC_PET_01 | Thêm pet mới | POST /pet | None | Pet JSON với name, status | Status 200, response chứa pet info |
| TC_PET_02 | Lấy pet theo ID | GET /pet/:petId | Pet tồn tại | petId | Status 200, response chứa pet info |
| TC_PET_03 | Lấy pet không tồn tại | GET /pet/999999999 | None | petId=999999999 | Status 404, message "Pet not found" |
| TC_PET_04 | Tìm pet theo status | GET /pet/findByStatus?status=available | None | status=available | Status 200, response là array of pets |
| TC_PET_05 | Cập nhật pet | PUT /pet | Pet tồn tại | Updated pet JSON | Status 200 |
| TC_PET_06 | Xóa pet | DELETE /pet/:petId | Pet tồn tại | petId | Status 200 |

---

## Tổng kết Test Cases

| API | Số lượng TC | Positive | Negative |
|-----|-------------|----------|----------|
| Reqres.in | 11 | 7 | 4 |
| Restful-booker | 7 | 6 | 1 |
| Petstore | 6 | 5 | 1 |
| **Tổng** | **24** | **18** | **6** |

---

## Ghi chú
- Tất cả test cases sẽ kiểm tra thêm: Response time < 500ms
- Các API có authentication sẽ tự động lưu token vào environment variable
- Data-driven testing sẽ được áp dụng cho các test cases về User và Login
