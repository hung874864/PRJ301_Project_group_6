/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
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
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.sql.Date;

/**
 *
 * @author LENOVO
 */
public class Owner extends HttpServlet {

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
            out.println("<title>Servlet Owner</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Owner at " + request.getContextPath() + "</h1>");
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

        //check role
        if (account != null && account.getRole().equals("owner")) {
            String action = request.getParameter("action");

            //go to contract list
            if (action.equals("contract")) {
                ContractDAO cd = new ContractDAO();
                request.setAttribute("contracts", cd.getContracts());
                request.getRequestDispatcher("Views/OwnerContract.jsp").forward(request, response);
            }

            //go to bill list
            if (action.equals("bill")) {
                BillDAO bd = new BillDAO();
                request.setAttribute("bills", bd.getBills());
                request.getRequestDispatcher("Views/OwnerBill.jsp").forward(request, response);
            }

            //go to room detail
            if (action.equals("detail")) {
                RoomDAO rd = new RoomDAO();
                String roomID = request.getParameter("id");
                Room r = rd.getRoom(Integer.parseInt(roomID));
                StudentDAO sd = new StudentDAO();
                request.setAttribute("room", r);
                request.setAttribute("students", sd.getStudentsByRoom(r.getRoomID()));
                request.getRequestDispatcher("Views/OwnerRoomDetail.jsp").forward(request, response);
            }

            //update room
            if (action.equals("update")) {
                RoomDAO rd = new RoomDAO();
                String roomID = request.getParameter("id");
                Room r = rd.getRoom(Integer.parseInt(roomID));
                request.setAttribute("r", r);
                request.getRequestDispatcher("Views/OwnerUpdateRoom.jsp").forward(request, response);
            }

            //delete room
            if (action.equals("delete")) {
                RoomDAO rd = new RoomDAO();
                String roomID = request.getParameter("id");
                rd.deleteRoom(Integer.parseInt(roomID));
                request.setAttribute("rooms", rd.getRooms());
                request.getRequestDispatcher("Views/OwnerDashboard.jsp").forward(request, response);
            }

            //go to room list
            if (action.equals("dashboard")) {
                RoomDAO rd = new RoomDAO();
                request.setAttribute("rooms", rd.getRooms());
                request.getRequestDispatcher("Views/OwnerDashboard.jsp").forward(request, response);
            }

            //see bill detail of a room
            if (action.equals("billDetail")) {
                String roomID = request.getParameter("roomID");
                BillDAO bd = new BillDAO();
                request.setAttribute("bill", bd.getBill(Integer.parseInt(roomID)));
                request.getRequestDispatcher("Views/OwnerBillDetail.jsp").forward(request, response);
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

        //check role
        if (account != null && account.getRole().equals("owner")) {
            String action = request.getParameter("action");

            //sesarch for room
            if (action.equals("Search")) {
                String roomID = request.getParameter("roomSearch");
                RoomDAO rd = new RoomDAO();
                ArrayList<Room> rooms = new ArrayList<>();
                try {
                    rooms.add(rd.getRoom(Integer.parseInt(roomID)));
                    request.setAttribute("rooms", rooms);
                    request.setAttribute("roomSearch", roomID);
                    request.getRequestDispatcher("Views/OwnerDashboard.jsp").forward(request, response);
                } catch (Exception exception) {
                    request.setAttribute("error", "must be integer");
                    request.getRequestDispatcher("Views/OwnerDashboard.jsp").forward(request, response);
                }
            }

            //create new room
            if (action.equals("Create")) {
                String roomName = request.getParameter("roomName");
                String roomPrice = request.getParameter("roomPrice");
                String maxStudent = request.getParameter("maxStudent");
                try {
                    int max = Integer.parseInt(maxStudent);
                    double price = Double.parseDouble(roomPrice);
                    RoomDAO rd = new RoomDAO();
                    Room r = new Room(0, roomName, price, max, 0);
                    rd.insertRoom(r);
                    request.setAttribute("rooms", rd.getRooms());
                    request.getRequestDispatcher("Views/OwnerDashboard.jsp").forward(request, response);
                } catch (Exception exception) {
                    request.setAttribute("roomName", roomName);
                    request.setAttribute("roomPrice", roomPrice);
                    request.setAttribute("maxStudent", maxStudent);
                    request.setAttribute("error", "Room price is int and max student is double ");
                    request.getRequestDispatcher("Views/OwnerCreateRoom.jsp").forward(request, response);
                }
            }

            //update a room
            if (action.equals("Update")) {
                String roomID = request.getParameter("roomID");
                String roomName = request.getParameter("roomName");
                String roomPrice = request.getParameter("roomPrice");
                try {
                    double price = Double.parseDouble(roomPrice);
                    RoomDAO rd = new RoomDAO();
                    Room r = new Room(Integer.parseInt(roomID), roomName, price, rd.getRoom(Integer.parseInt(roomID)).getMaxStudents(), 0);
                    rd.updateRoom(r);
                    request.setAttribute("rooms", rd.getRooms());
                    request.getRequestDispatcher("Views/OwnerDashboard.jsp").forward(request, response);
                } catch (Exception exception) {
                    RoomDAO rd = new RoomDAO();
                    request.setAttribute("roomName", roomName);
                    request.setAttribute("roomPrice", roomPrice);
                    request.setAttribute("maxStudent", rd.getRoom(Integer.parseInt(roomID)).getMaxStudents());
                    request.setAttribute("error", "Room price is int and max student is double ");
                    request.getRequestDispatcher("Views/OwnerUpdateRoom.jsp").forward(request, response);
                }
            }

            //search for bill by roomID
            if (action.equals("Search Bill")) {
                String roomID = request.getParameter("roomSearch");
                BillDAO bd = new BillDAO();
                ArrayList<Bill> bills = new ArrayList<>();
                try {
                    bills.add(bd.getBill(Integer.parseInt(roomID)));
                    request.setAttribute("bills", bills);
                    request.setAttribute("roomSearch", roomID);
                    request.getRequestDispatcher("Views/OwnerBill.jsp").forward(request, response);
                } catch (Exception exception) {
                    request.setAttribute("error", "roomID must be integer");
                    request.getRequestDispatcher("Views/OwnerBill.jsp").forward(request, response);
                }
            }

            //search for contract by student username
            if (action.equals("Search Contract")) {
                String contractSearch = request.getParameter("contractSearch");
                ContractDAO cd = new ContractDAO();
                ArrayList<Contract> contracts = new ArrayList<>();

                contracts.add(cd.getContract(contractSearch));
                request.setAttribute("contracts", contracts);
                request.setAttribute("contractSearch", contractSearch);
                request.getRequestDispatcher("Views/OwnerContract.jsp").forward(request, response);

            }

            //create new bill
            if (action.equals("Create Bill")) {
                int roomID = Integer.parseInt(request.getParameter("roomID"));
                int month = Integer.parseInt(request.getParameter("month"));
                int year = Integer.parseInt(request.getParameter("year"));
                double elec = Double.parseDouble(request.getParameter("electricity"));
                double water = Double.parseDouble(request.getParameter("water"));

                Bill b = new Bill(0, roomID, month, year, elec, water);
                BillDAO bd = new BillDAO();
                bd.insertBill(b);
                request.setAttribute("bills", bd.getBills());
                request.getRequestDispatcher("Views/OwnerBill.jsp").forward(request, response);
            }

            //create new contract
            if (action.equals("Create Contract")) {
                String studentUsername = request.getParameter("studentUsername");
                int roomID = Integer.parseInt(request.getParameter("roomID"));
                Date startDate = java.sql.Date.valueOf(request.getParameter("startDate"));
                Date endDate = java.sql.Date.valueOf(request.getParameter("endDate"));

                StudentDAO sd = new StudentDAO();
                RoomDAO rd = new RoomDAO();
                ContractDAO cd = new ContractDAO();
                Room r = rd.getRoom(roomID);
                //if student username no valid
                if (sd.getStudent(studentUsername) == null) {
                    request.setAttribute("error", "no student found");
                    request.setAttribute("studentUsername", studentUsername);
                    request.setAttribute("roomID", roomID);
                    request.setAttribute("startDate", startDate);
                    request.setAttribute("endDate", endDate);
                    request.getRequestDispatcher("Views/OwnerCreateContract.jsp").forward(request, response);
                    return;
                } else if (r == null) {// room no valid
                    request.setAttribute("error", "no room found");
                    request.setAttribute("studentUsername", studentUsername);
                    request.setAttribute("roomID", roomID);
                    request.setAttribute("startDate", startDate);
                    request.setAttribute("endDate", endDate);
                    request.getRequestDispatcher("Views/OwnerCreateContract.jsp").forward(request, response);
                    return;
                } else if (r.getStatus() >= r.getMaxStudents()) {//room full
                    request.setAttribute("error", " room full");
                    request.setAttribute("studentUsername", studentUsername);
                    request.setAttribute("roomID", roomID);
                    request.setAttribute("startDate", startDate);
                    request.setAttribute("endDate", endDate);
                    request.getRequestDispatcher("Views/OwnerCreateContract.jsp").forward(request, response);
                    return;
                } else if (cd.getContract(studentUsername) != null) { //contract already exist
                    request.setAttribute("error", "this student already signed a contract ");
                    request.setAttribute("studentUsername", studentUsername);
                    request.setAttribute("roomID", roomID);
                    request.setAttribute("startDate", startDate);
                    request.setAttribute("endDate", endDate);
                    request.getRequestDispatcher("Views/OwnerCreateContract.jsp").forward(request, response);
                    return;
                }

                //found student, found room all valid
                cd.insertContract(new Contract(0, studentUsername, roomID, startDate, endDate));
                
                r.setStatus(r.getStatus() + 1);
                rd.updateRoom(r);
                request.setAttribute("contracts", cd.getContracts());
                request.getRequestDispatcher("Views/OwnerContract.jsp").forward(request, response);
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
