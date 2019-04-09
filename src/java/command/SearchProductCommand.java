package command;

import modelo.Producto;
import java.util.ArrayList;

public class SearchProductCommand extends FrontCommand{

    @Override
    public void process() {
        HandlerBDD handler = new HandlerBDD();
        ArrayList<Producto> searchList = handler.searchProduct(request.getParameter("producto"));           
        request.setAttribute("searchList", searchList);
        String busqueda;
        if(request.getParameter("producto")==null)busqueda = " ";
        else busqueda = request.getParameter("producto");
        forward("/busqueda.jsp?busqueda="+busqueda);  
    }
    
}
