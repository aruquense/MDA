package command;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.Part;



public class UpdateUserCommand extends FrontCommand {
    HandlerBDD handler = new HandlerBDD();
    @Override
    public void process() {        
        HandlerBDD handler = new HandlerBDD();
        int idUser = Integer.parseInt(request.getParameter("idUser"));
        String nombre = request.getParameter("nombre");
        String correo = request.getParameter("correo");
        String contrasena = request.getParameter("contrasena");
        String contrasena2 = request.getParameter("contrasena2");
        String localizacion = request.getParameter("localizacion");
        handler.actualizarUsuario(idUser, nombre, correo, contrasena, contrasena2,localizacion);
        forward("/confirmacioncambiodatosusuario.jsp");
    }        
    

}
