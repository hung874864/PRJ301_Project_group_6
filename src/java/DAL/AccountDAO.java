/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Account;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class AccountDAO extends DBContext {

    PreparedStatement st;
    ResultSet rs;

    public AccountDAO() {
    }
    
    

    public ArrayList<Account> getAccounts() {
        ArrayList<Account> Accounts = new ArrayList<>();
        try {
            String sql = "select * from Accounts";
            st = connection.prepareStatement(sql);
            rs = st.executeQuery(); //only select
            while (rs.next()) {
                String id = rs.getString("Username");
                String name = rs.getString("Password");
                String role = rs.getString("Role");

                Accounts.add(new Account(id, name, role));
            }
            return Accounts;
        } catch (Exception exception) {
            exception.printStackTrace();
            return null;
        }
    }

    public Account getAccount(String username) {
        try {
            String sql = "select * from Accounts where Username=?";
            st = connection.prepareStatement(sql);
            st.setString(1, username);
            rs = st.executeQuery(); //only select
            if (rs.next()) {
                String user = rs.getString("Username");
                String pass = rs.getString("Password");
                String role = rs.getString("Role");

                Account a = new Account(user, pass, role);
                return a;
            } else {
                return null;
            }
        } catch (Exception exception) {
            exception.printStackTrace();
            return null;
        }
    }

    public void insertAccount(Account a) {
        try {
            String sql = "insert into Accounts (Username,Password,Role) values (?,?,?)";
            st = connection.prepareStatement(sql);
            st.setString(1, a.getUsername());
            st.setString(2, a.getPassword());
            st.setString(3, a.getRole());
            st.executeUpdate();
        } catch (Exception exception) {
            exception.printStackTrace();
        }
    }

    public void updateAccount(Account a) {
        try {
            String sql = "UPDATE Accounts SET Password = ?, Role = ? WHERE Username = ?";
            st = connection.prepareStatement(sql);
            st.setString(1, a.getPassword());
            st.setString(2, a.getRole());
            st.setString(3, a.getUsername());
            st.executeUpdate();
        } catch (Exception exception) {
            exception.printStackTrace();
        }
    }

    public void deleteAccount(String username) {
        try {
            String sql = "DELETE FROM Accounts WHERE Username = ?";
            st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.executeUpdate();
        } catch (Exception exception) {
            exception.printStackTrace();
        }
    }
}
