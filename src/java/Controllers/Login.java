/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.AccountDAO;
import DAL.BillDAO;
import DAL.ContractDAO;
import DAL.RoomDAO;
import DAL.StudentDAO;
import Models.Account;
import Models.Bill;
import Models.Contract;
import Models.Room;
import Models.Student;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;

/**
 *
 * @author LENOVO
 */
public class Login extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Login</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Login at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        AccountDAO ad = new AccountDAO();
        Account acc = ad.getAccount(username);

        if (acc != null) {
            if (!acc.getPassword().equals(password)) {
                request.setAttribute("error", "Wrong password");
                request.getRequestDispatcher("Views/Login.jsp").forward(request, response);
                return;
            }

            //save account login
            HttpSession session = request.getSession();
            session.setAttribute("account", acc);

            switch (acc.getRole()) {
                case "admin":
                    ArrayList<Account> accounts = ad.getAccounts();
                    request.setAttribute("accounts", accounts);
                    request.getRequestDispatcher("Views/AdminDashboard.jsp").forward(request, response);
                    break;
                case "owner":
                    RoomDAO rd = new RoomDAO();
                    request.setAttribute("rooms", rd.getRooms());
                    request.getRequestDispatcher("Views/OwnerDashboard.jsp").forward(request, response);
                    break;
                case "student":

                    StudentDAO sd = new StudentDAO();
                    Student student = sd.getStudent(username);
                    request.setAttribute("student", student);

                    ContractDAO cd = new ContractDAO();
                    Contract con = cd.getContract(username);

                    //rd = new RoomDAO();
                    if (con != null) {
                        rd = new RoomDAO();
                        Room room = rd.getRoom(con.getRoomID());
                        request.setAttribute("room", room);

                        // 3. Nếu đã có phòng thì mới đi tìm Hóa đơn (Bill)
                        if (room != null) {
                            BillDAO bd = new BillDAO();
                            Bill bill = bd.getBill(room.getRoomID());
                            request.setAttribute("bill", bill);
                        }
                    }

                    request.getRequestDispatcher("Views/StudentDashboard.jsp").forward(request, response);
                    break;
                default:
                    System.out.println("No role available");
                    break;
            }

        } else {
            request.setAttribute("error", "Account no exist");
            request.getRequestDispatcher("Views/Login.jsp").forward(request, response);

        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
