/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package command;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Gustavo
 */
public class HandlerBDD {
    private Connection conn = null;
    public HandlerBDD(){        
    }
    public Connection conectarBD(){
        try{     
            Class.forName("org.postgresql.Driver");             
            this.conn = DriverManager.getConnection("jdbc:postgresql://localhost/postgres","postgres","1234");
        }catch(ClassNotFoundException |SQLException e){
            Logger.getLogger(HandlerBDD.class.getName()).log(Level.SEVERE, null, e);
        }
        return conn;
    }
    public void cerrarBD(Connection conn){
        try{
            conn.close();
        }catch(SQLException e){
            Logger.getLogger(HandlerBDD.class.getName()).log(Level.SEVERE, null, e);
        }
    }
    public void añadirProductoABD(int idvendedor, String nombre, double precio, String descripcion, String imagen){
        conectarBD();        
        
        String sql = "INSERT INTO \"public\".\"Producto\"(idvendedor,nombre,precio,descripcion,imagen) values("+idvendedor+",\'"+nombre+"\',"+precio+",\'"+descripcion+"\',\'"+imagen+"\')";        
        PreparedStatement enrollItmt;
        try {
            enrollItmt = this.conn.prepareStatement(sql);
            enrollItmt.execute();
        } catch (SQLException ex) {
            Logger.getLogger(HandlerBDD.class.getName()).log(Level.SEVERE, null, ex);
        }
        cerrarBD(conn);
    }
}
