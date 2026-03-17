/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.AccountDAO;
import Models.Account;
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
public class Admin extends HttpServlet {

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
            out.println("<title>Servlet Admin</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Admin at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account != null && account.getRole().equals("admin")) {
            String action = request.getParameter("action");
            String username = request.getParameter("username");
            if (action.equals("update")) {
                AccountDAO ad = new AccountDAO();
                request.setAttribute("acc", ad.getAccount(username));
                request.getRequestDispatcher("Views/AdminUpdateAccount.jsp").forward(request, response);
            }
            if (action.equals("delete")) {
                AccountDAO ad = new AccountDAO();
                ad.deleteAccount(username);
                request.setAttribute("accounts", ad.getAccounts());
                request.getRequestDispatcher("Views/AdminDashboard.jsp").forward(request, response);
            }
        } else {
            PrintWriter out = response.getWriter();
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Admin</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("no permission to enter");
            out.println("</body>");
            out.println("</html>");
        }

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
        HttpSession session = request.getSession();
        Account account = (Account) session.getAttribute("account");
        if (account != null && account.getRole().equals("admin")) {
            String action = request.getParameter("action");
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String role = request.getParameter("role");
            if (action.equals("Update")) {
                AccountDAO ad = new AccountDAO();
                Account a = new Account(username, password, role);
                ad.updateAccount(a);
                request.setAttribute("accounts", ad.getAccounts());
                request.getRequestDispatcher("Views/AdminDashboard.jsp").forward(request, response);
            }
            if (action.equals("Create")) {
                AccountDAO ad = new AccountDAO();
                Account a = new Account(username, password, role);
                ad.insertAccount(a);
                request.setAttribute("accounts", ad.getAccounts());
                request.getRequestDispatcher("Views/AdminDashboard.jsp").forward(request, response);
            }
            if (action.equals("Search")) {
                AccountDAO ad = new AccountDAO();
                ArrayList<Account> accounts = new ArrayList<>();
                for (Account a : ad.getAccounts()) {
                    if (username != null && !username.equals("")) {
                        if (a.getUsername().contains(username) || a.getRole().equals(role)) {
                            accounts.add(a);
                        }
                    }else{
                        if (a.getRole().equals(role)) {
                            accounts.add(a);
                        }
                    }
                }
                request.setAttribute("accounts", accounts);
                request.getRequestDispatcher("Views/AdminDashboard.jsp").forward(request, response);
            }
        } else {
            PrintWriter out = response.getWriter();
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Admin</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("no permission to enter");
            out.println("</body>");
            out.println("</html>");
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
