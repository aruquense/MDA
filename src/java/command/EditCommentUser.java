/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package command;

/**
 *
 * @author orlan
 */
public class EditCommentUser extends FrontCommand {

    @Override
    public void process() {
        System.out.println("HEMOS ENTRADO EN EL EDIT COMMAND User");
        HandlerBDD handler = new HandlerBDD();
        handler.updateCommentUser(Integer.parseInt(request.getParameter("idMessage")), request.getParameter("comment"));
        System.out.println(request.getParameter("idMessage"));
        System.out.println( request.getParameter("comment"));
        forward("/editConfirmation.jsp");
    }
    
}