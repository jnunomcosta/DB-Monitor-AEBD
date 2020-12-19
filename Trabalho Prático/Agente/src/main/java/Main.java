import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

public class Main {
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        ConnectToRead connectToRead = new ConnectToRead();
        Class.forName("oracle.jdbc.OracleDriver");
        connectToRead.setConnection();

        ConnectToWrite connectToWrite = new ConnectToWrite();
        Class.forName("oracle.jdbc.OracleDriver");
        connectToWrite.setConnection();

        if (connectToRead.getConnection() != null) {
            System.out.println("Connected with :" + connectToRead.getUrl());
            if (connectToWrite.getConnection() != null) {
                System.out.println("Connected with :" + connectToWrite.getUrl());
                try (Statement stmt = connectToRead.getConnection().createStatement()) {
                    try (Statement stmtwriter = connectToWrite.getConnection().createStatement()) {
                        String query = "";

                        /* INFO */


                        /* ROLES */
                        query = "SELECT ROLE_ID,ROLE,AUTHENTICATION_TYPE FROM DBA_ROLES";
                        ResultSet resultSet = stmt.executeQuery(query);
                        while (resultSet.next()) {
                            int role_id = resultSet.getInt("ROLE_ID");
                            String role = resultSet.getString("ROLE");
                            String authentication_type = resultSet.getString("AUTHENTICATION_TYPE");

                            query = "INSERT INTO ROLES VALUES ";
                        }

                        /* TABLESPACES */


                        /* USERS */
                        query = "SELECT * FROM DBA_USERS";
                        ResultSet rs = stmt.executeQuery(query);
                        while (rs.next()) {
                            String username = rs.getString("USERNAME");
                            String account_status = rs.getString("ACCOUNT_STATUS");
                            Date expiry_date = rs.getDate("EXPIRY_DATE");
                            String default_tablespace = rs.getString("DEFAULT_TABLESPACE");
                            String temporary_tablespace = rs.getString("TEMPORARY_TABLESPACE");
                            String profile = rs.getString("PROFILE");
                            Date created = rs.getDate("CREATED");
                            String common = rs.getString("COMMON");
                        }

                        /* SESSIONS */
                        query = "SELECT SID, USERNAME, STATUS, SERVER, SCHEMANAME, OSUSER, MACHINE, PORT, TYPE, WAIT_TIME_MICRO, LOGON_TIME FROM V$SESSION WHERE USERNAME IS NOT NULL";

                        /*CPU*/

                        /*PGA*/

                        /*SGA*/
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            } else {
                System.out.println("Connection Failed");
            }
        } else {
            System.out.println("Connection Failed");
        }
    }
}

