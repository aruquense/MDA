package command;

import modelo.Producto;
import java.util.ArrayList;
import modelo.Usuario;

public class AdvancedSearchCommand extends FrontCommand{

    @Override
    public void process() {
        HandlerBDD handler = new HandlerBDD();
        String search = request.getParameter("busqueda"); 
        int precioMin = Integer.parseInt(request.getParameter("precioMin"));
        int precioMax = Integer.parseInt(request.getParameter("precioMax"));
        String categoria = request.getParameter("categoria");
        System.out.println(search);
        System.out.println(precioMin);
        System.out.println(precioMax);
        System.out.println(categoria);
        ArrayList<Producto> searchList;
        if(categoria.equals("Todo")){
            searchList = handler.searchAdvancedProduct(request.getParameter("busqueda"), precioMin, precioMax);           
            request.setAttribute("searchList", searchList);
        }else{
            searchList = handler.searchAdvancedProductCategory(request.getParameter("busqueda"), precioMin, precioMax, categoria);           
            
        }
        request.setAttribute("searchList", searchList);
        ArrayList<Usuario> userList = handler.searchUser(request.getParameter("busqueda"));
        request.setAttribute("userList", userList);
        forward("/busqueda.jsp");  
    }
}
