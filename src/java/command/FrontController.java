package command;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "FrontController", urlPatterns = {"/FrontController"})
@MultipartConfig
public class FrontController extends HttpServlet {
  
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {            
        }
    }
    
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        FrontCommand command = getCommand(request);
        command.init(getServletContext(), request, response);
        command.process();

    }

    private FrontCommand getCommand(HttpServletRequest req){
        try {
            FrontCommand f= (FrontCommand) getCommandClass(req).newInstance();
            return f;
        }catch (InstantiationException | IllegalAccessException e) {            
            e.getMessage();
        }        
        return null;
    }
    private Class getCommandClass(HttpServletRequest req){
        Class result;        
        final String command = "command."+(String)
        req.getParameter("command");
        try {
            result = Class.forName(command);
        }
        catch(ClassNotFoundException e) {
            result = UnknownCommand.class;
        }
        return result;
    }
    
    

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {        
        doGet(request,response);
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
