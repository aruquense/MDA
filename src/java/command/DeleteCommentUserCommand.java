/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package command;
public class DeleteCommentUserCommand extends FrontCommand{

    @Override
    public void process() {
        HandlerBDD handler = new HandlerBDD();
        handler.deleteCommentUser(Integer.parseInt(request.getParameter("idComment")));
        forward("/deleteConfirmation.jsp");
    }
    
}
