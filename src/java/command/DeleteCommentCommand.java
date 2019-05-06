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
public class DeleteCommentCommand extends FrontCommand{

    @Override
    public void process() {
        HandlerBDD handler = new HandlerBDD();
        handler.deleteComment(Integer.parseInt(request.getParameter("idComment")));
        forward("/deleteConfirmation.jsp");
    }
    
}
