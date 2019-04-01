package command;

import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ReadProductCommand extends FrontCommand {     

    @Override
    public void process() {
        HandlerBDD handler = new HandlerBDD();
        String name="";
        int idProducto = Integer.parseInt(request.getParameter("idproducto"));
        try {
            name = handler.leerProducto(idProducto);            
        } catch (SQLException ex) {
            Logger.getLogger(ReadProductCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(name);
        forward("/index.jsp?name="+name);
    }
    
}
