/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

/**
 *
 * @author aru
 */
public class ComentarioUsuario {private Long idusuario, idvendedor;
    private String comentario;

    public Long getIdusuario() {
        return idusuario;
    }

    public void setIdusuario(Long idusuario) {
        this.idusuario = idusuario;
    }

    public Long getIdvendedor() {
        return idvendedor;
    }

    public void setIdvendedor(Long idvendedor) {
        this.idvendedor = idvendedor;
    }

    public String getComentario() {
        return comentario;
    }

    public void setComentario(String comentario) {
        this.comentario = comentario;
    }

    public ComentarioUsuario(Long idusuario, Long idvendedor, String comentario) {
        this.idusuario = idusuario;
        this.idvendedor = idvendedor;
        this.comentario = comentario;
    }
    
}
