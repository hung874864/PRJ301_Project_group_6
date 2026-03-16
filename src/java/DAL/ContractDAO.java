package DAL;

import Models.Contract;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.Date;

public class ContractDAO extends DBContext {

    PreparedStatement st;
    ResultSet rs;

    public ContractDAO() {
    }

    public ArrayList<Contract> getContracts() {
        ArrayList<Contract> list = new ArrayList<>();
        try {
            String sql = "select * from Contracts";
            st = connection.prepareStatement(sql);
            rs = st.executeQuery();

            while (rs.next()) {

                int id = rs.getInt("ContractID");
                String student = rs.getString("StudentUsername");
                int room = rs.getInt("RoomID");
                Date start = rs.getDate("StartDate");
                Date end = rs.getDate("EndDate");

                list.add(new Contract(id, student, room, start, end));
            }

            return list;

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public Contract getContract(String studentUsername) {
        try {
            String sql = "select * from Contracts where StudentUsername=?";
            st = connection.prepareStatement(sql);
            st.setString(1, studentUsername);

            rs = st.executeQuery();

            if (rs.next()) {

                int contractID = rs.getInt("ContractID");
                String student = rs.getString("StudentUsername");
                int room = rs.getInt("RoomID");
                Date start = rs.getDate("StartDate");
                Date end = rs.getDate("EndDate");

                return new Contract(contractID, student, room, start, end);
            } else {
                return null;
            }

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public void insertContract(Contract c) {
        try {
            String sql = "INSERT INTO Contracts(StudentUsername,RoomID,StartDate,EndDate) VALUES(?,?,?,?)";
            st = connection.prepareStatement(sql);

            st.setString(1, c.getStudentUsername());
            st.setInt(2, c.getRoomID());
            st.setDate(3, c.getStartDate());
            st.setDate(4, c.getEndDate());

            st.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateContract(Contract c) {
        try {
            String sql = "UPDATE Contracts SET StudentUsername=?,RoomID=?,StartDate=?,EndDate=? WHERE ContractID=?";
            st = connection.prepareStatement(sql);

            st.setString(1, c.getStudentUsername());
            st.setInt(2, c.getRoomID());
            st.setDate(3, c.getStartDate());
            st.setDate(4, c.getEndDate());
            st.setInt(5, c.getContractID());

            st.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteContract(int contractID) {
        try {
            String sql = "DELETE FROM Contracts WHERE ContractID=?";
            st = connection.prepareStatement(sql);
            st.setInt(1, contractID);

            st.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}