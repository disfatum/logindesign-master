/**
 * 
 */
package com.core.DBConnect;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author 
 */
public class DBGetter {
    
    private static final String LOGSQL = "select fname,pwd,uid from reguser where logname=? and aliasid=?";
    private static final String lastlog = "select seansid from userlog";
    public int lastlg = 0;
    
    /**
     * Проверка существования логина
     *
     * @param login
     * @param pwd
     * @param aliasid
     * @return -1, если такой логин не зарегистрирован, иначе - uid
     */
    public  int checkLogin(String login, String pwd, int aliasid) {
        if (pwd == null || pwd.isEmpty()) {
            return -1;
        }
        int res = -1;
        Connection con = null;
        try {
            con = new DBConn().getConn();
            if (con == null) {
                return -11;
            }
            PreparedStatement logpst = con.prepareStatement(LOGSQL);
            logpst.setString(1, login.toUpperCase());
            logpst.setInt(2, aliasid);
            ResultSet rs = logpst.executeQuery();
            res=-2;
            if (rs.next()) {
                res=-3;
                String bdp = rs.getString(2);
                if (pwd.equals(bdp)) {
                    res = rs.getInt(3);
                }
            }
            PreparedStatement logpst1 = con.prepareStatement(lastlog);
            //logpst1.setString(1, login.toUpperCase());
            //logpst.setInt(2, aliasid);
            ResultSet rs1 = logpst1.executeQuery();
            ArrayList<Integer> last = new ArrayList<Integer>();
            //res=-2;
           while (rs1.next()) {
               last.add(rs1.getInt(1));
            }  
            lastlg =  Collections.max(last);
        } catch (SQLException ex) {
            Logger.getLogger(DBGetter.class.getName()).log(Level.SEVERE, "Ошибка проверки пользователя {0}",login);
            ex.printStackTrace();
        } finally {
            if (con != null) {
                try {
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBGetter.class.getName()).log(Level.SEVERE, "Close connection: error {0}",ex.getMessage());
                }
            }
        }
       
        return res;
    }
    
    private static final String ULSQL="insert into userlog(seansid,userid,ipadr,tstamp) values(?,?,?,'now')";
    /**
     * Запись в журнал успешной авторизации пользователя
     * @param seansid
     * @param userid
     * @param ipadr 
     */
    public  void logUserLogin(int seansid,int userid,String ipadr){
        Connection con = null;
            
        try {
            con = new DBConn().getConn();
            if(con==null)return ;
            PreparedStatement ulpst = con.prepareStatement(ULSQL);
            ulpst.setInt(1, seansid);
            ulpst.setInt(2, userid);
            ulpst.setString(3, ipadr);
            ulpst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DBGetter.class.getName()).log(Level.SEVERE, "Ошибка записи в журнал: "+seansid+" "+ex.getMessage());
        } 
        finally {
            try {
                if(con!=null)con.close();
            } catch (SQLException ex) {
                Logger.getLogger(DBGetter.class.getName()).log(Level.SEVERE, "Ошибка закрытия соединения {0}",ex.getMessage());
            }
        }
    }
	public static String getLastlog() {
		return lastlog;
	}
}
