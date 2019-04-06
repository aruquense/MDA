package command;

import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelo.Producto;

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
        Long id = product.getId();
        Long idvendedor = product.getIdvendedor();
        Double precio = product.getPrecio();
        String descripcion = product.getDescripcion();
        String img = product.getImg();
        String nombre = product.getNombre();            
        forward("/product.jsp?id="+id+"&idvendedor="+idvendedor+"&precio="+precio+"&descripcion="+descripcion+"&img="+img+"&nombre="+nombre);
    }
    
}
