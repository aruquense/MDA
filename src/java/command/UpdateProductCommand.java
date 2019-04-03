package command;

import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

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