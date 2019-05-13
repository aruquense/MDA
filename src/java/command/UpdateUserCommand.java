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
import modelo.Usuario;



public class UpdateUserCommand extends FrontCommand {
    HandlerBDD handler = new HandlerBDD();
    @Override
    public void process() {        
        try {
            HandlerBDD handler = new HandlerBDD();
            int idUser = Integer.parseInt(request.getParameter("idUser"));
            String nombre = request.getParameter("nombre");
            String correo = request.getParameter("correo");
            String contrasena = request.getParameter("contrasena");
            String contrasena2 = request.getParameter("contrasena2");
            String localizacion = request.getParameter("localizacion");
            String path = uploadFile();
            handler.actualizarUsuario(idUser, nombre, correo, contrasena, contrasena2,localizacion,path);
            forward("/confirmacioncambiodatosusuario.jsp");
        } catch (IOException | ServletException ex) {
            Logger.getLogger(UpdateUserCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
    }        
    public String uploadFile() throws IOException, ServletException {        
        Part part = (Part) (Part) request.getPart("file");         
                        //new File("Ruta de la carpeta de cada miembro imgs en Netbeans")./imgs
                        
        File uploads = new File("C:\\Users\\carlosgustavo\\Documents\\NetBeansProjects\\MDA\\web\\imgs");
        //File uploads = new File("C:\\Users\\Aru\\Documents\\GitHub\\MDA\\web\\imgs");
        Usuario usuario = (Usuario) session.getAttribute("usuario");
                
        int tam = handler.encontrarNúmeroProductos()+1;
        File file = new File(uploads, "img"+tam+".jpg");
        try (InputStream input = part.getInputStream()) {
            Files.copy(input, file.toPath());
        }
        return "./imgs/usuarios/img"+usuario.getId()+".jpg";
    }
    

}
