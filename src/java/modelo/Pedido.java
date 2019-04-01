package modelo;
public class Pedido {
    private Long id, idcomprador,idvendedor;
    private String estado;
    private int[] idproductos;

    public Pedido(Long id, Long idcomprador, Long idvendedor, String estado, int[] idproductos) {
        this.id = id;
        this.idcomprador = idcomprador;
        this.idvendedor = idvendedor;
        this.estado = estado;
        this.idproductos = idproductos;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getIdcomprador() {
        return idcomprador;
    }

    public void setIdcomprador(Long idcomprador) {
        this.idcomprador = idcomprador;
    }

    public Long getIdvendedor() {
        return idvendedor;
    }

    public void setIdvendedor(Long idvendedor) {
        this.idvendedor = idvendedor;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int[] getIdproductos() {
        return idproductos;
    }

    public void setIdproductos(int[] idproductos) {
        this.idproductos = idproductos;
    }

    @Override
    public String toString() {
        return "Pedido{" + "id=" + id + ", idcomprador=" + idcomprador + ", idvendedor=" + idvendedor + ", estado=" + estado + ", idproductos=" + idproductos + '}';
    }            
}
