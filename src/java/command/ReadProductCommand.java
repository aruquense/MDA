/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package command;

import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Gustavo
 */
public class ReadProductCommand extends FrontCommand {     

    @Override
    public void process() {
        HandlerBDD handler = new HandlerBDD();
        int idProducto = Integer.parseInt(request.getParameter("idproducto"));
        try {
            handler.leerProducto(idProducto);
        } catch (SQLException ex) {
            Logger.getLogger(ReadProductCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
        forward("/index.jsp");
    }
    
}
