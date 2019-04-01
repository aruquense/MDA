/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package command;

import static java.lang.System.out;
import java.util.ArrayList;

/**
 *
 * @author Necrolon
 */
public class SearchProductCommand extends FrontCommand{

    @Override
    public void process() {
        HandlerBDD handler = new HandlerBDD();
        ArrayList<String> searchList = handler.searchProduct(request.getParameter("producto"));
        out.print("<h1>Búsqueda de un producto</h1>");
        for (String name : searchList) {
            out.print("<p>"+name+"</p>");    
        }
        request.setAttribute("searchList", searchList);
        forward("/index.jsp");
        
        
        
        
    }
    
}
