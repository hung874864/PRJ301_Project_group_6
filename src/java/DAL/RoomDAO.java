package DAL;

import Models.Room;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class RoomDAO extends DBContext {

    PreparedStatement st;
    ResultSet rs;

    public RoomDAO() {
    }

    public ArrayList<Room> getRooms() {
        ArrayList<Room> rooms = new ArrayList<>();
        try {
            String sql = "select * from Rooms";
            st = connection.prepareStatement(sql);
            rs = st.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("RoomID");
                String name = rs.getString("RoomName");
                double price = rs.getDouble("Price");
                int max = rs.getInt("MaxStudents");
                int status = rs.getInt("Status");

                rooms.add(new Room(id, name, price, max, status));
            }
            return rooms;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public Room getRoom(int roomID) {
        try {
            String sql = "select * from Rooms where RoomID=?";
            st = connection.prepareStatement(sql);
            st.setInt(1, roomID);

            rs = st.executeQuery();

            if (rs.next()) {
                int id = rs.getInt("RoomID");
                String name = rs.getString("RoomName");
                double price = rs.getDouble("Price");
                int max = rs.getInt("MaxStudents");
                int status = rs.getInt("Status");

                return new Room(id, name, price, max, status);
            } else {
                return null;
            }

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public void insertRoom(Room r) {
        try {
            String sql = "INSERT INTO Rooms(RoomName,Price,MaxStudents,Status) VALUES(?,?,?,?)";
            st = connection.prepareStatement(sql);

            st.setString(1, r.getRoomName());
            st.setDouble(2, r.getPrice());
            st.setInt(3, r.getMaxStudents());
            st.setInt(4, r.getStatus());

            st.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateRoom(Room r) {
        try {
            String sql = "UPDATE Rooms SET RoomName=?,Price=?,MaxStudents=?,Status=? WHERE RoomID=?";
            st = connection.prepareStatement(sql);

            st.setString(1, r.getRoomName());
            st.setDouble(2, r.getPrice());
            st.setInt(3, r.getMaxStudents());
            st.setInt(4, r.getStatus());
            st.setInt(5, r.getRoomID());

            st.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteRoom(int roomID) {
        try {
            String sql = "DELETE FROM Rooms WHERE RoomID=?";
            st = connection.prepareStatement(sql);
            st.setInt(1, roomID);

            st.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
