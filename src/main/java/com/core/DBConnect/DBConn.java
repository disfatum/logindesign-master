/**
 * 
 */
package com.core.DBConnect;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
*
* @author oam
*/
public class DBConn {
   
   public  Connection getConn(){
       try {
           InitialContext ctx = new InitialContext();
           DataSource ds = (DataSource) ctx.lookup("java:/PostgresDS");
           return  ds.getConnection();
       } catch (NamingException ex) {
           Logger.getLogger(DBConn.class.getName()).log(Level.SEVERE, null, "Error: wrong JNDI name");
       } catch (SQLException ex) {
           Logger.getLogger(DBConn.class.getName()).log(Level.SEVERE, null, "Error getting DB connection");
       }
       return null;
   }
}
