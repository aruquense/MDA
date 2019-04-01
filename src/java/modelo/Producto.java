package modelo;
public class Producto {
    private Long id, idvendedor;
    private String nombre, descripcion,img;
    private Double precio;
    public Producto(Long id, String nombre, Long idvendedor, Double precio, String descripcion, String img) {
        this.id =id;
        this.nombre = nombre;
        this.idvendedor = idvendedor;
        this.precio = precio;
        this.descripcion = descripcion;
        this.img = img;                
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getIdvendedor() {
        return idvendedor;
    }

    public void setIdvendedor(Long idvendedor) {
        this.idvendedor = idvendedor;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public Double getPrecio() {
        return precio;
    }

    public void setPrecio(Double precio) {
        this.precio = precio;
    }

    @Override
    public String toString() {
        return "Producto{" + "id=" + id + ", idvendedor=" + idvendedor + ", nombre=" + nombre + ", descripcion=" + descripcion + ", img=" + img + ", precio=" + precio + '}';
    }
    
    
}
