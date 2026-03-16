/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package DAL;
import Models.Bill;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BillDAO extends DBContext{
PreparedStatement st;
    ResultSet rs;

    public BillDAO() {
    }
    
    
    
     public ArrayList<Bill> getBills() {
        ArrayList<Bill> bills = new ArrayList<>();
        try {
            String sql = "select * from Bills";
            st = connection.prepareStatement(sql);
            rs = st.executeQuery(); //only select
            while (rs.next()) {
                int billId = rs.getInt("BillID");
                int roomId = rs.getInt("RoomID");
                int month = rs.getInt("Month");
                int year = rs.getInt("Year");
                double electicity = rs.getDouble("Electricity");
                double water = rs.getDouble("Water");
                double total = rs.getDouble("Total");

                bills.add(new Bill(billId, roomId, month,year, electicity, water));
            }
            return bills;
        } catch (Exception exception) {
            exception.printStackTrace();
            return null;
        }
    }

    public Bill getBill(int RoomID) {
        try {
            String sql = "select * from Bills where RoomID=?";
            st = connection.prepareStatement(sql);
            st.setInt(1, RoomID);
            rs = st.executeQuery(); //only select
            if (rs.next()) {
                int billId = rs.getInt("BillID");
                int roomId = rs.getInt("RoomID");
                int month = rs.getInt("Month");
                int year = rs.getInt("Year");
                double electicity = rs.getDouble("Electricity");
                double water = rs.getDouble("Water");
                double total = rs.getDouble("Total");

                Bill b = new Bill(billId, roomId, month,year, electicity, water);
                return b;
            } else {
                return null;
            }
        } catch (Exception exception) {
            exception.printStackTrace();
            return null;
        }
    }

    public void insertBill(Bill b) {
    try {
        String sql = "INSERT INTO Bills (RoomID, Month, Year, Electricity, Water, Total) VALUES (?,?,?,?,?,?)";
        st = connection.prepareStatement(sql);

        st.setInt(1, b.getRoomID());
        st.setInt(2, b.getMonth());
        st.setInt(3, b.getYear());
        st.setDouble(4, b.getElectricity());
        st.setDouble(5, b.getWater());
        st.setDouble(6, b.getTotal());

        st.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace();
    }
}

    public void updateBill(Bill b) {
        try {
            String sql = "UPDATE Bills SET RoomID = ?,Month = ?,Year = ?,Electricity = ?,Water = ?,Total = ? WHERE BillID = ?";
            st = connection.prepareStatement(sql);
            st.setInt(7, b.getBillID());
            st.setInt(1, b.getRoomID());
            st.setInt(2, b.getMonth());
            st.setInt(3, b.getYear());
            st.setDouble(4, b.getElectricity());
            st.setDouble(5, b.getWater());
            st.setDouble(6, b.getTotal());
            st.executeUpdate();
        } catch (Exception exception) {
            exception.printStackTrace();
        }
    }

    public void deleteBill(int billID) {
        try {
            String sql = "DELETE FROM Bills WHERE BillID = ?";
            st = connection.prepareStatement(sql);
            st.setInt(1, billID);
            st.executeUpdate();
        } catch (Exception exception) {
            exception.printStackTrace();
        }
    }
}
