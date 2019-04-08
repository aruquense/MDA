package command;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.Part;



public class UpdateUserCommand extends FrontCommand {
    HandlerBDD handler = new HandlerBDD();
    @Override
    public void process() {        
        try {
            
            String nombre = request.getParameter("nombre");
            String correo = request.getParameter("correo");
            String contrasena = request.getParameter("contrasena");
            String localizacion = request.getParameter("localizacion");
            handler.updateUser(nombre, correo, contrasena, localizacion);
            forward("/index.jsp");
        } catch (Exception ex) {
            Logger.getLogger(UpdateUserCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
    }        
    

}
