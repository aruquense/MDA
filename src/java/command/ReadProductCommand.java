package command;

import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.Producto;
import modelo.Usuario;

public class ReadProductCommand extends FrontCommand {     

    @Override
    public void process() {
        HandlerBDD handler = new HandlerBDD();
        Producto product = null;
        int idProducto = Integer.parseInt(request.getParameter("idproducto"));
        try {
            product = handler.leerProducto(idProducto);            
        } catch (SQLException ex) {
            Logger.getLogger(ReadProductCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
        Usuario user =  handler.getUsuarioByID(product.getIdvendedor());
        request.setAttribute("product", product);
        request.setAttribute("usuario", user);
        forward("/product.jsp");
    }
    
}
