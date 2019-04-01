package command;

import modelo.Producto;
import java.util.ArrayList;

public class SearchProductCommand extends FrontCommand{

    @Override
    public void process() {
        HandlerBDD handler = new HandlerBDD();
        ArrayList<Producto> searchList = handler.searchProduct(request.getParameter("producto"));           
        request.setAttribute("searchList", searchList);
        forward("/index.jsp");
        
        
        
        
    }
    
}
