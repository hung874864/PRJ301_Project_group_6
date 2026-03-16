package DAL;

import Models.Student;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.sql.Date;

public class StudentDAO extends DBContext {

    PreparedStatement st;
    ResultSet rs;

    public StudentDAO() {
    }

    public ArrayList<Student> getStudents() {
        ArrayList<Student> students = new ArrayList<>();
        try {
            String sql = "select * from Students";
            st = connection.prepareStatement(sql);
            rs = st.executeQuery();

            while (rs.next()) {

                String username = rs.getString("Username");
                String name = rs.getString("FullName");
                Date birth = rs.getDate("BirthDate");
                String gender = rs.getString("Gender");
                String phone = rs.getString("Phone");

                students.add(new Student(username, name, birth, gender, phone));
            }

            return students;

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public Student getStudent(String username) {
        try {
            String sql = "select * from Students where Username=?";
            st = connection.prepareStatement(sql);
            st.setString(1, username);

            rs = st.executeQuery();

            if (rs.next()) {

                String name = rs.getString("FullName");
                Date birth = rs.getDate("BirthDate");
                String gender = rs.getString("Gender");
                String phone = rs.getString("Phone");

                return new Student(username, name, birth, gender, phone);
            } else {
                return null;
            }

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    public void insertStudent(Student s) {
        try {
            String sql = "INSERT INTO Students VALUES(?,?,?,?,?)";
            st = connection.prepareStatement(sql);

            st.setString(1, s.getUsername());
            st.setString(2, s.getFullName());
            st.setDate(3, s.getBirthDate());
            st.setString(4, s.getGender());
            st.setString(5, s.getPhone());

            st.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateStudent(Student s) {
        try {
            String sql = "UPDATE Students SET FullName=?,BirthDate=?,Gender=?,Phone=? WHERE Username=?";
            st = connection.prepareStatement(sql);

            st.setString(1, s.getFullName());
            st.setDate(2, s.getBirthDate());
            st.setString(3, s.getGender());
            st.setString(4, s.getPhone());
            st.setString(5, s.getUsername());

            st.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void deleteStudent(String username) {
        try {
            String sql = "DELETE FROM Students WHERE Username=?";
            st = connection.prepareStatement(sql);
            st.setString(1, username);

            st.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}