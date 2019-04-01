package modelo;

public class Usuario {
    private Long id, nVentas, nVisitas;
    private String nombre, correo, contrasena;
    private Double valoracion;
    private int[] idpedidos;
    private boolean espremium;

    public Usuario(Long id, Long nVentas, Long nVisitas, String nombre, String correo, String contrasena, Double valoracion, int[] idpedidos, boolean espremium) {
        this.id = id;
        this.nVentas = nVentas;
        this.nVisitas = nVisitas;
        this.nombre = nombre;
        this.correo = correo;
        this.contrasena = contrasena;
        this.valoracion = valoracion;
        this.idpedidos = idpedidos;
        this.espremium = espremium;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getnVentas() {
        return nVentas;
    }

    public void setnVentas(Long nVentas) {
        this.nVentas = nVentas;
    }

    public Long getnVisitas() {
        return nVisitas;
    }

    public void setnVisitas(Long nVisitas) {
        this.nVisitas = nVisitas;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public Double getValoracion() {
        return valoracion;
    }

    public void setValoracion(Double valoracion) {
        this.valoracion = valoracion;
    }

    public int[] getIdpedidos() {
        return idpedidos;
    }

    public void setIdpedidos(int[] idpedidos) {
        this.idpedidos = idpedidos;
    }

    public boolean isEspremium() {
        return espremium;
    }

    public void setEspremium(boolean espremium) {
        this.espremium = espremium;
    }

    @Override
    public String toString() {
        return "Usuario{" + "id=" + id + ", nVentas=" + nVentas + ", nVisitas=" + nVisitas + ", nombre=" + nombre + ", correo=" + correo + ", contrasena=" + contrasena + ", valoracion=" + valoracion + ", idpedidos=" + idpedidos + ", espremium=" + espremium + '}';
    }
    
}
