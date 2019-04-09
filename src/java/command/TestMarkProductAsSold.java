package command;

import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class TestMarkProductAsSold extends FrontCommand {     

    @Override
    public void process() {
        HandlerBDD handler = new HandlerBDD();
        int idProducto = Integer.parseInt(request.getParameter("idproducto"));
        try {
            handler.markProductSoldFromADB(Long.valueOf(idProducto));
        } catch (SQLException ex) {
            Logger.getLogger(TestMarkProductAsSold.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
    
}