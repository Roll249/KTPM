KẾ HOẠCH THỰC HIỆN KIỂM THỬ (DESIGN - IMPLEMENTATION - EVALUATION)
1. GIAI ĐOẠN 1: CHUẨN BỊ
Mục tiêu là xác định đối tượng để kiểm thử và xây dựng môi trường để làm việc.
1.1. Chọn API
Mô tả: Xác định xem nhóm đi kiểm thử API gì.
Ví dụ:
Reqres.in: Dễ, phù hợp cho người mới, có sẵn các API Get/Post/Put/Delete.
Restful-booker: Phức tạp hơn chút, mô phỏng hệ thống đặt phòng, yêu cầu lấy Token để tạo/sửa/xóa phòng.
Swagger Petstore: Có sẵn giao diện Swagger để đọc docs dễ dàng.
1.2. Nghiên cứu API
Mô tả: Phân tích hệ thống đã chọn.
Yêu cầu phân tích ra được:
Base URL (ví dụ: https://reqres.in/api).
Endpoints (ví dụ:  /users, /login).
Methods: GET (lấy dữ liệu), POST (tạo mới), PUT/PATCH (cập nhật), DELETE (xóa)
Cơ chế xác thực: Bearer Token, API Key, Basic Auth,...
1.3. Cài đặt môi trường
Mô tả: Xây dựng môi trường để nhóm làm việc.
Yêu cầu:
Tất cả cài đặt Postman trên Desktop.
Trưởng nhóm tạo 1 Workspace cho nhóm.
Mời các thành viên nhóm vào Workspace qua email để làm việc song song.
2. GIAI ĐOẠN 2: THIẾT KẾ KIỂM THỬ (DESIGN)
2.1. Xác định các kịch bản Test
Mô tả: Xác định các trường hợp xảy ra khi test từng API.
Ví dụ với API Login:
Positive: Đăng nhập thành công với email/pass đúng, trả về 200 OK + Token.
Negative 1: Để trống email, trả về 400 Bad Request.
Negative 2: Pass sai format hoặc sai pass, trả về 401 Unauthorized.
Bảo mật: Thử inject SQL vào trường email xem server có sập không.
2.2. Viết Test Case
Mô tả: Lập bảng chứa các Test Case (khoảng 15-20).
Yêu cầu:
TC_ID (ví dụ: TC_LOGIN_01).
Tên Test Case (ví dụ: Đăng nhập thành công).
Method + Endpoint (ví dụ: POST /api/login).
Pre-condition (ví dụ: Tài khoản đã được đăng ký).
Input Data (ví dụ: {“email”:”abc@gmail”, ”pass”:”123”}.
Expected Result (ví dụ: Status 200, Input chứa chuỗi “token”).
2.3. Chuẩn bị dữ liệu Test
Mô tả: Tạo file Excel/CSV chứa dữ liệu test.
Yêu cầu (ví dụ trong trường hợp test tài khoản): email, password, expected_status
dung@test.com, 123456, 200.
sai@test.com, abc, 401.
thieu_pass@test.com, , 400.
3. GIAI ĐOẠN 3: TRIỂN KHAI TRÊN POSTMAN (IMPLEMENTATION)
Mục tiêu là xác định các nhóm đối tượng test, thiết lập biến và viết code để tự động kiểm tra.
3.1. Phân nhóm, dựng cấu trúc các đối tượng test
Tạo 1 Collection “ Tên nhóm - Kiểm thử API abcdxyz”.
Tạo các folder con bên trong để phân nhóm, ví dụ:
Auth Module.
User Module.
Product Module.
3.2. Thiết lập môi trường và biến
Tạo 1 Environment “Test_Env”.
Thêm các biến, ví dụ:
base_url = https://reqres.in/api.
token = (để trống, sẽ điền bằng script).
3.3. Tạo các Request
Mô tả: Chuyển test case từ Excel sang Postman.
Yêu cầu: Điền đầy đủ các thông tin.
Params.
Authorization (ví dụ: Bearer Token).
Headers (ví dụ: Content-Type: application/json).
Body (raw, JSON).
3.4. Viết Script
Mô tả: Ở mục test của mỗi Request cần có code JavaScript để kiểm tra kết quả.
Ví dụ: javascript<br>// 1. Kiểm tra status code là 200<br>pm.test("Status is 200 OK", function () {<br> pm.response.to.have.status(200);<br>});<br><br>// 2. Kiểm tra response time < 500ms<br>pm.test("Response time is fast", function () {<br> pm.expect(pm.response.responseTime).to.be.below(500);<br>});<br><br>// 3. Lấy Token tự động lưu vào biến môi trường<br>pm.test("Save token", function () {<br> var jsonData = pm.response.json();<br> pm.environment.set("token", jsonData.token);<br>});<br>
4. GIAI ĐOẠN 4: ĐÁNH GIÁ (EVALUATION)
Mục tiêu là chạy các Test Case, đánh giá hiệu năng và báo cáo lỗi.
4.1. Chạy Test tự động
Mô tả: Dùng Collection Runner để chạy test.
Cụ thể:
Chọn Collection của nhóm.
Upload file data.csv.
Set Iterations (số lần chạy) và Run.
Chụp ảnh màn hình kết quả Pass/Fail để làm báo cáo.
4.2. Chạy bằng Newman
Mô tả: Dùng Newman để chạy test qua CMD.
Cụ thể:
npm install -g newman
npm install -g newman-reporter-htmlextra
newman run [file_collection.json] -e [file_env.json] -r htmlextra
Lấy file HTML trả về để làm báo cáo.
4.3. Đánh giá
Mô tả: Tạo bảng cho danh sách lỗi tìm được.
Cụ thể:
BUG_ID (ví dụ: BUG_01).
Nội dung (ví dụ: API Đăng nhập không giới hạn số lần nhập sai mật khẩu).
Mức độ (High/ Medium/ Low).
Nhận xét: Hệ thống API bảo mật tốt chưa, phản hồi có nhanh không?
5. GIAI ĐOẠN 5: TỔNG KẾT
Mục tiêu là làm báo cáo và slide để chuẩn bị trình bày.
5.1. Viết báo cáo
Ví dụ cấu trúc báo cáo:
Chương 1: giới thiệu API và mục tiêu kiểm thử.
Chương 2 (Design): Phương pháp kiểm thử và bảng test case chi tiết.
Chương 3 (Implementation): Cách tổ chức thư mục trên Postman, giải thích cách đặt biến và các đoạn Script.
Chương 4 (Evaluation): Kết quả chạy test, phân tích tỷ lệ Pass/ Fail, danh sách lỗi phát hiện, đánh giá chất lượng API.
5.2. Làm slide
Yêu cầu: Slide ngắn gọn, trực quan, nhiều hình ảnh.
5.3. Demo
Mô tả: Chạy test trên lớp và giải thích cơ chế hoạt động (ví dụ: Script tự lấy Token hoạt động như thế nào).




