package Controllers;

import DAL.BillDAO;
import DAL.ContractDAO;
import DAL.RoomDAO;
import DAL.StudentDAO;
import Models.Account;
import Models.Bill;
import Models.Contract;
import Models.Room;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class Student extends HttpServlet {

    // Lấy dữ liệu hiển thị lên Dashboard
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        Account acc = (Account) session.getAttribute("account");
        
        if (acc == null) {
            response.sendRedirect("Login");
            return;
        }

        try {
            String username = acc.getUsername();
            
            // 1. Lấy thông tin Student bằng hàm getStudent() trong DAO của bạn
            StudentDAO sd = new StudentDAO();
            Models.Student student = sd.getStudent(username); 
            
            // 2. Lấy Hợp đồng (Contract)
            ContractDAO cd = new ContractDAO();
            Contract con = cd.getContract(username);
            
            Room room = null;
            Bill bill = null; 
            
            // 3. Nếu có hợp đồng thì lấy Phòng và Hóa đơn
            if (con != null) {
                RoomDAO rd = new RoomDAO();
                room = rd.getRoom(con.getRoomID());
                
                if (room != null) {
                    BillDAO bd = new BillDAO();
                    // Gọi hàm getBill() GỐC của bạn
                    bill = bd.getBill(room.getRoomID()); 
                }
            }
            
            // 4. Đẩy sang JSP
            request.setAttribute("student", student);
            request.setAttribute("room", room);
            request.setAttribute("bill", bill); 
            
            request.getRequestDispatcher("Views/StudentDashboard.jsp").forward(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Lỗi hệ thống: " + e.getMessage());
        }
    }

    // Xử lý Cập nhật Profile
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        
        try {
            // Lấy dữ liệu từ form
            String username = request.getParameter("username");
            String fullName = request.getParameter("fullName");
            String dobString = request.getParameter("birthDate");
            String gender = request.getParameter("gender");
            String phone = request.getParameter("phone");
            
            java.sql.Date birthDate = null;
            if (dobString != null && !dobString.isEmpty()) {
                birthDate = java.sql.Date.valueOf(dobString);
            }

            // Tạo object Student mới
            Models.Student s = new Models.Student(username, fullName, birthDate, gender, phone);

            // Gọi DAO để update
            StudentDAO sd = new StudentDAO();
            
            // GỌI ĐÚNG HÀM updateStudent() TRONG FILE DAO CỦA BẠN
            sd.updateStudent(s); 
            
            // Vì hàm updateStudent là kiểu void, nếu chạy qua dòng trên mà không sinh ra lỗi (Exception)
            // thì nghĩa là update thành công, ta báo thành công luôn.
            request.setAttribute("message", "Cập nhật thông tin thành công!");
            
            // Load lại trang với dữ liệu mới
            doGet(request, response);
            
        } catch (Exception e) {
            e.printStackTrace();
            // Nếu có lỗi SQL hoặc lỗi ép kiểu ngày tháng, nó sẽ nhảy xuống đây
            request.setAttribute("error", "Lỗi cập nhật: " + e.getMessage());
            doGet(request, response);
        }
    }
}