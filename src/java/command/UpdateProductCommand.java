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
public class UpdateProductCommand extends FrontCommand {     

    @Override
    public void process() {
        HandlerBDD handler = new HandlerBDD();
        int idProducto = Integer.parseInt(request.getParameter("idproducto"));
        String nombre = request.getParameter("nombre");
        double precio = Double.parseDouble(request.getParameter("precio"));
        String descripcion = request.getParameter("descripcion");
        String imagen = request.getParameter("imagen");
        try {
            handler.actualizarProducto(idProducto, nombre, precio, descripcion, imagen);
        } catch (SQLException ex) {
            Logger.getLogger(UpdateProductCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
        forward("/index.jsp");
    }
    
}
