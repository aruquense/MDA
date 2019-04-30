package command;

import java.util.logging.Level;
import java.util.logging.Logger;



public class RegisterUserCommand extends FrontCommand {
    HandlerBDD handler = new HandlerBDD();
    @Override
    public void process() {        
        try {
            
            String nombre = request.getParameter("user");
            String correo = request.getParameter("email");
            String contrasena = request.getParameter("password");
            String localizacion = request.getParameter("localizacion");            
            handler.registrarUsuario(nombre, correo, contrasena, localizacion);
            forward("/index2.jsp");
        } catch (Exception ex) {
            Logger.getLogger(RegisterUserCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
    }        
    

}
